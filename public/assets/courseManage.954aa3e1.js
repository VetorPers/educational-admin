import{u as e,A as a,e as l,r as t,o,c as s,w as r,h as u,m as i,p as n,g as d,i as c,F as p,_ as v,k as m,b as f,a as _,d as g,M as b,v as h,l as k,q as y}from"./vendor.7a5fefe5.js";import{_ as C}from"./editCourse.1748ce83.js";import{s as w,c as x,t as z,a as V}from"./index.425550fe.js";const A={class:"dialog-footer"},j={__name:"createBill",props:{course_id:Number,dialogVisible:Boolean},emits:["close"],setup(f,{emit:_}){const g=f;e();const b=a(!1),h=a(null),k=a({idArr:[]}),y=a([]),C=()=>{h.value.validate().then((()=>{b.value=!0;const e={course_id:g.course_id,student_ids:k.value.idArr};x(e).then((e=>{v.success("提交成功"),b.value=!1,V("success")})).catch((()=>{v.error("提交失败"),b.value=!1}))})).catch((e=>{}))},z=()=>{V("")},V=e=>{_("close",e)};return l((()=>{b.value=!0,w({page:1,per_page:100,course_id:g.course_id}).then((e=>{y.value=e.data.data.data})).catch((e=>{v.error(e.msg)})).finally((()=>{b.value=!1}))})),(e,a)=>{const l=t("el-checkbox"),v=t("el-checkbox-group"),_=t("el-form-item"),g=t("el-form"),w=t("el-button"),x=t("el-dialog");return o(),s(x,{title:"创建账单","model-value":f.dialogVisible,onClose:z,"close-on-click-modal":!1,"close-on-press-escape":!1},{footer:r((()=>[u("span",A,[i(w,{onClick:a[1]||(a[1]=e=>V("")),size:"small"},{default:r((()=>[n("取 消")])),_:1}),i(w,{type:"primary",onClick:C,size:"small",loading:b.value},{default:r((()=>[n("确 定")])),_:1},8,["loading"])])])),default:r((()=>[u("div",null,[i(g,{ref_key:"formRef",ref:h,model:k.value,"label-width":"100px"},{default:r((()=>[i(_,{label:"选择学生:",prop:"idArr"},{default:r((()=>[i(v,{modelValue:k.value.idArr,"onUpdate:modelValue":a[0]||(a[0]=e=>k.value.idArr=e)},{default:r((()=>[(o(!0),d(p,null,c(y.value,(e=>(o(),s(l,{key:e.id,label:e.id},{default:r((()=>[n(m(e.name),1)])),_:2},1032,["label"])))),128))])),_:1},8,["modelValue"])])),_:1})])),_:1},8,["model"])])])),_:1},8,["model-value"])}},__scopeId:"data-v-013692a4"};const B={class:"btn-wrap g-flex-end"},I={class:"g-ellipsis"},M={class:"footer-wrap g-flex-end"},D={__name:"courseManage",setup(e){const c=a(!1),w=a([]),x=f({total:0,size:10,current:1}),A=a(!1),D=a(!1),N=a({}),O=a({}),T=_(),q=g((()=>T.state.user.userInfo));l((()=>{E()}));const E=()=>{c.value=!0;const e={page:x.current,per_page:x.size};z(e).then((e=>{w.value=e.data.data.data,x.total=e.data.data.total})).catch((e=>{v.error(e.msg)})).finally((()=>{c.value=!1}))},F=()=>{O.value={},A.value=!0},P=e=>{A.value=!1,"success"===e&&E()},R=e=>{D.value=!1,"success"===e&&E()},S=e=>{x.size=e,x.current=1,E()},U=e=>{x.current=e,E()};return(e,a)=>{const l=t("el-button"),f=t("el-empty"),_=t("el-table-column"),g=t("el-tooltip"),z=t("el-table"),T=t("el-pagination"),G=b("loading");return o(),d("div",null,[u("div",B,[i(l,{size:"small",onClick:E},{default:r((()=>[n("刷 新")])),_:1}),i(l,{type:"primary",size:"small",onClick:F},{default:r((()=>[n("添 加")])),_:1})]),h((o(),s(z,{data:w.value,border:"",style:{width:"100%"}},{empty:r((()=>[i(f,{description:"暂无数据"})])),default:r((()=>[i(_,{prop:"name",label:"课程名","min-width":"200px"}),i(_,{prop:"period",label:"年月"}),i(_,{prop:"charge",label:"费用(thb)"}),i(_,{prop:"teacher",label:"教师"},{default:r((e=>{var a;return[n(m(null==(a=e.row.teacher)?void 0:a.name),1)]})),_:1}),i(_,{prop:"description",label:"描述"}),i(_,{prop:"studentName",label:"学生姓名"},{default:r((e=>[i(g,{placement:"bottom"},{content:r((()=>[n(m(e.row.students.map((e=>e.name)).join(", ")),1)])),default:r((()=>[u("div",I,m(e.row.students.map((e=>e.name)).join(", ")),1)])),_:2},1024)])),_:1}),i(_,{label:"操作",width:"200px"},{default:r((e=>{var a;return[(null==(a=e.row.teacher)?void 0:a.id)==q.value.id?(o(),d(p,{key:0},[i(l,{type:"text",onClick:a=>{return l=e.row,O.value=l,void(A.value=!0);var l}},{default:r((()=>[n("修 改")])),_:2},1032,["onClick"]),i(l,{type:"text",onClick:a=>{return l=e.row,N.value=l,void(D.value=!0);var l}},{default:r((()=>[n("创建账单")])),_:2},1032,["onClick"]),i(l,{type:"text",onClick:a=>{return l=e.row.id,void y.confirm("确认删除？","",{confirmButtonText:"确定",cancelButtonText:"取消",closeOnClickModal:!1,closeOnPressEscape:!1}).then((()=>{c.value=!0,V(l).then((e=>{v.success("删除成功"),E()})).catch((e=>{v.error("删除失败"),c.value=!1}))}));var l}},{default:r((()=>[n("删 除")])),_:2},1032,["onClick"])],64)):k("",!0)]})),_:1})])),_:1},8,["data"])),[[G,c.value]]),u("div",M,[i(T,{layout:"prev, pager, next",total:x.total,"current-page":x.current,"page-size":x.size,onSizeChange:S,onCurrentChange:U},null,8,["total","current-page","page-size"])]),A.value?(o(),s(C,{key:0,nowData:O.value,dialogVisible:A.value,onClose:P},null,8,["nowData","dialogVisible"])):k("",!0),D.value?(o(),s(j,{key:1,course_id:N.value.id,dialogVisible:D.value,onClose:R},null,8,["course_id","dialogVisible"])):k("",!0)])}},__scopeId:"data-v-6dd9b9c6"};export{D as default};
