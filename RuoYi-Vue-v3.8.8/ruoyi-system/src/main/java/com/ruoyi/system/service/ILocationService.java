package com.ruoyi.system.service;

import com.ruoyi.system.domain.Location;
import java.util.List;


import java.util.Locale;

public interface ILocationService {
    List<Location> getProvinceList();
    List<Location> getCityList(Long provinceCode);
    List<Location> getAreaList(Long cityCode);
}
