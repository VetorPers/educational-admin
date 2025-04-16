var e=Object.defineProperty,t=Object.getOwnPropertySymbols,a=Object.prototype.hasOwnProperty,r=Object.prototype.propertyIsEnumerable,l=(t,a,r)=>a in t?e(t,a,{enumerable:!0,configurable:!0,writable:!0,value:r}):t[a]=r;import{Q as n}from"./vue-quill.esm-bundler.1cb9a179.js";/* empty css                       */import"./index.425550fe.js";import{E as o,b as s,A as i,e as u,f as p,_ as d,t as c,r as m,M as g,v,o as b,g as h,m as y,h as f,w as j,p as x}from"./vendor.7a5fefe5.js";const w={name:"",props:{type:{type:Number,required:!0}},components:{QuillEditor:n},setup(e,n){const m=s({toolbar:[["bold","italic","underline","strike"],[{header:1},{header:2}],[{list:"ordered"},{list:"bullet"}],[{size:["small",!1,"large","huge"]}],[{color:[]},{background:[]}],[{align:[]}]]}),g=i(""),v=i(null),b=i(!1),h=e.type,y=i(null);u((()=>{})),p((()=>{f()}));const f=()=>{b.value=!0,(e=>o({url:"/api/agreement/getAgreement",params:{type:e},method:"get"}))(h).then((e=>{e.data.data.length&&(v.value=e.data.data[0].id,g.value=e.data.data[0].content,y.value.setContents(g.value))})).catch((e=>{d.error(e.msg)})).finally((()=>{b.value=!1}))},j=c(m);return((e,n)=>{for(var o in n||(n={}))a.call(n,o)&&l(e,o,n[o]);if(t)for(var o of t(n))r.call(n,o)&&l(e,o,n[o]);return e})({loading:b,content:g,quill:y,getContent:f,commitAgreement:()=>{b.value=!0;let e={type:h,content:y.value.getContents()};v.value?(e.id=v.value,(e=>o({url:"/api/agreement/updateAgreement",data:e,method:"post"}))(e).then((e=>{d.success("修改成功")})).catch((e=>{d.error("修改失败")})).finally((()=>{b.value=!1}))):(e=>o({url:"/api/agreement/addAgreement",data:e,method:"post"}))(e).then((e=>{d.success("添加成功"),f()})).catch((e=>{d.error("添加失败"),b.value=!1}))}},j)}},A={style:{"padding-top":"20px"}},O={style:{"margin-top":"10px"},class:"g-flex-end"};w.render=function(e,t,a,r,l,n){const o=m("QuillEditor"),s=m("el-button"),i=g("loading");return v((b(),h("div",A,[y(o,{ref:"quill",style:{"min-height":"400px","max-height":"460px",overflow:"auto"},theme:"snow",contentType:"html",content:r.content,toolbar:e.toolbar},null,8,["content","toolbar"]),f("div",O,[y(s,{onClick:r.commitAgreement,type:"primary",size:"mini"},{default:j((()=>[x("提 交")])),_:1},8,["onClick"])])])),[[i,r.loading]])};export{w as _};
