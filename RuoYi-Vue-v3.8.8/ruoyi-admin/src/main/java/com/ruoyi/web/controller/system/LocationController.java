package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.Location;
import com.ruoyi.system.service.ILocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/location")
public class LocationController {
    @Autowired
    private ILocationService locationService;

    @GetMapping("/province")
    public AjaxResult getProvinceList(){
        List<Location> LocList = locationService.getProvinceList();
        AjaxResult res = AjaxResult.success(LocList);
        return res.put("data",LocList);
    }
    @GetMapping("/city")
    //这边必须要包装好的参数，不能用int，因为int不能为null
    public AjaxResult getCityFromProvince(Long provinceCode){
        List<Location> LocList = locationService.getCityList(provinceCode);
        AjaxResult res = AjaxResult.success(LocList);
        return res.put("data",LocList);
    }
    @GetMapping("/area")
    public AjaxResult getAreaFromCity(Long cityCode){
        List<Location> LocList = locationService.getAreaList(cityCode);
        AjaxResult res = AjaxResult.success(LocList);
        return res.put("data",LocList);
    }


}
