
<table>
  <caption><b>Info_Connection</b></caption>
  <tr>
    <th>NAME</th>
    <th>CONNECTION</th>
  </tr>  
  <tr>
    <td>Username</td>
    <td>idd</td> 
  </tr> 
  <tr>
    <td>Password</td>
    <td>bazededate</td> 
  </tr>  
  <tr>
    <td>Hostname</td>
    <td>193.226.51.37</td> 
  </tr>
  <tr>
    <td>Port</td>
    <td>1521</td> 
  </tr>  
  <tr>
    <td>SID</td>
    <td>o11g</td> 
  </tr>
</table>

<br>

<table>
  <caption><b>EMPLOYEES</b></caption>
  <tr>
    <th>Field</th>
    <th>Null ?</th>
    <th>Type</th>
  </tr> 
  <tr>
    <td>EMPLOYEE_ID</td>
    <td>NOT NULL </td> 
    <td>NUMBER(6)</td>
  </tr> 
  <tr>             
    <td>FIRST_NAME</td>
    <td>Yes. </td> 
    <td>VARCHAR2(20)</td>
  </tr>
  <tr>              
    <td>LAST_NAME</td>
    <td> NOT NULL</td> 
    <td>VARCHAR2(25)</td>
  </tr>
  <tr>            
    <td>EMAIL</td>
    <td>NOT NULL</td> 
    <td>VARCHAR2(25)</td>
  </tr> 
  <tr>            
    <td>PHONE_NUMBER</td>
    <td>Yes. </td> 
    <td>VARCHAR2(20)</td>
  </tr>
  <tr>            
    <td>HARE_DATE</td>
    <td>NOT NULL</td> 
    <td>DATE</td>
  </tr>
  <tr>            
    <td>JOB_ID</td>
    <td>NOT NULL</td> 
    <td>VARCHAR2(10)</td>
  </tr>
  <tr>            
    <td>SALARY</td>
    <td>Yes. </td> 
    <td>NUMBER(8,2)</td>
  </tr>
   <tr>            
    <td>COMMISSION_PCT</td>
    <td>Yes. </td> 
    <td>NUMBER(2,2)</td>
  </tr>  
  <tr>            
    <td>MANAGER_ID</td>
    <td>Yes. </td> 
    <td>NUMBER(6)</td>
  </tr>
  <tr>            
    <td>DEPARTMENT_ID</td>
    <td>Yes. </td> 
    <td>NUMBER(4)</td>
  </tr>
</table>

<br><br>

<table>
  <caption><b>DEPARTMENTS</b></caption>
  <tr>
    <th>Field</th>
    <th>Null ?</th>
    <th>Type</th>
  </tr>  
  <tr>
    <td>DEPARTMENT_ID</td>
    <td>NOT NULL </td> 
    <td>NUMBER(4)</td>
  </tr>  
  <tr>             
    <td>DEPARTMENT_NAME</td>
    <td>NOT NULL</td> 
    <td>VARCHAR2(30)</td>
  </tr> 
   <tr>
    <td>MANAGER_ID</td>
    <td>Yes. </td> 
    <td>NUMBER(6)</td>
  </tr> 
  <tr>
    <td>LOCATION_ID</td>
    <td>Yes. </td> 
    <td>NUMBER(4)</td>
  </tr>
</table>

<br><br>

<table>
  <caption><b>JOBS</b></caption>
  <tr>
    <th>Field</th>
    <th>Null ?</th>
    <th>Type</th>
  </tr> 
  <tr>
    <td>JOB_ID</td>
    <td>NOT NULL </td> 
    <td>VARCHAR2(10)</td>
  </tr>
  <tr>
    <td>JOB_TITLE</td>
    <td>NOT NULL </td> 
    <td>VARCHAR2(35)</td>
  </tr> 
  <tr>
    <td>MIN_SALARY</td>
    <td>Yes. </td> 
    <td>NUMBER(6)</td>
  </tr>  
  <tr>
    <td>MAX_SALARY</td>
    <td>Yes. </td> 
    <td>NUMBER(6)</td>
  </tr>
</table>

<br><br>

<table>
  <caption><b>JOB_HISTORY</b></caption>
  <tr>
    <th>Field</th>
    <th>Null ?</th>
    <th>Type</th>
  </tr>  
  <tr>
    <td>EMPLOYEE_ID</td>
    <td>NOT NULL </td> 
    <td>NUMBER(6)</td>
  </tr> 
  <tr>
    <td>START_DATE</td>
    <td>NOT NULL</td> 
    <td>DATE</td>
  </tr>  
  <tr>
    <td>END_DATE</td>
    <td>NOT NULL</td> 
    <td>DATE</td>
  </tr>
  <tr>
    <td>JOB_ID</td>
    <td>NOT NULL </td> 
    <td>VARCHAR2(10)</td>
  </tr>  
  <tr>
    <td>DEPARTMENT_ID</td>
    <td>NOT NULL </td> 
    <td>NUMBER(4)</td>
  </tr>
</table>
