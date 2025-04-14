var e=Object.defineProperty,a=Object.getOwnPropertySymbols,l=Object.prototype.hasOwnProperty,t=Object.prototype.propertyIsEnumerable,n=(a,l,t)=>l in a?e(a,l,{enumerable:!0,configurable:!0,writable:!0,value:t}):a[l]=t,o=(e,o)=>{for(var s in o||(o={}))l.call(o,s)&&n(e,s,o[s]);if(a)for(var s of a(o))t.call(o,s)&&n(e,s,o[s]);return e};import{s,l as r,r as i,e as c}from"./goods.491108ae.js";import{D as u,y as d,a as p,d as m,e as g,t as b,r as f,L as h,o as _,c as y,q as v,g as x,p as V,M as C,w,f as k,_ as S,j as O,n as j,k as z}from"./vendor.456c50f4.js";import"./index.4a156f7e.js";const I={name:"",props:{dialogVisible:{type:Boolean,required:!0,defalut:!1},dataArr:{type:Array,required:!0}},components:{ElMessage:u},emits:["close","saveSuccess"],setup(e,a){const l=d(!1),t=d(""),n=p({tableData:[]});m((()=>{n.tableData=JSON.parse(JSON.stringify(e.dataArr))})),g((()=>{}));const r=b(n);return o({commit:()=>{if(n.tableData.findIndex((e=>!e.express_company||!e.express_number))>=0)return u.warning("请完善表单",{confirmButtonText:"确认",cancelButtonText:"取消"});S.confirm("确认提交").then((()=>{l.value=!0,s({sendInfo:n.tableData}).then((e=>{u.success("提交成功"),a.emit("saveSuccess")})).catch((e=>{})).finally((()=>{l.value=!1}))})).catch((e=>{}))},close:()=>{a.emit("close",!1)},loading:l,expressCompany:t,lotSizeAddInfo:()=>{n.tableData.forEach((e=>{e.express_company=t.value}))}},r)}},A=x("div",null,"快递公司",-1),L={class:"dialog-footer"};I.render=function(e,a,l,t,n,o){const s=f("el-empty"),r=f("el-table-column"),i=f("el-input"),c=f("el-table"),u=f("el-button"),d=f("el-dialog"),p=h("loading");return _(),y(d,{width:"80%",title:"编辑物流信息","model-value":l.dialogVisible,"before-close":t.close},{footer:v((()=>[x("span",L,[V(u,{onClick:t.close,size:"small"},{default:v((()=>[C("取 消")])),_:1},8,["onClick"]),V(u,{type:"primary",onClick:t.commit,size:"small"},{default:v((()=>[C("确 定")])),_:1},8,["onClick"])])])),default:v((()=>[w((_(),k("div",null,[V(c,{ref:"table",data:e.tableData,style:{width:"100%"},"max-height":"400px"},{empty:v((()=>[V(s,{description:"暂无数据"})])),default:v((()=>[V(r,{prop:"nick",label:"用户昵称"}),V(r,{prop:"goods_name",label:"兑换商品"}),V(r,{prop:"addressLabel",label:"邮寄地址"}),V(r,{prop:"express_company",label:"快递公司"},{header:v((()=>[A,V(i,{modelValue:t.expressCompany,"onUpdate:modelValue":a[0]||(a[0]=e=>t.expressCompany=e),size:"mini",placeholder:"批量添加",onBlur:t.lotSizeAddInfo},null,8,["modelValue","onBlur"])])),default:v((e=>[V(i,{size:"mini",modelValue:e.row.express_company,"onUpdate:modelValue":a=>e.row.express_company=a},null,8,["modelValue","onUpdate:modelValue"])])),_:1}),V(r,{prop:"express_number",label:"快递单号"},{default:v((e=>[V(i,{size:"mini",modelValue:e.row.express_number,"onUpdate:modelValue":a=>e.row.express_number=a},null,8,["modelValue","onUpdate:modelValue"])])),_:1})])),_:1},8,["data"])])),[[p,t.loading]])])),_:1},8,["model-value","before-close"])};const D={name:"bannerIndex",props:{},components:{ElMessage:u,LogisticsInfo:I},setup(e,a){const l=p({targetObj:null,tableData:[],paginationObj:{current:1,size:10,total:0},searchInfo:{name:"",exchange_status:"",type:"",date:""},selectionArr:[],dataArr:[]}),t=d(!1),n=d(!1),s=d(!1),f=d("name"),h=d("");const _=()=>{t.value=!0;let e=Object.assign(l.searchInfo,l.paginationObj);e[f.value]=h.value,r(e).then((e=>{l.tableData=e.data.data,l.tableData.forEach((e=>{switch(e.addressLabel=e.province+e.city+e.area+e.detail,e.exchange_status){case 1:e.statusLabel="待充值";break;case 2:e.statusLabel="已充值";break;case 3:switch(e.cancel_status){case 1:e.statusLabel="待发货";break;case 2:e.statusLabel="用户取消待审核";break;case 3:e.statusLabel="取消已驳回";break;case 4:e.statusLabel="用户取消"}break;case 4:e.statusLabel="已发货"}})),l.paginationObj.total=e.data.total})).catch((e=>{u.error(e.msg)})).finally((()=>{t.value=!1}))},y=async e=>(t.value=!0,await i({ids:e}).then((e=>{_()})).catch((e=>{})).finally((()=>{t.value=!1})));m((()=>{_()})),g((()=>{}));const v=b(l);return o({pageSizeChange:e=>{l.paginationObj.size=e,l.paginationObj.current=1,_()},pageCurrentChange:e=>{l.paginationObj.current=e,_()},changeDiaStatus:function(e){n.value=e},getList:_,search:()=>{l.paginationObj.current=1,_()},updateRecharge:y,handleSelectionChange:e=>{l.selectionArr=e},lotSizeRecharge:async()=>{if(!l.selectionArr.length)return u.warning("请先勾选需要充值的订单");if(l.selectionArr.findIndex((e=>1==e.goods_type))>=0)return u.warning("包含了实物订单，无法充值");let e=l.selectionArr.map((e=>e.id));return await y(e.join(","))},updateSendStatus:e=>{if(!e.length)return u.warning("请先勾选需要发货的订单");if(e.findIndex((e=>0==e.goods_type))>=0)return u.warning("包含了虚拟商品，无法发货");l.dataArr=JSON.parse(JSON.stringify(e)),n.value=!0},saveSuccess:()=>{n.value=!1,_()},checkSendInfo:e=>{l.targetObj=e,s.value=!0},examine:e=>{S.confirm("用户取消订单，请审核","审核",{confirmButtonText:"通 过",cancelButtonText:"驳 回",distinguishCancelAndClose:!0}).then((()=>{t.value=!0,c({id:e.id,type:1,user_id:e.user_id,integral_price:e.integral_price}).then((e=>{u({type:"success",message:"已通过"}),_()})).catch((e=>{t.value=!1,u({type:"error",message:"审核失败"})}))})).catch((a=>{"cancel"==a&&(t.value=!0,c({id:e.id,type:2,user_id:e.user_id,integral_price:e.integral_price}).then((e=>{u({type:"success",message:"已驳回"}),_()})).catch((e=>{t.value=!1,u({type:"error",message:"审核失败"})})))}))},dialogFormVisible:s,loading:t,dialogVisible:n,searchKey:f,searchValue:h},v)}},U={class:"btn-wrap g-flex-between"},B={class:"g-flex-start"},E={class:"footer-wrap g-flex-end"},M={class:"dialog-footer"};D.render=function(e,a,l,t,n,o){const s=f("el-option"),r=f("el-select"),i=f("el-date-picker"),c=f("el-input"),u=f("el-button"),d=f("el-space"),p=f("el-empty"),m=f("el-table-column"),g=f("el-table"),b=f("el-pagination"),S=f("LogisticsInfo"),I=f("el-form-item"),A=f("el-form"),L=f("el-dialog"),D=h("loading");return _(),k("div",null,[x("div",U,[V(d,null,{default:v((()=>[V(r,{size:"mini",modelValue:e.searchInfo.exchange_status,"onUpdate:modelValue":a[0]||(a[0]=a=>e.searchInfo.exchange_status=a),placeholder:"状态",clearable:""},{default:v((()=>[V(s,{label:"待充值",value:1}),V(s,{label:"已充值",value:2}),V(s,{label:"待发货",value:3}),V(s,{label:"已发货",value:4})])),_:1},8,["modelValue"]),V(r,{size:"mini",modelValue:e.searchInfo.type,"onUpdate:modelValue":a[1]||(a[1]=a=>e.searchInfo.type=a),placeholder:"商品类型",clearable:""},{default:v((()=>[V(s,{label:"虚拟商品",value:0}),V(s,{label:"实物商品",value:1})])),_:1},8,["modelValue"]),V(i,{size:"mini",modelValue:e.searchInfo.date,"onUpdate:modelValue":a[2]||(a[2]=a=>e.searchInfo.date=a),type:"daterange","unlink-panels":"","range-separator":"至","start-placeholder":"起始日期","end-placeholder":"结束日期","value-format":"YYYY-MM-DD"},null,8,["modelValue"]),x("div",B,[V(r,{size:"mini",modelValue:t.searchKey,"onUpdate:modelValue":a[3]||(a[3]=e=>t.searchKey=e),placeholder:"选择条件"},{default:v((()=>[V(s,{label:"用户昵称",value:"name"}),V(s,{label:"超云账号",value:"poseidon_username"})])),_:1},8,["modelValue"]),V(c,{size:"mini",modelValue:t.searchValue,"onUpdate:modelValue":a[4]||(a[4]=e=>t.searchValue=e)},null,8,["modelValue"])]),V(u,{size:"mini",type:"primary",onClick:t.search},{default:v((()=>[C("查询")])),_:1},8,["onClick"])])),_:1}),V(d,null,{default:v((()=>[V(u,{onClick:t.lotSizeRecharge,type:"primary",size:"small"},{default:v((()=>[C("批量充值")])),_:1},8,["onClick"]),V(u,{onClick:a[5]||(a[5]=a=>t.updateSendStatus(e.selectionArr)),type:"primary",size:"small"},{default:v((()=>[C("批量发货")])),_:1})])),_:1})]),w((_(),y(g,{ref:"table",data:e.tableData,border:"",style:{width:"100%"},onSelectionChange:t.handleSelectionChange},{empty:v((()=>[V(p,{description:"暂无数据"})])),default:v((()=>[V(m,{type:"selection",width:"55"}),V(m,{prop:"nick",label:"用户昵称"}),V(m,{prop:"poseidon_username",label:"超云账号"}),V(m,{prop:"goods_name",label:"兑换商品"}),V(m,{prop:"goods_type",label:"商品类型"},{default:v((e=>[x("div",{style:j({color:0==e.row.goods_type?"#b7cbe4":"#2ccbff"})},O(0==e.row.goods_type?"虚拟商品":"实物商品"),5)])),_:1}),V(m,{prop:"create_time",label:"兑换时间"}),V(m,{prop:"integral_price",label:"消耗积分"}),V(m,{prop:"addressLabel",label:"邮寄地址"}),V(m,{prop:"statusLabel",label:"状态"},{default:v((e=>[x("div",{style:j({color:1==e.row.exchange_status||3==e.row.exchange_status?"#ff1354":"#00ec00"})},O(e.row.statusLabel),5)])),_:1}),V(m,{prop:"update_time",label:"修改时间"}),V(m,{label:"操作"},{default:v((e=>[1==e.row.exchange_status?(_(),y(u,{key:0,type:"text",onClick:a=>t.updateRecharge(e.row.id)},{default:v((()=>[C("充 值")])),_:2},1032,["onClick"])):z("",!0),3!=e.row.exchange_status||1!=e.row.cancel_status&&3!=e.row.cancel_status?z("",!0):(_(),y(u,{key:1,type:"text",onClick:a=>t.updateSendStatus([e.row])},{default:v((()=>[C("发 货")])),_:2},1032,["onClick"])),3==e.row.exchange_status&&2==e.row.cancel_status?(_(),y(u,{key:2,type:"text",onClick:a=>t.examine(e.row)},{default:v((()=>[C("审 核")])),_:2},1032,["onClick"])):z("",!0),4==e.row.exchange_status?(_(),y(u,{key:3,type:"text",onClick:a=>t.checkSendInfo(e.row)},{default:v((()=>[C("发货信息")])),_:2},1032,["onClick"])):z("",!0)])),_:1})])),_:1},8,["data","onSelectionChange"])),[[D,t.loading]]),x("div",E,[V(b,{layout:"prev, pager, next",total:e.paginationObj.total,"current-page":e.paginationObj.current,"page-size":e.paginationObj.size,onSizeChange:t.pageSizeChange,onCurrentChange:t.pageCurrentChange},null,8,["total","current-page","page-size","onSizeChange","onCurrentChange"])]),t.dialogVisible?(_(),y(S,{key:0,dialogVisible:t.dialogVisible,dataArr:e.dataArr,onClose:t.changeDiaStatus,onSaveSuccess:t.saveSuccess},null,8,["dialogVisible","dataArr","onClose","onSaveSuccess"])):z("",!0),V(L,{modelValue:t.dialogFormVisible,"onUpdate:modelValue":a[7]||(a[7]=e=>t.dialogFormVisible=e),title:"发货信息"},{footer:v((()=>[x("span",M,[V(u,{type:"primary",onClick:a[6]||(a[6]=e=>t.dialogFormVisible=!1)},{default:v((()=>[C("关闭")])),_:1})])])),default:v((()=>[V(A,{model:e.targetObj},{default:v((()=>[V(I,{label:"订单号：",prop:"exchange_operation_id"},{default:v((()=>[x("div",null,O(e.targetObj.exchange_operation_id),1)])),_:1}),V(I,{label:"快递公司：",prop:"express_company"},{default:v((()=>[x("div",null,O(e.targetObj.express_company),1)])),_:1}),V(I,{label:"快递单号：",prop:"express_number"},{default:v((()=>[x("div",null,O(e.targetObj.express_number),1)])),_:1}),V(I,{label:"发货日期：",prop:"update_time"},{default:v((()=>[x("div",null,O(e.targetObj.update_time),1)])),_:1})])),_:1},8,["model"])])),_:1},8,["modelValue"])])},D.__scopeId="data-v-e5b2184e";export{D as default};
