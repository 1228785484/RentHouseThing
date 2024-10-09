package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源信息对象 property
 * 
 * @author ruoyi
 * @date 2024-10-09
 */
public class Property extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房源ID */
    private Long propertyId;

    /** 房东ID */
    @Excel(name = "房东ID")
    private Long landlordId;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 租金价格 */
    @Excel(name = "租金价格")
    private BigDecimal rentPrice;

    /** 押金 */
    @Excel(name = "押金")
    private BigDecimal deposit;

    /** 是否可用 */
    @Excel(name = "是否可用")
    private String available;

    /** 图片路径 */
    @Excel(name = "图片路径")
    private String imageUrl;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 房源名字 */
    @Excel(name = "房源名字")
    private String propertyName;

    /** 房源属性信息信息 */
    private List<Propertyattributes> propertyattributesList;

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
    public void setAvailable(String available) 
    {
        this.available = available;
    }

    public String getAvailable() 
    {
        return available;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }
    public void setPropertyName(String propertyName) 
    {
        this.propertyName = propertyName;
    }

    public String getPropertyName() 
    {
        return propertyName;
    }

    public List<Propertyattributes> getPropertyattributesList()
    {
        return propertyattributesList;
    }

    public void setPropertyattributesList(List<Propertyattributes> propertyattributesList)
    {
        this.propertyattributesList = propertyattributesList;
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
            .append("imageUrl", getImageUrl())
            .append("createdAt", getCreatedAt())
            .append("propertyName", getPropertyName())
            .append("propertyattributesList", getPropertyattributesList())
            .toString();
    }
}
