import request from '@/utils/request'

// 查询租赁合同信息列表
export function listLeaseagreement(query) {
  return request({
    url: '/system/leaseagreement/list',
    method: 'get',
    params: query
  })
}

// 查询租赁合同信息详细
export function getLeaseagreement(agreementId) {
  return request({
    url: '/system/leaseagreement/' + agreementId,
    method: 'get'
  })
}

// 新增租赁合同信息
export function addLeaseagreement(data) {
  return request({
    url: '/system/leaseagreement',
    method: 'post',
    data: data
  })
}

// 修改租赁合同信息
export function updateLeaseagreement(data) {
  return request({
    url: '/system/leaseagreement',
    method: 'put',
    data: data
  })
}

// 删除租赁合同信息
export function delLeaseagreement(agreementId) {
  return request({
    url: '/system/leaseagreement/' + agreementId,
    method: 'delete'
  })
}
