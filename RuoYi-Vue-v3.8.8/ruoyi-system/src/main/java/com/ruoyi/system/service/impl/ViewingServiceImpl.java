package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ViewingMapper;
import com.ruoyi.system.domain.Viewing;
import com.ruoyi.system.service.IViewingService;

/**
 * 看房信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-15
 */
@Service
public class ViewingServiceImpl implements IViewingService 
{
    @Autowired
    private ViewingMapper viewingMapper;

    /**
     * 查询看房信息
     * 
     * @param viewingId 看房信息主键
     * @return 看房信息
     */
    @Override
    public Viewing selectViewingByViewingId(Long viewingId)
    {
        return viewingMapper.selectViewingByViewingId(viewingId);
    }

    /**
     * 查询看房信息列表
     * 
     * @param viewing 看房信息
     * @return 看房信息
     */
    @Override
    public List<Viewing> selectViewingList(Viewing viewing)
    {
        return viewingMapper.selectViewingList(viewing);
    }

    /**
     * 新增看房信息
     * 
     * @param viewing 看房信息
     * @return 结果
     */
    @Override
    public int insertViewing(Viewing viewing)
    {
        return viewingMapper.insertViewing(viewing);
    }

    /**
     * 修改看房信息
     * 
     * @param viewing 看房信息
     * @return 结果
     */
    @Override
    public int updateViewing(Viewing viewing)
    {
        return viewingMapper.updateViewing(viewing);
    }

    /**
     * 批量删除看房信息
     * 
     * @param viewingIds 需要删除的看房信息主键
     * @return 结果
     */
    @Override
    public int deleteViewingByViewingIds(Long[] viewingIds)
    {
        return viewingMapper.deleteViewingByViewingIds(viewingIds);
    }

    /**
     * 删除看房信息信息
     * 
     * @param viewingId 看房信息主键
     * @return 结果
     */
    @Override
    public int deleteViewingByViewingId(Long viewingId)
    {
        return viewingMapper.deleteViewingByViewingId(viewingId);
    }
}
