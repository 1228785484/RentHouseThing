package com.ruoyi.system.service;

import com.ruoyi.system.domain.Location;
import java.util.List;


import java.util.Locale;

public interface ILocationService {
    List<Location> getProvinceList();
    List<Location> getCityList(int provinceCode);
    List<Location> getAreaList(int cityCode);
}
