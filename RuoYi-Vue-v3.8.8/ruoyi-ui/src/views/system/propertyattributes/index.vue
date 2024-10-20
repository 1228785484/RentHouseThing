<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="房源ID" prop="propertyId">
        <el-select v-model="queryParams.propertyId" placeholder="请选择房源ID" clearable>
          <el-option
            v-for="property in propertyList"
            :key="property.propertyId"
            :label="property.propertyId"
            :value="property.propertyId">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="朝向" prop="orientation">
        <el-select v-model="queryParams.orientation" placeholder="请选择朝向" clearable>
          <el-option
            v-for="dict in dict.type.orientation"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="是否有独立卫浴" prop="hasIndependentBathroom">
        <el-select v-model="queryParams.hasIndependentBathroom" placeholder="请选择是否有独立卫浴" clearable>
          <el-option
            v-for="dict in dict.type.sys_yes_no"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="是否有空调" prop="hasAirConditioning">
        <el-select v-model="queryParams.hasAirConditioning" placeholder="请选择是否有空调" clearable>
          <el-option
            v-for="dict in dict.type.sys_yes_no"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="几人间" prop="numberOfBeds">
        <el-input
          v-model="queryParams.numberOfBeds"
          placeholder="请输入几人间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间结构" prop="roomStructure">
        <el-select v-model="queryParams.roomStructure" placeholder="请选择房间结构" clearable>
          <el-option
            v-for="dict in dict.type.room_structure"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="是否有阳台" prop="hasBalcony">
        <el-select v-model="queryParams.hasBalcony" placeholder="请选择是否有阳台" clearable>
          <el-option
            v-for="dict in dict.type.sys_yes_no"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="家具种类" prop="furnitureTypes">
        <el-select v-model="queryParams.furnitureTypes" placeholder="请选择家具种类" clearable multiple collapse-tags>
          <el-option
            v-for="dict in dict.type.furniture_type"
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
      <el-form-item label="房间号" prop="roomNumber">
        <el-input
          v-model="queryParams.roomNumber"
          placeholder="请输入房间号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否已用" prop="isOccupied">
        <el-select v-model="queryParams.isOccupied" placeholder="请选择是否已用" clearable>
          <el-option
            v-for="dict in dict.type.use_info"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['system:propertyattributes:add']"
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
          v-hasPermi="['system:propertyattributes:edit']"
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
          v-hasPermi="['system:propertyattributes:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:propertyattributes:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="propertyattributesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="属性ID" align="center" prop="attributeId" />
      <el-table-column label="房源ID" align="center" prop="propertyId" />
      <el-table-column label="朝向" align="center" prop="orientation">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.orientation" :value="scope.row.orientation"/>
        </template>
      </el-table-column>
      <el-table-column label="是否有独立卫浴" align="center" prop="hasIndependentBathroom">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.hasIndependentBathroom"/>
        </template>
      </el-table-column>
      <el-table-column label="是否有空调" align="center" prop="hasAirConditioning">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.hasAirConditioning"/>
        </template>
      </el-table-column>
      <el-table-column label="几人间" align="center" prop="numberOfBeds" />
      <el-table-column label="房间结构" align="center" prop="roomStructure">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.room_structure" :value="scope.row.roomStructure"/>
        </template>
      </el-table-column>
      <el-table-column label="是否有阳台" align="center" prop="hasBalcony">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.hasBalcony"/>
        </template>
      </el-table-column>
      <el-table-column label="家具种类" align="center" prop="furnitureTypes">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.furniture_type" :value="scope.row.furnitureTypes ? scope.row.furnitureTypes.split(',') : []"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createdAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房间号" align="center" prop="roomNumber" />
      <el-table-column label="是否已用" align="center" prop="isOccupied">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.use_info" :value="scope.row.isOccupied"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:propertyattributes:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:propertyattributes:remove']"
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

    <!-- 添加或修改房源属性信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="房源ID" prop="propertyId">
          <el-select v-model="form.propertyId" placeholder="请选择房源ID">
            <el-option
              v-for="item in propertyList"
              :key="item.propertyId"
              :label="item.propertyId"
              :value="item.propertyId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="朝向" prop="orientation">
          <el-select v-model="form.orientation" placeholder="请选择朝向">
            <el-option
              v-for="dict in dict.type.orientation"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否有独立卫浴" prop="hasIndependentBathroom">
          <el-select v-model="form.hasIndependentBathroom" placeholder="请选择是否有独立卫浴">
            <el-option
              v-for="dict in dict.type.sys_yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否有空调" prop="hasAirConditioning">
          <el-select v-model="form.hasAirConditioning" placeholder="请选择是否有空调">
            <el-option
              v-for="dict in dict.type.sys_yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="几人间" prop="numberOfBeds">
          <el-input v-model="form.numberOfBeds" placeholder="请输入几人间" />
        </el-form-item>
        <el-form-item label="房间结构" prop="roomStructure">
          <el-select v-model="form.roomStructure" placeholder="请选择房间结构">
            <el-option
              v-for="dict in dict.type.room_structure"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否有阳台" prop="hasBalcony">
          <el-select v-model="form.hasBalcony" placeholder="请选择是否有阳台">
            <el-option
              v-for="dict in dict.type.sys_yes_no"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="家具种类" prop="furnitureTypes">
          <el-select v-model="form.furnitureTypes" placeholder="请选择家具种类" multiple collapse-tags>
            <el-option
              v-for="dict in dict.type.furniture_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="创建时间" prop="createdAt">
          <el-date-picker clearable
            v-model="form.createdAt"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="房间号" prop="roomNumber">
          <el-input v-model="form.roomNumber" placeholder="请输入房间号" />
        </el-form-item>
        <el-form-item label="是否已用" prop="isOccupied">
          <el-select v-model="form.isOccupied" placeholder="请选择是否已用">
            <el-option
              v-for="dict in dict.type.use_info"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPropertyattributes, getPropertyattributes, delPropertyattributes, addPropertyattributes, updatePropertyattributes } from "@/api/system/propertyattributes";
