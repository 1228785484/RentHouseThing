package com.ruoyi.web.controller.system;

import com.ruoyi.system.domain.Location;
import com.ruoyi.system.service.ILocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/location")
public class LocationController {
    @Autowired
    private ILocationService locationService;

    @RequestMapping("/listProvince")
    public List<Location> getProvinceList(){
        return locationService.getProvinceList();
    }
}
