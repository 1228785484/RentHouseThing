import request from '@/utils/request'

// 查询租金范围的房源信息
export function listPropertyByRentRange(minRent, maxRent) {
  return request({
    url: '/system/property/rent-range',
    method: 'get',
    params: { minRent, maxRent },
  });
}

// 根据房东ID获取房东姓名
export function getLandlordFromLandlordId(landlordId) {
  return request({
    url: '/system/property/getLandlordName/',
    method: 'get',
    params: { landlordId }
  });
}

// 查询租户列表
export function listTenants() {
  return request({
    url: '/system/tenant/list',
    method: 'get'
  });
}

// 查询房东列表
export function listLandlords() {
  return request({
    url: '/system/landlord/list',
    method: 'get'
  });
}

// 查询房源信息列表
export function listProperty(query) {
  return request({
    url: '/system/property/list',
    method: 'get',
    params: query
  });
}

// 查询房源信息详细
export function getProperty(propertyId) {
  return request({
    url: '/system/property/' + propertyId,
    method: 'get'
  });
}

// 新增房源信息
export function addProperty(data) {
  return request({
    url: '/system/property',
    method: 'post',
    data: data
  });
}

// 修改房源信息
export function updateProperty(data) {
  return request({
    url: '/system/property',
    method: 'put',
    data: data
  });
}

// 删除房源信息
export function delProperty(propertyId) {
  return request({
    url: '/system/property/' + propertyId,
    method: 'delete'
  });
}
