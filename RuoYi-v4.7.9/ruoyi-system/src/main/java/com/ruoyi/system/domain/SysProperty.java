package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源编辑表对象 sys_property
 * 
 * @author SevenGod
 * @date 2024-09-25
 */
public class SysProperty extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房源id */
    private Long propertyId;

    /** 房东id */
    @Excel(name = "房东id")
    private Long landlordId;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 租金 */
    @Excel(name = "租金")
    private BigDecimal rentPrice;

    /** 押金 */
    @Excel(name = "押金")
    private BigDecimal deposit;

    /** 是否可用 */
    @Excel(name = "是否可用")
    private Integer available;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setPropertyId(Long propertyId) 
    {
        this.propertyId = propertyId;
    }

    public Long getPropertyId() 
    {
        return propertyId;
    }

    public void setLandlordId(Long landlordId) 
    {
        this.landlordId = landlordId;
    }

    public Long getLandlordId() 
    {
        return landlordId;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setRentPrice(BigDecimal rentPrice) 
    {
        this.rentPrice = rentPrice;
    }

    public BigDecimal getRentPrice() 
    {
        return rentPrice;
    }

    public void setDeposit(BigDecimal deposit) 
    {
        this.deposit = deposit;
    }

    public BigDecimal getDeposit() 
    {
        return deposit;
    }

    public void setAvailable(Integer available) 
    {
        this.available = available;
    }

    public Integer getAvailable() 
    {
        return available;
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
            .append("propertyId", getPropertyId())
            .append("landlordId", getLandlordId())
            .append("address", getAddress())
            .append("rentPrice", getRentPrice())
            .append("deposit", getDeposit())
            .append("available", getAvailable())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
