package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysProperty;

/**
 * 房源编辑表Service接口
 * 
 * @author SevenGod
 * @date 2024-09-25
 */
public interface ISysPropertyService 
{
    /**
     * 查询房源编辑表
     * 
     * @param propertyId 房源编辑表主键
     * @return 房源编辑表
     */
    public SysProperty selectSysPropertyByPropertyId(Long propertyId);

    /**
     * 查询房源编辑表列表
     * 
     * @param sysProperty 房源编辑表
     * @return 房源编辑表集合
     */
    public List<SysProperty> selectSysPropertyList(SysProperty sysProperty);

    /**
     * 新增房源编辑表
     * 
     * @param sysProperty 房源编辑表
     * @return 结果
     */
    public int insertSysProperty(SysProperty sysProperty);

    /**
     * 修改房源编辑表
     * 
     * @param sysProperty 房源编辑表
     * @return 结果
     */
    public int updateSysProperty(SysProperty sysProperty);

    /**
     * 批量删除房源编辑表
     * 
     * @param propertyIds 需要删除的房源编辑表主键集合
     * @return 结果
     */
    public int deleteSysPropertyByPropertyIds(String propertyIds);

    /**
     * 删除房源编辑表信息
     * 
     * @param propertyId 房源编辑表主键
     * @return 结果
     */
    public int deleteSysPropertyByPropertyId(Long propertyId);
}
