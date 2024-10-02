package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PropertyattributesMapper;
import com.ruoyi.system.domain.Propertyattributes;
import com.ruoyi.system.service.IPropertyattributesService;

/**
 * 房源属性信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
@Service
public class PropertyattributesServiceImpl implements IPropertyattributesService 
{
    @Autowired
    private PropertyattributesMapper propertyattributesMapper;

    /**
     * 查询房源属性信息
     * 
     * @param attributeId 房源属性信息主键
     * @return 房源属性信息
     */
    @Override
    public Propertyattributes selectPropertyattributesByAttributeId(Long attributeId)
    {
        return propertyattributesMapper.selectPropertyattributesByAttributeId(attributeId);
    }

    /**
     * 查询房源属性信息列表
     * 
     * @param propertyattributes 房源属性信息
     * @return 房源属性信息
     */
    @Override
    public List<Propertyattributes> selectPropertyattributesList(Propertyattributes propertyattributes)
    {
        return propertyattributesMapper.selectPropertyattributesList(propertyattributes);
    }

    /**
     * 新增房源属性信息
     * 
     * @param propertyattributes 房源属性信息
     * @return 结果
     */
    @Override
    public int insertPropertyattributes(Propertyattributes propertyattributes)
    {
        return propertyattributesMapper.insertPropertyattributes(propertyattributes);
    }

    /**
     * 修改房源属性信息
     * 
     * @param propertyattributes 房源属性信息
     * @return 结果
     */
    @Override
    public int updatePropertyattributes(Propertyattributes propertyattributes)
    {
        return propertyattributesMapper.updatePropertyattributes(propertyattributes);
    }

    /**
     * 批量删除房源属性信息
     * 
     * @param attributeIds 需要删除的房源属性信息主键
     * @return 结果
     */
    @Override
    public int deletePropertyattributesByAttributeIds(Long[] attributeIds)
    {
        return propertyattributesMapper.deletePropertyattributesByAttributeIds(attributeIds);
    }

    /**
     * 删除房源属性信息信息
     * 
     * @param attributeId 房源属性信息主键
     * @return 结果
     */
    @Override
    public int deletePropertyattributesByAttributeId(Long attributeId)
    {
        return propertyattributesMapper.deletePropertyattributesByAttributeId(attributeId);
    }
}
