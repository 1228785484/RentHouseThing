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
import com.ruoyi.system.domain.Propertyattributes;
import com.ruoyi.system.service.IPropertyattributesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源属性信息Controller
 * 
 * @author ruoyi
 * @date 2024-10-07
 */
@RestController
@RequestMapping("/system/propertyattributes")
public class PropertyattributesController extends BaseController
{
    @Autowired
    private IPropertyattributesService propertyattributesService;

    /**
     * 查询房源属性信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:propertyattributes:list')")
    @GetMapping("/list")
    public TableDataInfo list(Propertyattributes propertyattributes)
    {
        startPage();
        List<Propertyattributes> list = propertyattributesService.selectPropertyattributesList(propertyattributes);
        return getDataTable(list);
    }

    /**
     * 导出房源属性信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:propertyattributes:export')")
    @Log(title = "房源属性信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Propertyattributes propertyattributes)
    {
        List<Propertyattributes> list = propertyattributesService.selectPropertyattributesList(propertyattributes);
        ExcelUtil<Propertyattributes> util = new ExcelUtil<Propertyattributes>(Propertyattributes.class);
        util.exportExcel(response, list, "房源属性信息数据");
    }

    /**
     * 获取房源属性信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:propertyattributes:query')")
    @GetMapping(value = "/{attributeId}")
    public AjaxResult getInfo(@PathVariable("attributeId") Long attributeId)
    {
        return success(propertyattributesService.selectPropertyattributesByAttributeId(attributeId));
    }

    /**
     * 新增房源属性信息
     */
    @PreAuthorize("@ss.hasPermi('system:propertyattributes:add')")
    @Log(title = "房源属性信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Propertyattributes propertyattributes)
    {
        return toAjax(propertyattributesService.insertPropertyattributes(propertyattributes));
    }

    /**
     * 修改房源属性信息
     */
    @PreAuthorize("@ss.hasPermi('system:propertyattributes:edit')")
    @Log(title = "房源属性信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Propertyattributes propertyattributes)
    {
        return toAjax(propertyattributesService.updatePropertyattributes(propertyattributes));
    }

    /**
     * 删除房源属性信息
     */
    @PreAuthorize("@ss.hasPermi('system:propertyattributes:remove')")
    @Log(title = "房源属性信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{attributeIds}")
    public AjaxResult remove(@PathVariable Long[] attributeIds)
    {
        return toAjax(propertyattributesService.deletePropertyattributesByAttributeIds(attributeIds));
    }
}
