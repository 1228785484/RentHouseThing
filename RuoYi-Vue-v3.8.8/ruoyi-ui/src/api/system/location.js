import request from '@/utils/request'
export function listProvince() {
  return request({
    url: '/location/province',
    method: 'get',
  })
}
export function listCity(provinceId) {
  return request({
    url: '/location/city',
    method: 'get',
    params:{provinceId}
  })
}
export function listArea(cityId) {
  return request({
    url: '/location/area',
    method: 'get',
    params:{cityId}
  })
}

