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
  import log from "@/views/monitor/job/log.vue";

  export default {
    name: "LocSelector",
    props: {
      value: {
        type: Array,
        default: () => []
      }
    },
    data() {
      return {
        selectLocation: this.value,
        locationOptions: [],
        props: {
          lazy: true,
          lazyLoad: (node, resolve) => {
            console.log("该方法运行了一次!");
            const { level } = node;
            console.log(node);
            const value = node.data ? node.data.value : undefined;

            console.log("加载级别:", level, "值:", value, "节点:", node);

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
                const data = res.data.map(item => ({
                  value: item.code,
                  label: item.name,
                  leaf: level === 2
                }));
                console.log(`${level === 0 ? '省份' : level === 1 ? '城市' : '区县'}数据:`, data);
                resolve(data);
              } else {
                console.error(`${level === 0 ? '省份' : level === 1 ? '城市' : '区县'}数据不是数组:`, res.data);
                resolve([]);
              }
            }).catch(error => {
              console.error(`获取${level === 0 ? '省份' : level === 1 ? '城市' : '区县'}数据失败:`, error);
              resolve([]);
            });
          },
          value: 'value',
          label: 'label',
          children: 'children'
        }
      };
    },
    watch: {
      value(newVal) {
        this.selectLocation = newVal; // 如果外部value变化，更新组件内部数据
      }
    },
    methods: {
      handleChange(value) {
        this.$emit("input", value); // 向父组件发出input事件，实现双向绑定
        this.$emit("change", value); // 发出change事件，处理选项变化
      }
    },
    mounted() {
      // 初始加载省份数据
      listProvince().then((res) => {
        this.locationOptions = res.data.map((item) => ({
          value: item.code,
          label: item.name,
          leaf: false
        }));
      });
    }
  };
  </script>
