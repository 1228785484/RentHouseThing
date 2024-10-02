package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Landlord;

/**
 * 房东信息Service接口
 * 
 * @author ruoyi
 * @date 2024-10-02
 */
public interface ILandlordService 
{
    /**
     * 查询房东信息
     * 
     * @param landlordId 房东信息主键
     * @return 房东信息
     */
    public Landlord selectLandlordByLandlordId(Long landlordId);

    /**
     * 查询房东信息列表
     * 
     * @param landlord 房东信息
     * @return 房东信息集合
     */
    public List<Landlord> selectLandlordList(Landlord landlord);

    /**
     * 新增房东信息
     * 
     * @param landlord 房东信息
     * @return 结果
     */
    public int insertLandlord(Landlord landlord);

    /**
     * 修改房东信息
     * 
     * @param landlord 房东信息
     * @return 结果
     */
    public int updateLandlord(Landlord landlord);

    /**
     * 批量删除房东信息
     * 
     * @param landlordIds 需要删除的房东信息主键集合
     * @return 结果
     */
    public int deleteLandlordByLandlordIds(Long[] landlordIds);

    /**
     * 删除房东信息信息
     * 
     * @param landlordId 房东信息主键
     * @return 结果
     */
    public int deleteLandlordByLandlordId(Long landlordId);
}
