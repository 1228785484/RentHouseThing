<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="房东ID" prop="landlordId">
        <el-input
          v-model="queryParams.landlordId"
          placeholder="请输入房东ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="地址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="租金价格" prop="rentPrice">
        <el-input
          v-model="queryParams.rentPrice"
          placeholder="请输入租金价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="租金范围" prop="rentRange">
        <el-input-number
          v-model="queryParams.minRent"
          placeholder="最小租金"
          :max="queryParams.maxRent || Infinity"
          @change="validateRentRange"
        />
        <el-input-number
          v-model="queryParams.maxRent"
          placeholder="最大租金"
          :min="queryParams.minRent || 0"
          @change="validateRentRange"
        />
        <el-button @click="handleRentRangeQuery" :disabled="!isValidRentRange">查询</el-button>
      </el-form-item>

      <el-form-item label="押金" prop="deposit">
        <el-input
          v-model="queryParams.deposit"
          placeholder="请输入押金"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否可用" prop="available">
        <el-select v-model="queryParams.available" placeholder="请选择是否可用" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间" prop="createdAt">
        <el-date-picker clearable
                        v-model="queryParams.createdAt"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="房源名字" prop="propertyName">
        <el-input
          v-model="queryParams.propertyName"
          placeholder="请输入房源名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:property:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:property:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:property:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:property:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="propertyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="房源ID" align="center" prop="propertyId" />
      <el-table-column label="房东ID" align="center" prop="landlordId" />
      <el-table-column label="地址" align="center" prop="address" />
      <el-table-column label="租金价格" align="center" prop="rentPrice" />
      <el-table-column label="押金" align="center" prop="deposit" />
      <el-table-column label="是否可用" align="center" prop="available">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.available"/>
        </template>
      </el-table-column>
      <el-table-column label="图片路径" align="center" prop="imageUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imageUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createdAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房源名字" align="center" prop="propertyName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:property:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:property:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改房源信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="房东ID" prop="landlordId">
          <el-input v-model="form.landlordId" placeholder="请输入房东ID" />
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <LocSelector v-model="form.address" placeholder="请选择地址" />
          <el-input v-model="form.detailAddress" placeholder="请输入详细地址" />
        </el-form-item>
        <el-form-item label="租金价格" prop="rentPrice">
          <el-input v-model="form.rentPrice" placeholder="请输入租金价格" />
        </el-form-item>
        <el-form-item label="押金" prop="deposit">
          <el-input v-model="form.deposit" placeholder="请输入押金" />
        </el-form-item>
        <el-form-item label="是否可用" prop="available">
          <el-radio-group v-model="form.available">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="图片路径" prop="imageUrl">
          <image-upload v-model="form.imageUrl"/>
        </el-form-item>
        <el-form-item label="创建时间" prop="createdAt">
          <el-date-picker clearable
                          v-model="form.createdAt"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="房源名字" prop="propertyName">
          <el-input v-model="form.propertyName" placeholder="请输入房源名字" />
        </el-form-item>
        <el-divider content-position="center">房源属性信息信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddPropertyattributes">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeletePropertyattributes">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="propertyattributesList" :row-class-name="rowPropertyattributesIndex" @selection-change="handlePropertyattributesSelectionChange" ref="propertyattributes">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="朝向" prop="orientation" width="150">
            <template slot-scope="scope">
              <el-select v-model="scope.row.orientation" placeholder="请选择朝向">
                <el-option
                  v-for="dict in dict.type.orientation"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="是否有独立卫浴" prop="hasIndependentBathroom" width="150">
            <template slot-scope="scope">
              <el-select v-model="scope.row.hasIndependentBathroom" placeholder="请选择是否有独立卫浴">
                <el-option
                  v-for="dict in dict.type.sys_yes_no"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="是否有空调" prop="hasAirConditioning" width="150">
            <template slot-scope="scope">
              <el-select v-model="scope.row.hasAirConditioning" placeholder="请选择是否有空调">
                <el-option
                  v-for="dict in dict.type.sys_yes_no"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="几人间" prop="numberOfBeds" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.numberOfBeds" placeholder="请输入几人间" />
            </template>
          </el-table-column>
          <el-table-column label="房间结构" prop="roomStructure" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.roomStructure" placeholder="请输入房间结构" />
            </template>
          </el-table-column>
          <el-table-column label="是否有阳台" prop="hasBalcony" width="150">
            <template slot-scope="scope">
              <el-select v-model="scope.row.hasBalcony" placeholder="请选择是否有阳台">
                <el-option
                  v-for="dict in dict.type.sys_yes_no"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="创建时间" prop="createdAt" width="240">
            <template slot-scope="scope">
              <el-date-picker clearable v-model="scope.row.createdAt" type="date" value-format="yyyy-MM-dd" placeholder="请选择创建时间" />
            </template>
          </el-table-column>
          <el-table-column label="房间号" prop="roomNumber" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.roomNumber" placeholder="请输入房间号" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { listProperty, getProperty, delProperty, addProperty, updateProperty } from "@/api/system/property";
