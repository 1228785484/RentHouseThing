<template>
  <el-select
    v-model="selectedLandlordId"
    placeholder="请选择房东ID"
    filterable
    :loading="loading"
    @focus="queryLandlords"
    @change="handleChange"
  >
    <el-option
      v-for="id in landlordOptions"
      :key="id"
      :label="id"
      :value="id"
    />
  </el-select>
</template>

<script>
import { listLandlordId } from '@/api/system/landlord';

export default {
  name: 'LandlordSelector',
  props: {
    value: {
      type: [String, Number],
      default: ''
    }
  },
  data() {
    return {
      selectedLandlordId: this.value,
      landlordOptions: [],
      loading: false
    };
  },
  watch: {
    value(newVal) {
      this.selectedLandlordId = newVal;
    }
  },
  methods: {
    queryLandlords() {
      if (this.landlordOptions.length === 0) {
        this.loading = true;
        listLandlordId().then(response => {
          this.landlordOptions = response || [];
          this.loading = false;
        }).catch(() => {
          this.landlordOptions = [];
          this.loading = false;
        });
      }
    },
    handleChange(value) {
      this.$emit('input', value);
    }
  },
  created() {
    this.queryLandlords();
  }
};
</script>
