package com.ruoyi.system.mapper;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.system.domain.Property;
import com.ruoyi.system.domain.Propertyattributes;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 房源信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-09
 */
@Mapper
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

    /**
     * 批量删除房源属性信息
     * 
     * @param propertyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePropertyattributesByPropertyIds(Long[] propertyIds);
    
    /**
     * 批量新增房源属性信息
     * 
     * @param propertyattributesList 房源属性信息列表
     * @return 结果
     */
    public int batchPropertyattributes(List<Propertyattributes> propertyattributesList);
    

    /**
     * 通过房源信息主键删除房源属性信息信息
     * 
     * @param propertyId 房源信息ID
     * @return 结果
     */
    public int deletePropertyattributesByPropertyId(Long propertyId);


    public List<Property> findPropertiesByRentRange(@Param("minRent") BigDecimal minRent,
                                                    @Param("maxRent") BigDecimal maxRent);

    public String selectLandLordNameByLandlordId(Long landlordId);

}
