package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PropertyMapper;
import com.ruoyi.system.domain.Property;
import com.ruoyi.system.service.IPropertyService;

/**
 * 房源信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-07
 */
@Service
public class PropertyServiceImpl implements IPropertyService 
{
    @Autowired
    private PropertyMapper propertyMapper;

    /**
     * 查询房源信息
     * 
     * @param propertyId 房源信息主键
     * @return 房源信息
     */
    @Override
    public Property selectPropertyByPropertyId(Long propertyId)
    {
        return propertyMapper.selectPropertyByPropertyId(propertyId);
    }

    /**
     * 查询房源信息列表
     * 
     * @param property 房源信息
     * @return 房源信息
     */
    @Override
    public List<Property> selectPropertyList(Property property)
    {
        return propertyMapper.selectPropertyList(property);
    }

    /**
     * 新增房源信息
     * 
     * @param property 房源信息
     * @return 结果
     */
    @Override
    public int insertProperty(Property property)
    {
        return propertyMapper.insertProperty(property);
    }

    /**
     * 修改房源信息
     * 
     * @param property 房源信息
     * @return 结果
     */
    @Override
    public int updateProperty(Property property)
    {
        return propertyMapper.updateProperty(property);
    }

    /**
     * 批量删除房源信息
     * 
     * @param propertyIds 需要删除的房源信息主键
     * @return 结果
     */
    @Override
    public int deletePropertyByPropertyIds(Long[] propertyIds)
    {
        return propertyMapper.deletePropertyByPropertyIds(propertyIds);
    }

    /**
     * 删除房源信息信息
     * 
     * @param propertyId 房源信息主键
     * @return 结果
     */
    @Override
    public int deletePropertyByPropertyId(Long propertyId)
    {
        return propertyMapper.deletePropertyByPropertyId(propertyId);
    }
}
