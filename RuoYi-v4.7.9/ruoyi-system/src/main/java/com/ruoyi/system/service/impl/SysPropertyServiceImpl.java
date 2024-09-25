package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPropertyMapper;
import com.ruoyi.system.domain.SysProperty;
import com.ruoyi.system.service.ISysPropertyService;
import com.ruoyi.common.core.text.Convert;

/**
 * 房源编辑表Service业务层处理
 * 
 * @author SevenGod
 * @date 2024-09-25
 */
@Service
public class SysPropertyServiceImpl implements ISysPropertyService 
{
    @Autowired
    private SysPropertyMapper sysPropertyMapper;

    /**
     * 查询房源编辑表
     * 
     * @param propertyId 房源编辑表主键
     * @return 房源编辑表
     */
    @Override
    public SysProperty selectSysPropertyByPropertyId(Long propertyId)
    {
        return sysPropertyMapper.selectSysPropertyByPropertyId(propertyId);
    }

    /**
     * 查询房源编辑表列表
     * 
     * @param sysProperty 房源编辑表
     * @return 房源编辑表
     */
    @Override
    public List<SysProperty> selectSysPropertyList(SysProperty sysProperty)
    {
        return sysPropertyMapper.selectSysPropertyList(sysProperty);
    }

    /**
     * 新增房源编辑表
     * 
     * @param sysProperty 房源编辑表
     * @return 结果
     */
    @Override
    public int insertSysProperty(SysProperty sysProperty)
    {
        return sysPropertyMapper.insertSysProperty(sysProperty);
    }

    /**
     * 修改房源编辑表
     * 
     * @param sysProperty 房源编辑表
     * @return 结果
     */
    @Override
    public int updateSysProperty(SysProperty sysProperty)
    {
        return sysPropertyMapper.updateSysProperty(sysProperty);
    }

    /**
     * 批量删除房源编辑表
     * 
     * @param propertyIds 需要删除的房源编辑表主键
     * @return 结果
     */
    @Override
    public int deleteSysPropertyByPropertyIds(String propertyIds)
    {
        return sysPropertyMapper.deleteSysPropertyByPropertyIds(Convert.toStrArray(propertyIds));
    }

    /**
     * 删除房源编辑表信息
     * 
     * @param propertyId 房源编辑表主键
     * @return 结果
     */
    @Override
    public int deleteSysPropertyByPropertyId(Long propertyId)
    {
        return sysPropertyMapper.deleteSysPropertyByPropertyId(propertyId);
    }
}
