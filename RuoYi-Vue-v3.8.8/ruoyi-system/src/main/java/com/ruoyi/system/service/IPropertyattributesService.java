package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Propertyattributes;

/**
 * 房源属性信息Service接口
 * 
 * @author ruoyi
 * @date 2024-10-07
 */
public interface IPropertyattributesService 
{
    /**
     * 查询房源属性信息
     * 
     * @param attributeId 房源属性信息主键
     * @return 房源属性信息
     */
    public Propertyattributes selectPropertyattributesByAttributeId(Long attributeId);

    /**
     * 查询房源属性信息列表
     * 
     * @param propertyattributes 房源属性信息
     * @return 房源属性信息集合
     */
    public List<Propertyattributes> selectPropertyattributesList(Propertyattributes propertyattributes);

    /**
     * 新增房源属性信息
     * 
     * @param propertyattributes 房源属性信息
     * @return 结果
     */
    public int insertPropertyattributes(Propertyattributes propertyattributes);

    /**
     * 修改房源属性信息
     * 
     * @param propertyattributes 房源属性信息
     * @return 结果
     */
    public int updatePropertyattributes(Propertyattributes propertyattributes);

    /**
     * 批量删除房源属性信息
     * 
     * @param attributeIds 需要删除的房源属性信息主键集合
     * @return 结果
     */
    public int deletePropertyattributesByAttributeIds(Long[] attributeIds);

    /**
     * 删除房源属性信息信息
     * 
     * @param attributeId 房源属性信息主键
     * @return 结果
     */
    public int deletePropertyattributesByAttributeId(Long attributeId);
}
