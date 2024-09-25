package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysProperty;
import com.ruoyi.system.service.ISysPropertyService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源编辑表Controller
 * 
 * @author SevenGod
 * @date 2024-09-25
 */
@Controller
@RequestMapping("/system/property")
public class SysPropertyController extends BaseController
{
    private String prefix = "system/property";

    @Autowired
    private ISysPropertyService sysPropertyService;

    @RequiresPermissions("system:property:view")
    @GetMapping()
    public String property()
    {
        return prefix + "/property";
    }

    /**
     * 查询房源编辑表列表
     */
    @RequiresPermissions("system:property:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysProperty sysProperty)
    {
        startPage();
        List<SysProperty> list = sysPropertyService.selectSysPropertyList(sysProperty);
        return getDataTable(list);
    }

    /**
     * 导出房源编辑表列表
     */
    @RequiresPermissions("system:property:export")
    @Log(title = "房源编辑表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysProperty sysProperty)
    {
        List<SysProperty> list = sysPropertyService.selectSysPropertyList(sysProperty);
        ExcelUtil<SysProperty> util = new ExcelUtil<SysProperty>(SysProperty.class);
        return util.exportExcel(list, "房源编辑表数据");
    }

    /**
     * 新增房源编辑表
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存房源编辑表
     */
    @RequiresPermissions("system:property:add")
    @Log(title = "房源编辑表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysProperty sysProperty)
    {
        return toAjax(sysPropertyService.insertSysProperty(sysProperty));
    }

    /**
     * 修改房源编辑表
     */
    @RequiresPermissions("system:property:edit")
    @GetMapping("/edit/{propertyId}")
    public String edit(@PathVariable("propertyId") Long propertyId, ModelMap mmap)
    {
        SysProperty sysProperty = sysPropertyService.selectSysPropertyByPropertyId(propertyId);
        mmap.put("sysProperty", sysProperty);
        return prefix + "/edit";
    }

    /**
     * 修改保存房源编辑表
     */
    @RequiresPermissions("system:property:edit")
    @Log(title = "房源编辑表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysProperty sysProperty)
    {
        return toAjax(sysPropertyService.updateSysProperty(sysProperty));
    }

    /**
     * 删除房源编辑表
     */
    @RequiresPermissions("system:property:remove")
    @Log(title = "房源编辑表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysPropertyService.deleteSysPropertyByPropertyIds(ids));
    }
}
