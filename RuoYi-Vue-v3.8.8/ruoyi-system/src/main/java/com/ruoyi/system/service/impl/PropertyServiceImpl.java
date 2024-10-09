package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.system.domain.Propertyattributes;
import com.ruoyi.system.mapper.PropertyMapper;
import com.ruoyi.system.domain.Property;
import com.ruoyi.system.service.IPropertyService;

/**
 * 房源信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-09
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
    @Transactional
    @Override
    public int insertProperty(Property property)
    {
        int rows = propertyMapper.insertProperty(property);
        insertPropertyattributes(property);
        return rows;
    }

    /**
     * 修改房源信息
     * 
     * @param property 房源信息
     * @return 结果
     */
    @Transactional
    @Override
    public int updateProperty(Property property)
    {
        propertyMapper.deletePropertyattributesByPropertyId(property.getPropertyId());
        insertPropertyattributes(property);
        return propertyMapper.updateProperty(property);
    }

    /**
     * 批量删除房源信息
     * 
     * @param propertyIds 需要删除的房源信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePropertyByPropertyIds(Long[] propertyIds)
    {
        propertyMapper.deletePropertyattributesByPropertyIds(propertyIds);
        return propertyMapper.deletePropertyByPropertyIds(propertyIds);
    }

    /**
     * 删除房源信息信息
     * 
     * @param propertyId 房源信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePropertyByPropertyId(Long propertyId)
    {
        propertyMapper.deletePropertyattributesByPropertyId(propertyId);
        return propertyMapper.deletePropertyByPropertyId(propertyId);
    }

    /**
     * 新增房源属性信息信息
     * 
     * @param property 房源信息对象
     */
    public void insertPropertyattributes(Property property)
    {
        List<Propertyattributes> propertyattributesList = property.getPropertyattributesList();
        Long propertyId = property.getPropertyId();
        if (StringUtils.isNotNull(propertyattributesList))
        {
            List<Propertyattributes> list = new ArrayList<Propertyattributes>();
            for (Propertyattributes propertyattributes : propertyattributesList)
            {
                propertyattributes.setPropertyId(propertyId);
                list.add(propertyattributes);
            }
            if (list.size() > 0)
            {
                propertyMapper.batchPropertyattributes(list);
            }
        }
    }
}
