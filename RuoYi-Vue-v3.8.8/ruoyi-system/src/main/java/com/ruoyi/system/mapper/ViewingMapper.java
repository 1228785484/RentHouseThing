package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Viewing;

/**
 * 看房信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-10-14
 */
public interface ViewingMapper 
{
    /**
     * 查询看房信息
     * 
     * @param viewingId 看房信息主键
     * @return 看房信息
     */
    public Viewing selectViewingByViewingId(Long viewingId);

    /**
     * 查询看房信息列表
     * 
     * @param viewing 看房信息
     * @return 看房信息集合
     */
    public List<Viewing> selectViewingList(Viewing viewing);

    /**
     * 新增看房信息
     * 
     * @param viewing 看房信息
     * @return 结果
     */
    public int insertViewing(Viewing viewing);

    /**
     * 修改看房信息
     * 
     * @param viewing 看房信息
     * @return 结果
     */
    public int updateViewing(Viewing viewing);

    /**
     * 删除看房信息
     * 
     * @param viewingId 看房信息主键
     * @return 结果
     */
    public int deleteViewingByViewingId(Long viewingId);

    /**
     * 批量删除看房信息
     * 
     * @param viewingIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteViewingByViewingIds(Long[] viewingIds);
}
