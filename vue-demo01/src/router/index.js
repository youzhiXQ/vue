import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import index from '@/components/index'
import  userlist  from '@/components/user/userlist'

Vue.use(Router)

export default new Router({
  routes: [
    //父子级别的路径
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld,
      // children:[
      //   {
      //     path:"/index",
      //     name:"index",
      //     component:index
      //   }
      // ]
    },
    //单文件夹路径
    {
      //真实的跳转的路径
      path:"/index",
      //名字随便写都可以
      name:'index',
      //组成
      component:index
    },
    //新建文件夹后的路径
    {
      path:'/user/userlist',
      name:"userlist",
      component:userlist
    },


  ]
})
