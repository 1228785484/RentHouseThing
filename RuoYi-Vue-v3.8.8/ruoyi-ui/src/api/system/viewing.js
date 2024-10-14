import request from '@/utils/request'

// 查询看房信息列表
export function listViewing(query) {
  return request({
    url: '/system/viewing/list',
    method: 'get',
    params: query
  })
}

// 查询看房信息详细
export function getViewing(viewingId) {
  return request({
    url: '/system/viewing/' + viewingId,
    method: 'get'
  })
}

// 新增看房信息
export function addViewing(data) {
  return request({
    url: '/system/viewing',
    method: 'post',
    data: data
  })
}

// 修改看房信息
export function updateViewing(data) {
  return request({
    url: '/system/viewing',
    method: 'put',
    data: data
  })
}

// 删除看房信息
export function delViewing(viewingId) {
  return request({
    url: '/system/viewing/' + viewingId,
    method: 'delete'
  })
}
