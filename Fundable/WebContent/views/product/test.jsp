<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <style>
    /* 선택한 내용을 표시할 div 스타일 */
    #result {
      margin-top: 20px;
      padding: 10px;
      border: 1px solid #ccc;
      display: none;
    }
  </style>
</head>
<body>
  <div>
    <input type="checkbox" id="checkbox1" onchange="showSelectedContent('checkbox1')" />
    <label for="checkbox1">컨텐츠 1</label>
  </div>
  
  <div>
    <input type="checkbox" id="checkbox2" onchange="showSelectedContent('checkbox2')" />
    <label for="checkbox2">컨텐츠 2</label>
  </div>
  
  <div>
    <input type="checkbox" id="checkbox3" onchange="showSelectedContent('checkbox3')" />
    <label for="checkbox3">컨텐츠 3</label>
  </div>
  
  <div id="amount"></div>
  
  <script>
    function showSelectedContent(checkboxId) {
      var checkbox = document.getElementById(checkboxId);
      var amountDiv = document.getElementById("amount");
      
      // 선택한 내용을 표시할 div 업데이트
      if (checkbox.checked) {
        amountDiv.style.display = "block";
        amountDiv.innerHTML = checkbox.labels[0].innerText;
      } else {
    	  amountDiv.style.display = "none";
    	  amountDiv.innerHTML = "";
      }
    }
  </script>
</body>
</html>
