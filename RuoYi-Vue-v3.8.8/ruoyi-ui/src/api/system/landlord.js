import request from '@/utils/request'

// 查询房东信息列表
export function listLandlord(query) {
  return request({
    url: '/system/landlord/list',
    method: 'get',
    params: query
  })
}

// 查询房东信息详细
export function getLandlord(landlordId) {
  return request({
    url: '/system/landlord/' + landlordId,
    method: 'get'
  })
}

// 新增房东信息
export function addLandlord(data) {
  return request({
    url: '/system/landlord',
    method: 'post',
    data: data
  })
}

// 修改房东信息
export function updateLandlord(data) {
  return request({
    url: '/system/landlord',
    method: 'put',
    data: data
  })
}

// 删除房东信息
export function delLandlord(landlordId) {
  return request({
    url: '/system/landlord/' + landlordId,
    method: 'delete'
  })
}

//查询房东ID列表
export function listLandlordId(query) {
  return request({
    url: '/system/landlord/listLandlordId',
    method: 'get',
    params: query
  })
}
