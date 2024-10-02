package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TenantMapper;
import com.ruoyi.system.domain.Tenant;
import com.ruoyi.system.service.ITenantService;

/**
 * 租户信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
@Service
public class TenantServiceImpl implements ITenantService 
{
    @Autowired
    private TenantMapper tenantMapper;

    /**
     * 查询租户信息
     * 
     * @param tenantId 租户信息主键
     * @return 租户信息
     */
    @Override
    public Tenant selectTenantByTenantId(Long tenantId)
    {
        return tenantMapper.selectTenantByTenantId(tenantId);
    }

    /**
     * 查询租户信息列表
     * 
     * @param tenant 租户信息
     * @return 租户信息
     */
    @Override
    public List<Tenant> selectTenantList(Tenant tenant)
    {
        return tenantMapper.selectTenantList(tenant);
    }

    /**
     * 新增租户信息
     * 
     * @param tenant 租户信息
     * @return 结果
     */
    @Override
    public int insertTenant(Tenant tenant)
    {
        return tenantMapper.insertTenant(tenant);
    }

    /**
     * 修改租户信息
     * 
     * @param tenant 租户信息
     * @return 结果
     */
    @Override
    public int updateTenant(Tenant tenant)
    {
        return tenantMapper.updateTenant(tenant);
    }

    /**
     * 批量删除租户信息
     * 
     * @param tenantIds 需要删除的租户信息主键
     * @return 结果
     */
    @Override
    public int deleteTenantByTenantIds(Long[] tenantIds)
    {
        return tenantMapper.deleteTenantByTenantIds(tenantIds);
    }

    /**
     * 删除租户信息信息
     * 
     * @param tenantId 租户信息主键
     * @return 结果
     */
    @Override
    public int deleteTenantByTenantId(Long tenantId)
    {
        return tenantMapper.deleteTenantByTenantId(tenantId);
    }
}
