package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Tenant;

/**
 * 租户信息Service接口
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
public interface ITenantService 
{
    /**
     * 查询租户信息
     * 
     * @param tenantId 租户信息主键
     * @return 租户信息
     */
    public Tenant selectTenantByTenantId(Long tenantId);

    /**
     * 查询租户信息列表
     * 
     * @param tenant 租户信息
     * @return 租户信息集合
     */
    public List<Tenant> selectTenantList(Tenant tenant);

    /**
     * 新增租户信息
     * 
     * @param tenant 租户信息
     * @return 结果
     */
    public int insertTenant(Tenant tenant);

    /**
     * 修改租户信息
     * 
     * @param tenant 租户信息
     * @return 结果
     */
    public int updateTenant(Tenant tenant);

    /**
     * 批量删除租户信息
     * 
     * @param tenantIds 需要删除的租户信息主键集合
     * @return 结果
     */
    public int deleteTenantByTenantIds(Long[] tenantIds);

    /**
     * 删除租户信息信息
     * 
     * @param tenantId 租户信息主键
     * @return 结果
     */
    public int deleteTenantByTenantId(Long tenantId);
}
