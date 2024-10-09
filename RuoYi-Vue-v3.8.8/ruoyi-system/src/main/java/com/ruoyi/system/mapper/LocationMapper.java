package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Location;
import java.util.List;

public interface LocationMapper {
    public List<Location> getProvinceList();
    public List<Location> getCityList(Integer provinceCode);
    public List<Location> getAreaList(Integer cityCode);

}