import { listProperty } from "@/api/system/property";

export default {
  name: "Propertyattributes",
  dicts: ['use_info', 'room_structure', 'furniture_type', 'sys_yes_no', 'orientation'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 房源属性信息表格数据
      propertyattributesList: [],
      // 房源列表
      propertyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        propertyId: null,
        orientation: null,
        hasIndependentBathroom: null,
        hasAirConditioning: null,
        numberOfBeds: null,
        roomStructure: null,
        hasBalcony: null,
        furnitureTypes: null,
        createdAt: null,
        roomNumber: null,
        isOccupied: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        propertyId: [
          { required: true, message: "房源ID不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getPropertyList();
  },
  methods: {
   /** 获取列表数据 */
    getList(params = this.queryParams) {
      this.loading = true;
      listPropertyattributes(params).then(response => {
        this.propertyattributesList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取房源列表 */
    getPropertyList() {
      listProperty().then(response => {
        this.propertyList = response.rows;
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
        attributeId: null,
        propertyId: null,
        orientation: null,
        hasIndependentBathroom: null,
        hasAirConditioning: null,
        numberOfBeds: null,
        roomStructure: null,
        hasBalcony: null,
        furnitureTypes: [],
        createdAt: null,
        roomNumber: null,
        isOccupied: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      console.log("handleQuery method called");
      console.log("queryParams:", JSON.stringify(this.queryParams, null, 2));
      // 创建一个临时的查询参数对象
      let tempQueryParams = JSON.parse(JSON.stringify(this.queryParams));

      tempQueryParams.pageNum = 1;
      if (Array.isArray(tempQueryParams.furnitureTypes)) {
        tempQueryParams.furnitureTypes = tempQueryParams.furnitureTypes.join(',');
      }
       // 使用临时查询参数进行查询
       this.getList(tempQueryParams);
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.attributeId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加房源属性信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const attributeId = row.attributeId || this.ids
      getPropertyattributes(attributeId).then(response => {
        this.form = response.data;
        this.form.furnitureTypes = this.form.furnitureTypes ? this.form.furnitureTypes.split(",") : [];
        this.open = true;
        this.title = "修改房源属性信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.furnitureTypes = this.form.furnitureTypes.join(",");
          if (this.form.attributeId != null) {
            updatePropertyattributes(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPropertyattributes(this.form).then(response => {
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
      const attributeIds = row.attributeId || this.ids;
      this.$modal.confirm('是否确认删除房源属性信息编号为"' + attributeIds + '"的数据项？').then(function() {
        return delPropertyattributes(attributeIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/propertyattributes/export', {
        ...this.queryParams
      }, `propertyattributes_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>