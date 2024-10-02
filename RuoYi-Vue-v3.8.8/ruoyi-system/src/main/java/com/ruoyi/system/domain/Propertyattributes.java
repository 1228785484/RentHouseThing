package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源属性信息对象 propertyattributes
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
public class Propertyattributes extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 属性ID */
    private Long attributeId;

    /** 房源ID */
    @Excel(name = "房源ID")
    private Long propertyId;

    /** 朝向 */
    @Excel(name = "朝向")
    private String orientation;

    /** 是否有独立卫浴 */
    @Excel(name = "是否有独立卫浴")
    private Integer hasIndependentBathroom;

    /** 是否有空调 */
    @Excel(name = "是否有空调")
    private Integer hasAirConditioning;

    /** 几人间 */
    @Excel(name = "几人间")
    private Long numberOfBeds;

    /** 房间结构 */
    @Excel(name = "房间结构")
    private String roomStructure;

    /** 是否有阳台 */
    @Excel(name = "是否有阳台")
    private Integer hasBalcony;

    /** 家具种类 */
    @Excel(name = "家具种类")
    private String furnitureTypes;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setAttributeId(Long attributeId) 
    {
        this.attributeId = attributeId;
    }

    public Long getAttributeId() 
    {
        return attributeId;
    }
    public void setPropertyId(Long propertyId) 
    {
        this.propertyId = propertyId;
    }

    public Long getPropertyId() 
    {
        return propertyId;
    }
    public void setOrientation(String orientation) 
    {
        this.orientation = orientation;
    }

    public String getOrientation() 
    {
        return orientation;
    }
    public void setHasIndependentBathroom(Integer hasIndependentBathroom) 
    {
        this.hasIndependentBathroom = hasIndependentBathroom;
    }

    public Integer getHasIndependentBathroom() 
    {
        return hasIndependentBathroom;
    }
    public void setHasAirConditioning(Integer hasAirConditioning) 
    {
        this.hasAirConditioning = hasAirConditioning;
    }

    public Integer getHasAirConditioning() 
    {
        return hasAirConditioning;
    }
    public void setNumberOfBeds(Long numberOfBeds) 
    {
        this.numberOfBeds = numberOfBeds;
    }

    public Long getNumberOfBeds() 
    {
        return numberOfBeds;
    }
    public void setRoomStructure(String roomStructure) 
    {
        this.roomStructure = roomStructure;
    }

    public String getRoomStructure() 
    {
        return roomStructure;
    }
    public void setHasBalcony(Integer hasBalcony) 
    {
        this.hasBalcony = hasBalcony;
    }

    public Integer getHasBalcony() 
    {
        return hasBalcony;
    }
    public void setFurnitureTypes(String furnitureTypes) 
    {
        this.furnitureTypes = furnitureTypes;
    }

    public String getFurnitureTypes() 
    {
        return furnitureTypes;
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
            .append("attributeId", getAttributeId())
            .append("propertyId", getPropertyId())
            .append("orientation", getOrientation())
            .append("hasIndependentBathroom", getHasIndependentBathroom())
            .append("hasAirConditioning", getHasAirConditioning())
            .append("numberOfBeds", getNumberOfBeds())
            .append("roomStructure", getRoomStructure())
            .append("hasBalcony", getHasBalcony())
            .append("furnitureTypes", getFurnitureTypes())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
