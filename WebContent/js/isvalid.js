function isValid() {
	var num = document.getElementById("number").value;
	if (num == "") {
		return true;
	} else if (!isNum(num)) {
		return true;
	} else {
		return true;
	}
}
function isNum(num){
	 var reNum = /^\d*$/;
	 return(reNum.test(num));
}