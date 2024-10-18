package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Leaseagreement;

/**
 * 租赁合同信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-17
 */
public interface LeaseagreementMapper 
{
    /**
     * 查询租赁合同信息
     * 
     * @param agreementId 租赁合同信息主键
     * @return 租赁合同信息
     */
    public Leaseagreement selectLeaseagreementByAgreementId(Long agreementId);

    /**
     * 查询租赁合同信息列表
     * 
     * @param leaseagreement 租赁合同信息
     * @return 租赁合同信息集合
     */
    public List<Leaseagreement> selectLeaseagreementList(Leaseagreement leaseagreement);

    /**
     * 新增租赁合同信息
     * 
     * @param leaseagreement 租赁合同信息
     * @return 结果
     */
    public int insertLeaseagreement(Leaseagreement leaseagreement);

    /**
     * 修改租赁合同信息
     * 
     * @param leaseagreement 租赁合同信息
     * @return 结果
     */
    public int updateLeaseagreement(Leaseagreement leaseagreement);

    /**
     * 删除租赁合同信息
     * 
     * @param agreementId 租赁合同信息主键
     * @return 结果
     */
    public int deleteLeaseagreementByAgreementId(Long agreementId);

    /**
     * 批量删除租赁合同信息
     * 
     * @param agreementIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLeaseagreementByAgreementIds(Long[] agreementIds);
}
