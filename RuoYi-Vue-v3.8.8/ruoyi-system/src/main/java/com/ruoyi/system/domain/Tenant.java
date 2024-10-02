package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 租户信息对象 tenant
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
public class Tenant extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 租户ID */
    private Long tenantId;

    /** 租户姓名 */
    @Excel(name = "租户姓名")
    private String name;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactNumber;

    /** 邮箱地址 */
    @Excel(name = "邮箱地址")
    private String email;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String identificationNumber;

    /** 看房需求 */
    @Excel(name = "看房需求")
    private Integer viewingDemand;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setTenantId(Long tenantId) 
    {
        this.tenantId = tenantId;
    }

    public Long getTenantId() 
    {
        return tenantId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setContactNumber(String contactNumber) 
    {
        this.contactNumber = contactNumber;
    }

    public String getContactNumber() 
    {
        return contactNumber;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setIdentificationNumber(String identificationNumber) 
    {
        this.identificationNumber = identificationNumber;
    }

    public String getIdentificationNumber() 
    {
        return identificationNumber;
    }
    public void setViewingDemand(Integer viewingDemand) 
    {
        this.viewingDemand = viewingDemand;
    }

    public Integer getViewingDemand() 
    {
        return viewingDemand;
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
            .append("tenantId", getTenantId())
            .append("name", getName())
            .append("contactNumber", getContactNumber())
            .append("email", getEmail())
            .append("identificationNumber", getIdentificationNumber())
            .append("viewingDemand", getViewingDemand())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
