package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LeaseagreementMapper;
import com.ruoyi.system.domain.Leaseagreement;
import com.ruoyi.system.service.ILeaseagreementService;

/**
 * 租赁合同信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-17
 */
@Service
public class LeaseagreementServiceImpl implements ILeaseagreementService 
{
    @Autowired
    private LeaseagreementMapper leaseagreementMapper;

    /**
     * 查询租赁合同信息
     * 
     * @param agreementId 租赁合同信息主键
     * @return 租赁合同信息
     */
    @Override
    public Leaseagreement selectLeaseagreementByAgreementId(Long agreementId)
    {
        return leaseagreementMapper.selectLeaseagreementByAgreementId(agreementId);
    }

    /**
     * 查询租赁合同信息列表
     * 
     * @param leaseagreement 租赁合同信息
     * @return 租赁合同信息
     */
    @Override
    public List<Leaseagreement> selectLeaseagreementList(Leaseagreement leaseagreement)
    {
        return leaseagreementMapper.selectLeaseagreementList(leaseagreement);
    }

    /**
     * 新增租赁合同信息
     * 
     * @param leaseagreement 租赁合同信息
     * @return 结果
     */
    @Override
    public int insertLeaseagreement(Leaseagreement leaseagreement)
    {
        return leaseagreementMapper.insertLeaseagreement(leaseagreement);
    }

    /**
     * 修改租赁合同信息
     * 
     * @param leaseagreement 租赁合同信息
     * @return 结果
     */
    @Override
    public int updateLeaseagreement(Leaseagreement leaseagreement)
    {
        return leaseagreementMapper.updateLeaseagreement(leaseagreement);
    }

    /**
     * 批量删除租赁合同信息
     * 
     * @param agreementIds 需要删除的租赁合同信息主键
     * @return 结果
     */
    @Override
    public int deleteLeaseagreementByAgreementIds(Long[] agreementIds)
    {
        return leaseagreementMapper.deleteLeaseagreementByAgreementIds(agreementIds);
    }

    /**
     * 删除租赁合同信息信息
     * 
     * @param agreementId 租赁合同信息主键
     * @return 结果
     */
    @Override
    public int deleteLeaseagreementByAgreementId(Long agreementId)
    {
        return leaseagreementMapper.deleteLeaseagreementByAgreementId(agreementId);
    }
}
