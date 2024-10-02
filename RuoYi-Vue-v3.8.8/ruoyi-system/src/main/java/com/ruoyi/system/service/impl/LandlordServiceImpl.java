package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LandlordMapper;
import com.ruoyi.system.domain.Landlord;
import com.ruoyi.system.service.ILandlordService;

/**
 * 房东信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
@Service
public class LandlordServiceImpl implements ILandlordService 
{
    @Autowired
    private LandlordMapper landlordMapper;

    /**
     * 查询房东信息
     * 
     * @param landlordId 房东信息主键
     * @return 房东信息
     */
    @Override
    public Landlord selectLandlordByLandlordId(Long landlordId)
    {
        return landlordMapper.selectLandlordByLandlordId(landlordId);
    }

    /**
     * 查询房东信息列表
     * 
     * @param landlord 房东信息
     * @return 房东信息
     */
    @Override
    public List<Landlord> selectLandlordList(Landlord landlord)
    {
        return landlordMapper.selectLandlordList(landlord);
    }

    /**
     * 新增房东信息
     * 
     * @param landlord 房东信息
     * @return 结果
     */
    @Override
    public int insertLandlord(Landlord landlord)
    {
        return landlordMapper.insertLandlord(landlord);
    }

    /**
     * 修改房东信息
     * 
     * @param landlord 房东信息
     * @return 结果
     */
    @Override
    public int updateLandlord(Landlord landlord)
    {
        return landlordMapper.updateLandlord(landlord);
    }

    /**
     * 批量删除房东信息
     * 
     * @param landlordIds 需要删除的房东信息主键
     * @return 结果
     */
    @Override
    public int deleteLandlordByLandlordIds(Long[] landlordIds)
    {
        return landlordMapper.deleteLandlordByLandlordIds(landlordIds);
    }

    /**
     * 删除房东信息信息
     * 
     * @param landlordId 房东信息主键
     * @return 结果
     */
    @Override
    public int deleteLandlordByLandlordId(Long landlordId)
    {
        return landlordMapper.deleteLandlordByLandlordId(landlordId);
    }
}
