package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 租赁合同信息对象 leaseagreement
 * 
 * @author ruoyi
 * @date 2024-10-17
 */
public class Leaseagreement extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 合同ID */
    private Long agreementId;

    /** 租户ID */
    @Excel(name = "租户ID")
    private Long tenantId;

    /** 房源ID */
    @Excel(name = "房源ID")
    private Long propertyId;

    /** 合同开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "合同开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 合同结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "合同结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 每月租金 */
    @Excel(name = "每月租金")
    private BigDecimal monthlyRent;

    /** 合同押金支付方式 */
    @Excel(name = "合同押金支付方式")
    private String agreementType;

    /** 合同状态 */
    @Excel(name = "合同状态")
    private String status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setAgreementId(Long agreementId) 
    {
        this.agreementId = agreementId;
    }

    public Long getAgreementId() 
    {
        return agreementId;
    }
    public void setTenantId(Long tenantId) 
    {
        this.tenantId = tenantId;
    }

    public Long getTenantId() 
    {
        return tenantId;
    }
    public void setPropertyId(Long propertyId) 
    {
        this.propertyId = propertyId;
    }

    public Long getPropertyId() 
    {
        return propertyId;
    }
    public void setStartDate(Date startDate) 
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }
    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }
    public void setMonthlyRent(BigDecimal monthlyRent) 
    {
        this.monthlyRent = monthlyRent;
    }

    public BigDecimal getMonthlyRent() 
    {
        return monthlyRent;
    }
    public void setAgreementType(String agreementType) 
    {
        this.agreementType = agreementType;
    }

    public String getAgreementType() 
    {
        return agreementType;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("agreementId", getAgreementId())
            .append("tenantId", getTenantId())
            .append("propertyId", getPropertyId())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("monthlyRent", getMonthlyRent())
            .append("agreementType", getAgreementType())
            .append("status", getStatus())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
