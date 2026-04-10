<html>
<head><style>
.myTextbox{
    font-size: 32px;
    size: 30px;
}

.myButton{
    font-size: 32px;
    size: 30px;
}

</style>
<script language="javascript">
function generateOTP()
{
var otps=["1234","1324","2341","3214","3421","4132","2413","4321","2134","3124"];
var n=Math.floor(Math.random()*(9)+0);
alert("Your OTP is "+otps[n]);
}
</script>
</head>
<body>
<input type="button" value="Generate OTP" onClick="generateOTP()" class="myButton">
</body></html>
