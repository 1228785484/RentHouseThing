<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="租户ID" prop="tenantId">
        <el-input
          v-model="queryParams.tenantId"
          placeholder="请输入租户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房源ID" prop="propertyId">
        <el-input
          v-model="queryParams.propertyId"
          placeholder="请输入房源ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="合同开始日期" prop="startDate">
        <el-date-picker clearable
          v-model="queryParams.startDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择合同开始日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="合同结束日期" prop="endDate">
        <el-date-picker clearable
          v-model="queryParams.endDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择合同结束日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="每月租金" prop="monthlyRent">
        <el-input
          v-model="queryParams.monthlyRent"
          placeholder="请输入每月租金"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="合同押金支付方式" prop="agreementType">
        <el-select v-model="queryParams.agreementType" placeholder="请选择合同押金支付方式" clearable>
          <el-option
            v-for="dict in dict.type.less_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="合同状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择合同状态" clearable>
          <el-option
            v-for="dict in dict.type.contractstatus"
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
      <el-form-item label="合同类型" prop="agreementTypeAll">
        <el-select v-model="queryParams.agreementTypeAll" placeholder="请选择合同类型" clearable>
          <el-option
            v-for="dict in dict.type.contracttype"
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
          v-hasPermi="['system:leaseagreement:add']"
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
          v-hasPermi="['system:leaseagreement:edit']"
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
          v-hasPermi="['system:leaseagreement:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:leaseagreement:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leaseagreementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="合同ID" align="center" prop="agreementId" />
      <el-table-column label="合同开始日期" align="center" prop="startDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="合同结束日期" align="center" prop="endDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="每月租金" align="center" prop="monthlyRent" />
      <el-table-column label="合同押金支付方式" align="center" prop="agreementType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.less_type" :value="scope.row.agreementType"/>
        </template>
      </el-table-column>
      <el-table-column label="合同状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.contractstatus" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createdAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="合同类型" align="center" prop="agreementTypeAll">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.contracttype" :value="scope.row.agreementTypeAll"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:leaseagreement:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:leaseagreement:remove']"
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

    <!-- 添加或修改租赁合同信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="租户ID" prop="tenantId">
          <el-input v-model="form.tenantId" placeholder="请输入租户ID" />
        </el-form-item>
        <el-form-item label="房源ID" prop="propertyId">
          <el-input v-model="form.propertyId" placeholder="请输入房源ID" />
        </el-form-item>
        <el-form-item label="合同开始日期" prop="startDate">
          <el-date-picker clearable
            v-model="form.startDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择合同开始日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="合同结束日期" prop="endDate">
          <el-date-picker clearable
            v-model="form.endDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择合同结束日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="每月租金" prop="monthlyRent">
          <el-input v-model="form.monthlyRent" placeholder="请输入每月租金" />
        </el-form-item>
        <el-form-item label="合同押金支付方式" prop="agreementType">
          <el-select v-model="form.agreementType" placeholder="请选择合同押金支付方式">
            <el-option
              v-for="dict in dict.type.less_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合同状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择合同状态">
            <el-option
              v-for="dict in dict.type.contractstatus"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
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
        <el-form-item label="合同类型" prop="agreementTypeAll">
          <el-select v-model="form.agreementTypeAll" placeholder="请选择合同类型">
            <el-option
              v-for="dict in dict.type.contracttype"
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
import { listLeaseagreement, getLeaseagreement, delLeaseagreement, addLeaseagreement, updateLeaseagreement } from "@/api/system/leaseagreement";

export default {
  name: "Leaseagreement",
  dicts: ['less_type', 'contractstatus', 'contracttype'],
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
      // 租赁合同信息表格数据
      leaseagreementList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        tenantId: null,
        propertyId: null,
        startDate: null,
        endDate: null,
        monthlyRent: null,
        agreementType: null,
        status: null,
        createdAt: null,
        agreementTypeAll: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        startDate: [
          { required: true, message: "合同开始日期不能为空", trigger: "blur" }
        ],
        endDate: [
          { required: true, message: "合同结束日期不能为空", trigger: "blur" }
        ],
        monthlyRent: [
          { required: true, message: "每月租金不能为空", trigger: "blur" }
        ],
        agreementType: [
          { required: true, message: "合同押金支付方式不能为空", trigger: "change" }
        ],
        status: [
          { required: true, message: "合同状态不能为空", trigger: "change" }
        ],
        agreementTypeAll: [
          { required: true, message: "合同类型不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询租赁合同信息列表 */
    getList() {
      this.loading = true;
      listLeaseagreement(this.queryParams).then(response => {
        this.leaseagreementList = response.rows;
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
        agreementId: null,
        tenantId: null,
        propertyId: null,
        startDate: null,
        endDate: null,
        monthlyRent: null,
        agreementType: null,
        status: null,
        createdAt: null,
        agreementTypeAll: null
      };
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
      this.ids = selection.map(item => item.agreementId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加租赁合同信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const agreementId = row.agreementId || this.ids
      getLeaseagreement(agreementId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改租赁合同信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.agreementId != null) {
            updateLeaseagreement(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLeaseagreement(this.form).then(response => {
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
      const agreementIds = row.agreementId || this.ids;
      this.$modal.confirm('是否确认删除租赁合同信息编号为"' + agreementIds + '"的数据项？').then(function() {
        return delLeaseagreement(agreementIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/leaseagreement/export', {
        ...this.queryParams
      }, `leaseagreement_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
