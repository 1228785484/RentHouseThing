package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Location;
import com.ruoyi.system.mapper.LocationMapper;
import com.ruoyi.system.service.ILocationService;
import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import java.util.concurrent.TimeUnit;


import java.util.List;

@Service
public class LocationServiceImpl implements ILocationService {
    @Autowired
    private LocationMapper locationMapper;
    @Autowired
    private RedissonClient client;

    private static final String PROVINCE_CACHE_KEY = "location:province";
    private static final String CITY_CACHE_KEY = "location:city:";
    private static final String AREA_CACHE_KEY = "location:area:";

    // 缓存过期时间设置
    private static final long CACHE_EXPIRE_TIME = 24;
    private static final TimeUnit CACHE_EXPIRE_TIMEUNIT = TimeUnit.HOURS;

    public List<Location> getProvinceList(){
        // 获取省份缓存Map
        RMap<String, List<Location>> provinceCache = client.getMap(PROVINCE_CACHE_KEY);

        // 如果缓存中存在，直接返回
        if (provinceCache.containsKey(PROVINCE_CACHE_KEY)) {
            return provinceCache.get(PROVINCE_CACHE_KEY);
        }

        // 如果缓存中不存在，从数据库查询
        List<Location> provinceList = locationMapper.getProvinceList();
        // 放入缓存并设置过期时间
        provinceCache.put(PROVINCE_CACHE_KEY, provinceList);
        provinceCache.expire(CACHE_EXPIRE_TIME, CACHE_EXPIRE_TIMEUNIT);

        return provinceList;
    }
    public List<Location> getCityList(Long provinceCode) {
        String cacheKey = CITY_CACHE_KEY + provinceCode;
        RMap<String, List<Location>> cityCache = client.getMap(cacheKey);

        // 如果缓存中存在，直接返回
        if (cityCache.containsKey(cacheKey)) {
            return cityCache.get(cacheKey);
        }

        // 如果缓存中不存在，从数据库查询
        List<Location> cityList = locationMapper.getCityList(provinceCode);
        // 放入缓存并设置过期时间
        cityCache.put(cacheKey, cityList);
        cityCache.expire(CACHE_EXPIRE_TIME, CACHE_EXPIRE_TIMEUNIT);

        return cityList;
    }

    public List<Location> getAreaList(Long cityCode) {
        String cacheKey = AREA_CACHE_KEY + cityCode;
        RMap<String, List<Location>> areaCache = client.getMap(cacheKey);

        // 如果缓存中存在，直接返回
        if (areaCache.containsKey(cacheKey)) {
            return areaCache.get(cacheKey);
        }

        // 如果缓存中不存在，从数据库查询
        List<Location> areaList = locationMapper.getAreaList(cityCode);
        // 放入缓存并设置过期时间
        areaCache.put(cacheKey, areaList);
        areaCache.expire(CACHE_EXPIRE_TIME, CACHE_EXPIRE_TIMEUNIT);

        return areaList;
    }


}
