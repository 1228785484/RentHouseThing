import request from '@/utils/request'
export function listProvince() {
  return request({
    url: '/location/province',
    method: 'get',
  })
}
export function listCity(provinceCode) {
  return request({
    url: '/location/city',
    method: 'get',
    params:{ provinceCode }
  })
}
export function listArea(cityCode) {
  return request({
    url: '/location/area',
    method: 'get',
    params:{ cityCode }
  })
}

