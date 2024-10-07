import request from '@/utils/request'

// 查询房源信息列表
export function listProperty(query) {
  return request({
    url: '/system/property/list',
    method: 'get',
    params: query
  })
}

// 查询房源信息详细
export function getProperty(propertyId) {
  return request({
    url: '/system/property/' + propertyId,
    method: 'get'
  })
}

// 新增房源信息
export function addProperty(data) {
  return request({
    url: '/system/property',
    method: 'post',
    data: data
  })
}

// 修改房源信息
export function updateProperty(data) {
  return request({
    url: '/system/property',
    method: 'put',
    data: data
  })
}

// 删除房源信息
export function delProperty(propertyId) {
  return request({
    url: '/system/property/' + propertyId,
    method: 'delete'
  })
}
