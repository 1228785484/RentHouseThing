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
import com.ruoyi.system.domain.Leaseagreement;
import com.ruoyi.system.service.ILeaseagreementService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 租赁合同信息Controller
 * 
 * @author ruoyi
 * @date 2024-10-17
 */
@RestController
@RequestMapping("/system/leaseagreement")
public class LeaseagreementController extends BaseController
{
    @Autowired
    private ILeaseagreementService leaseagreementService;

    /**
     * 查询租赁合同信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:leaseagreement:list')")
    @GetMapping("/list")
    public TableDataInfo list(Leaseagreement leaseagreement)
    {
        startPage();
        List<Leaseagreement> list = leaseagreementService.selectLeaseagreementList(leaseagreement);
        return getDataTable(list);
    }

    /**
     * 导出租赁合同信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:leaseagreement:export')")
    @Log(title = "租赁合同信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Leaseagreement leaseagreement)
    {
        List<Leaseagreement> list = leaseagreementService.selectLeaseagreementList(leaseagreement);
        ExcelUtil<Leaseagreement> util = new ExcelUtil<Leaseagreement>(Leaseagreement.class);
        util.exportExcel(response, list, "租赁合同信息数据");
    }

    /**
     * 获取租赁合同信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:leaseagreement:query')")
    @GetMapping(value = "/{agreementId}")
    public AjaxResult getInfo(@PathVariable("agreementId") Long agreementId)
    {
        return success(leaseagreementService.selectLeaseagreementByAgreementId(agreementId));
    }

    /**
     * 新增租赁合同信息
     */
    @PreAuthorize("@ss.hasPermi('system:leaseagreement:add')")
    @Log(title = "租赁合同信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Leaseagreement leaseagreement)
    {
        return toAjax(leaseagreementService.insertLeaseagreement(leaseagreement));
    }

    /**
     * 修改租赁合同信息
     */
    @PreAuthorize("@ss.hasPermi('system:leaseagreement:edit')")
    @Log(title = "租赁合同信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Leaseagreement leaseagreement)
    {
        return toAjax(leaseagreementService.updateLeaseagreement(leaseagreement));
    }

    /**
     * 删除租赁合同信息
     */
    @PreAuthorize("@ss.hasPermi('system:leaseagreement:remove')")
    @Log(title = "租赁合同信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{agreementIds}")
    public AjaxResult remove(@PathVariable Long[] agreementIds)
    {
        return toAjax(leaseagreementService.deleteLeaseagreementByAgreementIds(agreementIds));
    }
}
