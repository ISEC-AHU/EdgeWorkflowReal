<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FogWorkflowSim</title>
    <meta charset="utf-8">
    <script src="/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.all.js"></script>
    <link rel="stylesheet" href="/css/chart.css">
</head>
<body>
<div id="alg" style="margin-left: 410px;"></div>
<div id="main" style="width: 900px;height:400px;"></div>
<script src="/echarts/echarts.min.js"></script>
<script>
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    var data = parent.$("#chart_content").text();
    var json = eval("("+data+")");
    $("#alg").text(json.alg + " Algorithm");
    console.log(json.alg);
    // 指定图表的配置项和数据
    var option = {
        xAxis: {
            name: json.x_name,
            type: 'category',
            data: json.x,
        },
        yAxis: {
            name: json.y_name,
            type: 'value',
            min: function (value) {
                return parseInt(value.min) - 5;
            }
        },
        series: [{
            data: json.y,
            type: 'line'
        }]
    };
    // var ajaxbg = $("#background,#progressBar");
    // ajaxbg.hide();
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);



    /*var myChart = echarts.init(document.getElementById('main'));

    var data1 = '{"x":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99],"y":[116.811,108.81325000000002,108.81325000000002,107.20255769230772,104.53878846153849,104.53878846153849,104.10119230769232,104.10119230769232,103.48319230769233,103.30503846153847,102.98559615384617,102.80744230769231,102.80744230769231,102.80744230769231,102.80744230769231,102.80744230769231,102.80744230769231,102.80744230769231,102.80744230769231,102.80744230769231,102.79157692307693,102.6456153846154,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002,102.62975000000002],"x_name":"Iterations","y_name":"Time","alg":"PSO"}';
    var data2 =  '{"x":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99],"y":[185.23634615384614,185.23634615384614,185.23634615384614,170.71302884615383,170.71302884615383,170.71302884615383,169.67644230769233,169.67644230769233,169.67644230769233,168.47802884615385,168.47802884615385,168.47802884615385,168.47802884615385,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.63760576923073,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612,163.25034615384612],"x_name":"Iterations","y_name":"Time","alg":"GA"}';

    var json1 = eval("("+data1+")");
    var json2 = eval("("+data2+")");
    $("#alg").text(json1.alg + " Algorithm");
    console.log(json1.alg);
    // 指定图表的配置项和数据
    var option1 = {
        title:{
            text:"Algorithm Comparison"
        },
        tooltip: {},
        legend:{
            data:['PSO','GA']
        },
        xAxis: {
            name: json1.x_name,
            type: 'category',
            data: json1.x,
        },
        yAxis: {
            name: json1.y_name,
            type: 'value',
            // min: function (value) {
            //     return parseInt(value.min) - 5;
            // }
        },
        series: [{
            data: json1.y,
            type: 'line',
            name:'PSO'
        },{
            data:json2.y,
            type:'line',
            name:'GA'
        }]
    };



    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option1);*/
</script>
</body>
</html>