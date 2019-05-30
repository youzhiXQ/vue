<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>


<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>


<body>


<div id="app">
    {{ message }}
    <button v-on:click="myclick">这是第一个点击按钮</button>
    <button v-on:click="reverseMessage">逆转消息</button>
    <%--    此处不可以写成  移入按钮 提示此信息 时间为：mydate --%>
    <button v-bind:title="mydate">提示时间的按钮</button>
    <%--    两个都有效果--%>
    <lable v-if="seen">这是v-if的判断</lable>
    <lable v-show="seenshow">这是v-show的判断</lable>

    <ol v-for="l in lists">
        <li>{{l.value}}</li>
    </ol>

    <input v-model="message">

    <Vuecomponent1></Vuecomponent1>

    <tode-test
            v-for="item  in lists"
            v-bind:todes="item"
            v-bind:key="item.id"
    ></tode-test>


    <div>foo:{{objs}}</div>

    <p v-once>这个值将不会改变{{objs}}</p>

    <p>这是不用v-html标签的效果：{{htmls}}</p>
    <p>这是用v-html标签的效果：<span v-html="htmls"></span></p>

<button  v-bind:disable="idButton">button</button>
</div>

<button id="button" v-on:click="myclick2">二次点击</button>


<button id="change" v-on:click="foo='hahahaxixixi'">点击不可以响应</button>


</body>


<script>

    var obj = {
        foo: "bar"
    }

    //设置vue不去响应数据
    // Object.freeze(obj);


    Vue.component("tode-test", {
        props: ["todes"],
        template: "<li>{{todes.value}}</li>"
    })


    <%--    自定义组件--%>
    Vue.component(
        "Vuecomponent1", {
            props: ["my"],
            template: "<li>这是一个自定义组件</li>"
        })


    var change = new Vue({
        el: "#change",
        data: obj
    })

    //设置数据改变后 调用
    change.$watch("foo", function (newvalue, oldvalue) {
        console.log("foo的值改变了" + oldvalue + "---->" + newvalue);
    });

    var app = new Vue({
        el: '#app',
        data: {
            idButton:null,
            objs: obj,
            seen: false,
            seenshow: false,
            message: 'Hello Vue!',
            mydate: "移入按钮 提示此信息 时间为：" + new Date().toLocaleDateString(),
            lists: [
                {id: "id1", value: "value1"},
                {id: "id2", value: "value2"},
                {id: "id3", value: "value3"}
            ],
            htmls: '<span  style="background: aqua">这是一个html的标签</span>',
        },
        methods: {
            myclick: function () {
                console.log("点击了并且在lists中加入value4");
                app.lists.push({value: "balue4"});
                //<button  id="change" v-on:click="foo='hahahaxixixi'">点击不可以响应</button>
                console.log(change.$el);
                console.log(document.getElementById("change"));
                console.log("显示change的id")
            },
            reverseMessage: function () {
                this.message = this.message.split('').reverse().join('')
            }
        },
        created: function () {
            console.log("====>" + this.mydate);
        }
    })

    var button = new Vue({
        el: "#button",
        methods: {
            myclick2: function () {
                console.log("二次点击");
            }
        }
    })
</script>


</html>