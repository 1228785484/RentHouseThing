package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Property;
import com.ruoyi.system.service.IPropertyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源信息Controller
 * 
 * @author ruoyi
 * @date 2024-10-09
 */
@RestController
@RequestMapping("/system/property")
public class PropertyController extends BaseController
{
    @Autowired
    private IPropertyService propertyService;

    /**
     * 查询房源信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:property:list')")
    @GetMapping("/list")
    public TableDataInfo list(Property property)
    {
        startPage();
        List<Property> list = propertyService.selectPropertyList(property);
        return getDataTable(list);
    }

    /**
     * 导出房源信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:property:export')")
    @Log(title = "房源信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Property property)
    {
        List<Property> list = propertyService.selectPropertyList(property);
        ExcelUtil<Property> util = new ExcelUtil<Property>(Property.class);
        util.exportExcel(response, list, "房源信息数据");
    }

    /**
     * 获取房源信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:property:query')")
    @GetMapping(value = "/{propertyId}")
    public AjaxResult getInfo(@PathVariable("propertyId") Long propertyId)
    {
        return success(propertyService.selectPropertyByPropertyId(propertyId));
    }

    /**
     * 新增房源信息
     */
    @PreAuthorize("@ss.hasPermi('system:property:add')")
    @Log(title = "房源信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Property property)
    {
        return toAjax(propertyService.insertProperty(property));
    }

    /**
     * 修改房源信息
     */
    @PreAuthorize("@ss.hasPermi('system:property:edit')")
    @Log(title = "房源信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Property property)
    {
        return toAjax(propertyService.updateProperty(property));
    }

    /**
     * 删除房源信息
     */
    @PreAuthorize("@ss.hasPermi('system:property:remove')")
    @Log(title = "房源信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{propertyIds}")
    public AjaxResult remove(@PathVariable Long[] propertyIds)
    {
        return toAjax(propertyService.deletePropertyByPropertyIds(propertyIds));
    }
}
