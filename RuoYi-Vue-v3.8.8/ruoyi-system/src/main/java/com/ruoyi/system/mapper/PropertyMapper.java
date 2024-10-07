package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Property;

/**
 * 房源信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-07
 */
public interface PropertyMapper 
{
    /**
     * 查询房源信息
     * 
     * @param propertyId 房源信息主键
     * @return 房源信息
     */
    public Property selectPropertyByPropertyId(Long propertyId);

    /**
     * 查询房源信息列表
     * 
     * @param property 房源信息
     * @return 房源信息集合
     */
    public List<Property> selectPropertyList(Property property);

    /**
     * 新增房源信息
     * 
     * @param property 房源信息
     * @return 结果
     */
    public int insertProperty(Property property);

    /**
     * 修改房源信息
     * 
     * @param property 房源信息
     * @return 结果
     */
    public int updateProperty(Property property);

    /**
     * 删除房源信息
     * 
     * @param propertyId 房源信息主键
     * @return 结果
     */
    public int deletePropertyByPropertyId(Long propertyId);

    /**
     * 批量删除房源信息
     * 
     * @param propertyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePropertyByPropertyIds(Long[] propertyIds);
}
