package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Location;
import com.ruoyi.system.mapper.LocationMapper;
import com.ruoyi.system.service.ILocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocationServiceImpl implements ILocationService {
    @Autowired
    private LocationMapper locationMapper;
    @Cacheable(value = "provinceCache")
    public List<Location> getProvinceList(){
        return locationMapper.getProvinceList();
    }
    @Cacheable(value = "cityCache", key = "#provinceCode")
    public List<Location> getCityList(Long provinceCode){
        return locationMapper.getCityList(provinceCode);
    }
    @Cacheable(value = "areaCache", key = "#cityCode")
    public List<Location> getAreaList(Long cityCode){
        return locationMapper.getAreaList(cityCode);
    }


}
