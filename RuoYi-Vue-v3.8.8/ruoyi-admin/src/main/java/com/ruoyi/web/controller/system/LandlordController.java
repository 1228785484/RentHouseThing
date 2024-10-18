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
import com.ruoyi.system.domain.Landlord;
import com.ruoyi.system.service.ILandlordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房东信息Controller
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
@RestController
@RequestMapping("/system/landlord")
public class LandlordController extends BaseController
{
    @Autowired
    private ILandlordService landlordService;

    /**
     * 查询房东信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:landlord:list')")
    @GetMapping("/list")
    public TableDataInfo list(Landlord landlord)
    {
        startPage();
        List<Landlord> list = landlordService.selectLandlordList(landlord);
        return getDataTable(list);
    }

    @GetMapping("/ids")
    public List<Long> getAllLandlordIds() {
        return landlordService.getAllLandlordIds();
    }




    /**
     * 导出房东信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:landlord:export')")
    @Log(title = "房东信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Landlord landlord)
    {
        List<Landlord> list = landlordService.selectLandlordList(landlord);
        ExcelUtil<Landlord> util = new ExcelUtil<Landlord>(Landlord.class);
        util.exportExcel(response, list, "房东信息数据");
    }

    /**
     * 获取房东信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:landlord:query')")
    @GetMapping(value = "/{landlordId}")
    public AjaxResult getInfo(@PathVariable("landlordId") Long landlordId)
    {
        return success(landlordService.selectLandlordByLandlordId(landlordId));
    }

    /**
     * 新增房东信息
     */
    @PreAuthorize("@ss.hasPermi('system:landlord:add')")
    @Log(title = "房东信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Landlord landlord)
    {
        return toAjax(landlordService.insertLandlord(landlord));
    }

    /**
     * 修改房东信息
     */
    @PreAuthorize("@ss.hasPermi('system:landlord:edit')")
    @Log(title = "房东信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Landlord landlord)
    {
        return toAjax(landlordService.updateLandlord(landlord));
    }

    /**
     * 删除房东信息
     */
    @PreAuthorize("@ss.hasPermi('system:landlord:remove')")
    @Log(title = "房东信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{landlordIds}")
    public AjaxResult remove(@PathVariable Long[] landlordIds)
    {
        return toAjax(landlordService.deleteLandlordByLandlordIds(landlordIds));
    }
}
