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
import com.ruoyi.system.domain.Tenant;
import com.ruoyi.system.service.ITenantService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 租户信息Controller
 * 
 * @author ruoyi
 * @date 2024-10-09
 */
@RestController
@RequestMapping("/system/tenant")
public class TenantController extends BaseController
{
    @Autowired
    private ITenantService tenantService;

    /**
     * 查询租户信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenant:list')")
    @GetMapping("/list")
    public TableDataInfo list(Tenant tenant)
    {
        startPage();
        List<Tenant> list = tenantService.selectTenantList(tenant);
        return getDataTable(list);
    }

    /**
     * 导出租户信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:tenant:export')")
    @Log(title = "租户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Tenant tenant)
    {
        List<Tenant> list = tenantService.selectTenantList(tenant);
        ExcelUtil<Tenant> util = new ExcelUtil<Tenant>(Tenant.class);
        util.exportExcel(response, list, "租户信息数据");
    }

    /**
     * 获取租户信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenant:query')")
    @GetMapping(value = "/{tenantId}")
    public AjaxResult getInfo(@PathVariable("tenantId") Long tenantId)
    {
        return success(tenantService.selectTenantByTenantId(tenantId));
    }

    /**
     * 新增租户信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenant:add')")
    @Log(title = "租户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Tenant tenant)
    {
        return toAjax(tenantService.insertTenant(tenant));
    }

    /**
     * 修改租户信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenant:edit')")
    @Log(title = "租户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Tenant tenant)
    {
        return toAjax(tenantService.updateTenant(tenant));
    }

    /**
     * 删除租户信息
     */
    @PreAuthorize("@ss.hasPermi('system:tenant:remove')")
    @Log(title = "租户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{tenantIds}")
    public AjaxResult remove(@PathVariable Long[] tenantIds)
    {
        return toAjax(tenantService.deleteTenantByTenantIds(tenantIds));
    }
}
