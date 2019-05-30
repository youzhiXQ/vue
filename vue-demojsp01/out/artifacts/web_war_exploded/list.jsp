<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2019/5/30
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <title>Title</title>


</head>
<body>

<div id="app">
    <ol v-for="l in lists">
        <li>{{l.id}} {{l.value}}
            <button v-on:click="edit('{{l.id}}')">edit</button>
        </li>
    </ol>


    <input ref="id" name="id" id="id" v-if="seenid" v-model="id2"/>
    <input ref="name" name="value" id="name" v-if="seenname" v-model="name2"/>
    <button v-on:click="add">add</button>


</div>


</body>

<script>
    var app = new Vue({
        el: "#app",
        data: {
            seenid: false,
            seenname: false,
            lists: [
                {id: "1", value: "value1"},
                {id: "2", value: "value2"},
                {id: "3", value: "value3"}
            ],
        },
        methods: {
            add: function (index) {
                this.seenid = true,
                    this.seenname = true,
                    //    值
                    //     console.log(this.$refs.id.value);
                    // console.log(this.$refs.name.value);
                    //    元素
                    // var myid = document.getElementById("id");
                    // var myname = document.getElementById("name");
                    console.log(this.id2);
                console.log(this.name2);
                app.lists.push({id: this.id2, value: this.name2});
                // app.lists.push({id: this.$refs.id.value, value: this.refs.name.value});
                this.seenid = false,
                    this.seenname = false
            },
            edit: function (index) {
                this.seenid = true,
                    this.seenname = true,
                    app.lists.push(index, {id: this.id2, value: this.name2});

            },
            delete: function () {

            }
        }
    })
</script>
</html>
