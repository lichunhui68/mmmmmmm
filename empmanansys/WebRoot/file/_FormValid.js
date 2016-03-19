/*******************************************\
 通用表单验证类
\*******************************************/
JetsumFw.Class.FormValid = function() {
	_FILENAME="_FormValid.js";
	_UPDATEDATE="2009-04-17"
    _UPDATE="增加了isID(ID号验证)的常规判断"
	_UPDATEDATE="2009-04-16"
    _UPDATE="增加了isInt0(正整数)的常规判断"
	
	_FormValid = function(frm) {
    this.frm = frm;
    this.errMsg = new Array();
	this.errName = new Array();
   
    this.required = function(inputObj) {
        if (typeof(inputObj) == "undefined" || inputObj.value.trim() == "") {
            return false;
        }
		return true;
    }
    
    this.eqaul = function(inputObj, formElements) {
		var fstObj = inputObj;
		var sndObj = formElements[inputObj.getAttribute('eqaulName')];
		
        if (fstObj != null && sndObj != null) {
            if (fstObj.value != sndObj.value) {
               return false;
            }
        }
		return true;
    }

    this.gt = function(inputObj, formElements) {
		var fstObj = inputObj;
		var sndObj = formElements[inputObj.getAttribute('eqaulName')];
		
        if (fstObj != null && sndObj != null && fstObj.value.trim()!='' && sndObj.value.trim()!='') {
            if (parseFloat(fstObj.value) <= parseFloat(sndObj.value)) {
                 return false;
            }
        }
		return true;
    }

	this.compare = function(inputObj, formElements) {
		var fstObj = inputObj;
		var sndObj = formElements[inputObj.getAttribute('objectName')];
        if (fstObj != null && sndObj != null && fstObj.value.trim()!='' && sndObj.value.trim()!='') {
            if (!(eval(parseFloat(fstObj.value) + inputObj.getAttribute('operate') + parseFloat(sndObj.value)))) {
                 return false;
            }
        }
		return true;
	}
	
	this.limit = function (inputObj) {
		var len = inputObj.value.length;
		if (len) {
			var minv = parseInt(inputObj.getAttribute('min'));
			var maxv = parseInt(inputObj.getAttribute('max'));
			minv = minv || 0;
			maxv = maxv || Number.MAX_VALUE;
			return minv <= len && len <= maxv;
		}
		return true;
	}
	
	this.range = function (inputObj) {
		var val = parseInt(inputObj.value);
		if (inputObj.value) {
			var minv = parseInt(inputObj.getAttribute('min'));
			var maxv = parseInt(inputObj.getAttribute('max'));
			minv = minv || 0;
			maxv = maxv || Number.MAX_VALUE;
		
			return minv <= val && val <= maxv;
		}
		return true;
	}
	
	this.requireChecked = function (inputObj) {
		var minv = parseInt(inputObj.getAttribute('min'));
		var maxv = parseInt(inputObj.getAttribute('max'));
		minv = minv || 1;
		maxv = maxv || Number.MAX_VALUE;
	
		var checked = 0;
		var groups = document.getElementsByName(inputObj.name);
		
		for(var i=0;i<groups.length;i++) {
			if(groups[i].checked) checked++;
			
		}
		return minv <= checked && checked <= maxv;
	}
	
	this.filter = function (inputObj) {
		var value = inputObj.value;
		var allow = inputObj.getAttribute('allow');
		if (value.trim()) {
			return new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, allow.split(/\s*,\s*/).join("|")), "gi").test(value);
		}
		return true;
	}
	
	this.isNo = function (inputObj) {
		var value = inputObj.value;
		var noValue = inputObj.getAttribute('noValue');
		return value!=noValue;
	}
 	this.isTelephone = function (inputObj) {
        inputObj.value = inputObj.value.trim();
        if (inputObj.value == '') {
            return true;
        } else {
            if (!RegExps.isMobile.test(inputObj.value) && !RegExps.isPhone.test(inputObj.value)) {
				return false;
			}
        }
        return true;
	}
    this.checkReg = function(inputObj, reg, msg) {
        inputObj.value = inputObj.value.trim();

        if (inputObj.value == '') {
            return true;
        } else {
            return reg.test(inputObj.value);
        }
    }

    this.passed = function() {
        if (this.errMsg.length > 0) {
            JetsumFw.Class.FormValid.showError(this.errMsg,this.errName,this.frm.name);
			if (this.errName[0].indexOf('[')==-1) {
            	frt = document.getElementsByName(this.errName[0])[0];
				//if (frt.type=='text' || frt.type=='password') {
					frt.focus();
				//}
			}
            return false;
        } else {
          return JetsumFw.Class.FormValid.succeed();
        }
    }

    this.addErrorMsg = function(name,str) {
        this.errMsg.push(str);
		this.errName.push(name);
    }
	
    this.addAllName = function(name) {
		_FormValid.allName.push(name);
    }
}
_FormValid.allName = new Array();


