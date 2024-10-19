import request from '@/utils/request'

// 查询房源属性信息列表
export function listPropertyattributes(query) {
  return request({
    url: '/system/propertyattributes/list',
    method: 'get',
    params: query
  })
}

// 查询房源属性信息详细
export function getPropertyattributes(attributeId) {
  return request({
    url: '/system/propertyattributes/' + attributeId,
    method: 'get'
  })
}

// 新增房源属性信息
export function addPropertyattributes(data) {
  return request({
    url: '/system/propertyattributes',
    method: 'post',
    data: data
  })
}

// 修改房源属性信息
export function updatePropertyattributes(data) {
  return request({
    url: '/system/propertyattributes',
    method: 'put',
    data: data
  })
}

// 删除房源属性信息
export function delPropertyattributes(attributeId) {
  return request({
    url: '/system/propertyattributes/' + attributeId,
    method: 'delete'
  })
}



