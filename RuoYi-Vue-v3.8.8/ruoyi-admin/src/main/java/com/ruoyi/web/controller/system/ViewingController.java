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
import com.ruoyi.system.domain.Viewing;
import com.ruoyi.system.service.IViewingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 看房信息Controller
 * 
 * @author ruoyi
 * @date 2024-10-15
 */
@RestController
@RequestMapping("/system/viewing")
public class ViewingController extends BaseController
{
    @Autowired
    private IViewingService viewingService;

    /**
     * 查询看房信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:viewing:list')")
    @GetMapping("/list")
    public TableDataInfo list(Viewing viewing)
    {
        startPage();
        List<Viewing> list = viewingService.selectViewingList(viewing);
        return getDataTable(list);
    }

    /**
     * 导出看房信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:viewing:export')")
    @Log(title = "看房信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Viewing viewing)
    {
        List<Viewing> list = viewingService.selectViewingList(viewing);
        ExcelUtil<Viewing> util = new ExcelUtil<Viewing>(Viewing.class);
        util.exportExcel(response, list, "看房信息数据");
    }

    /**
     * 获取看房信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:viewing:query')")
    @GetMapping(value = "/{viewingId}")
    public AjaxResult getInfo(@PathVariable("viewingId") Long viewingId)
    {
        return success(viewingService.selectViewingByViewingId(viewingId));
    }

    /**
     * 新增看房信息
     */
    @PreAuthorize("@ss.hasPermi('system:viewing:add')")
    @Log(title = "看房信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Viewing viewing)
    {
        return toAjax(viewingService.insertViewing(viewing));
    }

    /**
     * 修改看房信息
     */
    @PreAuthorize("@ss.hasPermi('system:viewing:edit')")
    @Log(title = "看房信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Viewing viewing)
    {
        return toAjax(viewingService.updateViewing(viewing));
    }

    /**
     * 删除看房信息
     */
    @PreAuthorize("@ss.hasPermi('system:viewing:remove')")
    @Log(title = "看房信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{viewingIds}")
    public AjaxResult remove(@PathVariable Long[] viewingIds)
    {
        return toAjax(viewingService.deleteViewingByViewingIds(viewingIds));
    }
}
