package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 看房信息对象 viewing
 * 
 * @author ruoyi
 * @date 2024-10-14
 */
public class Viewing extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 看房ID */
    private Long viewingId;

    /** 租户ID */
    @Excel(name = "租户ID")
    private Long tenantId;

    /** 房源ID */
    @Excel(name = "房源ID")
    private Long propertyId;

    /** 预约看房时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预约看房时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date scheduledTime;

    /** 看房状态 */
    @Excel(name = "看房状态")
    private String status;

    /** 备注信息 */
    @Excel(name = "备注信息")
    private String notes;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setViewingId(Long viewingId) 
    {
        this.viewingId = viewingId;
    }

    public Long getViewingId() 
    {
        return viewingId;
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
    public void setScheduledTime(Date scheduledTime) 
    {
        this.scheduledTime = scheduledTime;
    }

    public Date getScheduledTime() 
    {
        return scheduledTime;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setNotes(String notes) 
    {
        this.notes = notes;
    }

    public String getNotes() 
    {
        return notes;
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
            .append("viewingId", getViewingId())
            .append("tenantId", getTenantId())
            .append("propertyId", getPropertyId())
            .append("scheduledTime", getScheduledTime())
            .append("status", getStatus())
            .append("notes", getNotes())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