import { listPropertyByRentRange } from '@/api/system/property'; // 新增的引入
import LocSelector from "@/layout/components/Location/LocSelector.vue";


export default {
  name: "Property",
  components: {LocSelector},
  dicts: ['sys_yes_no', 'sys_normal_disable', 'orientation'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedPropertyattributes: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 房源信息表格数据
      propertyList: [],
      // 房源属性信息表格数据
      propertyattributesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        landlordId: null,
        address: null,
        detailAddress: null, // 新增
        rentPrice: null,
        deposit: null,
        available: null,
        imageUrl: null,
        createdAt: null,
        propertyName: null,
        minRent: null,  // 新增
        maxRent: null   // 新增
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        address: [
          { required: true, message: "地址不能为空", trigger: "blur" }
        ],
        rentPrice: [
          { required: true, message: "租金价格不能为空", trigger: "blur" }
        ],
        propertyName: [
          { required: true, message: "房源名字不能为空", trigger: "blur" }
        ]
      },
      isValidRentRange: false,
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询房源信息列表 */
    getList() {
      this.loading = true;
      listProperty(this.queryParams).then(response => {
        this.propertyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        propertyId: null,
        landlordId: null,
        address: null,
        rentPrice: null,
        deposit: null,
        available: null,
        imageUrl: null,
        createdAt: null,
        propertyName: null
      };
      this.propertyattributesList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.propertyId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加房源信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const propertyId = row.propertyId || this.ids;
      getProperty(propertyId).then(response => {
        this.form = response.data;
        // 分离地址和详细地址
        if (this.form.address) {
          const addressParts = this.form.address.split(',');
          if (addressParts.length > 3) {
            this.form.address = addressParts.slice(0, 3);
            this.form.detailAddress = addressParts.slice(3).join(',');
          }
        }

        this.propertyattributesList = response.data.propertyattributesList;
        this.open = true;
        this.title = "修改房源信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.address && this.form.detailAddress) {
            this.form.address = this.form.address +',' + this.form.detailAddress;
          }
          this.form.propertyattributesList = this.propertyattributesList;
          if (this.form.propertyId != null) {
            updateProperty(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProperty(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const propertyIds = row.propertyId || this.ids;
      this.$modal.confirm('是否确认删除房源信息编号为"' + propertyIds + '"的数据项？').then(function() {
        return delProperty(propertyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 房源属性信息序号 */
    rowPropertyattributesIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 房源属性信息添加按钮操作 */
    handleAddPropertyattributes() {
      let obj = {};
      obj.orientation = "";
      obj.hasIndependentBathroom = "";
      obj.hasAirConditioning = "";
      obj.numberOfBeds = "";
      obj.roomStructure = "";
      obj.hasBalcony = "";
      obj.furnitureTypes = "";
      obj.createdAt = "";
      obj.roomNumber = "";
      this.propertyattributesList.push(obj);
    },
    /** 房源属性信息删除按钮操作 */
    handleDeletePropertyattributes() {
      if (this.checkedPropertyattributes.length == 0) {
        this.$modal.msgError("请先选择要删除的房源属性信息数据");
      } else {
        const propertyattributesList = this.propertyattributesList;
        const checkedPropertyattributes = this.checkedPropertyattributes;
        this.propertyattributesList = propertyattributesList.filter(function(item) {
          return checkedPropertyattributes.indexOf(item.index) == -1;
        });
      }
    },
    /** 复选框选中数据 */
    handlePropertyattributesSelectionChange(selection) {
      this.checkedPropertyattributes = selection.map(item => item.index);
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/property/export', {
        ...this.queryParams
      }, `property_${new Date().getTime()}.xlsx`);
    },
    /** 租金范围查询操作 */
    handleRentRangeQuery() {
      if (this.isValidRentRange) {
        this.loading = true;
        listPropertyByRentRange(this.queryParams.minRent, this.queryParams.maxRent).then(response => {
          this.propertyList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      } else {
        this.$message.warning('请输入有效的租金范围');
      }
    },
    validateRentRange() {
      if (this.queryParams.minRent && this.queryParams.maxRent) {
        this.isValidRentRange = this.queryParams.minRent <= this.queryParams.maxRent;
      } else {
        this.isValidRentRange = false;
      }
    },
  }
};
</script>
