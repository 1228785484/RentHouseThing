<template>
  <el-cascader
    v-model="selectLocation"
    :options="locationOptions"
    :props="props"
    @change="handleChange"
    clearable
  ></el-cascader>
</template>

<script>
import { listProvince, listCity, listArea } from "@/api/system/location";

export default {
  name: "LocSelector",
  props: {
    value: {
      type: [Array,String],
      default: () => []
    }
  },
  data() {
    return {
      selectLocation: this.value,
      locationOptions: [],
      labelMap: new Map(), // 用于存储 value 到 label 的映射
      props: {
        lazy: true,
        lazyLoad: this.lazyLoad,
        value: 'value',
        label: 'label',
        children: 'children'
      }
    };
  },
  watch: {
    value: {
      immediate: true,
      handler(newVal) {
        console.log("数值改变!")
        if (typeof newVal === 'string') {
          console.log("数值是String!"+newVal)
          this.setLocationFromLabels(newVal);
        } else if (Array.isArray(newVal)) {
          console.log("数值是Array!"+newVal)
          this.selectLocation = newVal;
        }
      }
    }
  },
  methods: {
    handleChange(value) {
      this.selectLocation = value;
      console.log(value)
      const labels = value.map(v => this.labelMap.get(v) || '').filter(Boolean);
      const labelString = labels.join(',');
      this.$emit("input", labelString);
      this.$emit("change", labelString, value);
    },
    getLabels(value) {
      return value.map(v => this.labelMap.get(v) || '').filter(Boolean).join(',');
    },
    setLocationFromLabels(labels) {
      if (!labels) {
        this.selectLocation = [];
        return;
      }
      const labelArray = labels.split(',');
      console.log("数值是Array!"+labelArray)
      this.selectLocation = Array.from(this.labelMap.entries())
        .filter(([_, label]) => labelArray.includes(label))
        .map(([value, _]) => value);
    },
    lazyLoad(node, resolve) {
      const { level } = node;
      const value = node.data ? node.data.value : undefined;

      let method;
      switch(level) {
        case 0: method = listProvince; break;
        case 1: method = listCity; break;
        case 2: method = listArea; break;
        default: resolve([]); return;
      }

      if (level > 0 && !value) {
        console.error(`${level === 1 ? '省份' : '城市'}ID为空，节点:`, node);
        resolve([]);
        return;
      }

      method(value).then(res => {
        if (Array.isArray(res.data)) {
          const data = res.data.map(item => {
            this.labelMap.set(item.code, item.name); // 存储 value 到 label 的映射
            return {
              value: item.code,
              label: item.name,
              leaf: level === 2
            };
          });
          resolve(data);
        } else {
          console.error(`${level === 0 ? '省份' : level === 1 ? '城市' : '区县'}数据不是数组:`, res.data);
          resolve([]);
        }
      }).catch(error => {
        console.error(`获取${level === 0 ? '省份' : level === 1 ? '城市' : '区县'}数据失败:`, error);
        resolve([]);
      });
    }
  },
  mounted() {
    // 初始加载省份数据
    listProvince().then((res) => {
      this.locationOptions = res.data.map((item) => {
        this.labelMap.set(item.code, item.name); // 存储省份的 value 到 label 的映射
        return {
          value: item.code,
          label: item.name,
          leaf: false
        };
      });
    });
  }
};
</script>