this.validator=function(frm) {
	var formElements = frm.elements;
	var fv = new _FormValid(frm);
	_FormValid.allName = new Array();
	for (var i=0; i<formElements.length;i++) {
		if (formElements[i].disabled==true) continue;
		var msgs = fvCheck(formElements[i],fv,formElements);
		if (msgs.length>0) {
			for (n in msgs) {
				fv.addErrorMsg(formElements[i].name,msgs[n]);
			}
		}
	}
	return fv.passed();
}


function fvCheck(e,fv,formElements) {
	var validType = e.getAttribute('valid');
	var errorMsg = e.getAttribute('errmsg');
	if (!errorMsg) {
		errorMsg = '';
	}
	if (validType==null) return [];
	fv.addAllName(e.name);
	var vts = validType.split('|');
	
	var ems = errorMsg.split('|');
	var r = [];

	for (var j=0; j<vts.length; j++) {
		var curValidType = vts[j];
		var curErrorMsg = ems[j];
		var validResult;
		switch (curValidType) {
		case 'isPwd':
		case 'isNumber':
		case 'isFloat':
		case 'isEmail':
		case 'isPhone':
		case 'isMobile':
		case 'isIdCard':
		case 'isMoney':
		case 'isZip':
		case 'isQQ':
		case 'isInt':
		case 'isInt0':
		case 'isEnglish':
		case 'isChinese':
		case 'isUrl':
		case 'isDate':
		case 'isTime':
		case 'isID':
			validResult = fv.checkReg(e,RegExps[curValidType],curErrorMsg);
			break;
		case 'regexp':
			validResult = fv.checkReg(e,new RegExp(e.getAttribute('regexp'),"g"),curErrorMsg);
			break;
		case 'custom':
			validResult = eval(e.getAttribute('custom')+'(e,formElements)');
			break;
		default :
			validResult = eval('fv.'+curValidType+'(e,formElements)');
			break;
		}
		if (!validResult) r.push(curErrorMsg);
	}
	return r;
}
String.prototype.trim = function() {
	return this.replace(/^\s*|\s*$/g, "");
}

var iname = [];
this.initValid=function(frm) {
	var formElements = frm.elements;
	for (var i=0; i<formElements.length;i++) {
		var validType = formElements[i].getAttribute('valid');
		if (validType==null) continue;
		formElements[i].onblur = (function (a,b) {
			return function (){validInput(a,b)}
		})(formElements[i],frm);
	}
}
function validInput(ipt,frm) {
	var fv = new _FormValid(frm);
	var formElements = frm.elements;
	var msgs = fvCheck(ipt,fv,formElements);
	JetsumFw.Class.FormValid.errorInput(ipt,msgs);
	
}


var RegExps = function(){};
RegExps.isPwd = /^\s*[.A-Za-z0-9_-]{6,20}\s*$/;
RegExps.isNumber = /^[0-9]*$/;
RegExps.isFloat = /(^-?\d*\.?\d*$)|(^-?\d*\.?$)/;
RegExps.isEmail =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
RegExps.isPhone = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/;
RegExps.isMobile = /^((\(\d{2,3}\))|(\d{3}\-))?(13|15)\d{9}$/;
RegExps.isIdCard = /(^\d{15}$)|(^\d{17}[0-9Xx]$)/;
RegExps.isMoney = /^\d+(\.\d+)?$/;
RegExps.isZip = /^[1-9]\d{5}$/;
RegExps.isQQ = /^[1-9]\d{4,10}$/;
RegExps.isInt = /^[-\+]?\d+$/;
RegExps.isEnglish = /^[A-Za-z]+$/;
RegExps.isChinese =  /^[\u0391-\uFFE5]+$/;
RegExps.isUrl = /^http[s]?:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
RegExps.isDate = /^\d{4}-\d{1,2}-\d{1,2}$/;
RegExps.isTime = /^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}$/;
RegExps.isInt0 = /^[1-9]{1}[0-9]*$/;
RegExps.isID = /^[1-9]{1}[0-9]*(,?[1-9]{1}[0-9]*)*$/;
}
JetsumFw.Class.FormValid.errorInput=function(ipt,msgs){
if (msgs.length>0) {
		document.getElementById('errMsg_'+ipt.name).innerHTML = msgs.join(',');
		document.getElementById('errMsg_'+ipt.name).className="errors";
	} else {
		document.getElementById('errMsg_'+ipt.name).innerHTML = '';
		document.getElementById('errMsg_'+ipt.name).className="";		
	}
}
JetsumFw.Class.FormValid.showError = function(errMsg) {
	//var msg = "";
	//for (i = 0; i < errMsg.length; i++) {
	//	msg += "- " + errMsg[i] + "\n";
	//}
	alert(errMsg[0]);
}
JetsumFw.Class.FormValid.succeed = function () {
	return true;
}