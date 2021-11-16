<%@ page import="java.util.*"%>
<%@ page import="edu.umsl.math.beans.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Math Question Bank</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

<script type="text/javascript">
	window.MathJax = {
		tex2jax : {
			inlineMath : [ [ '$', '$' ], [ "\\(", "\\)" ] ],
			processEscapes : true
		}
	};
</script>
</head>
<body>
    <!--   Today's Date: <%= java.time.LocalDateTime.now() %> -->
    
    Current date and time:
    <%
      DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
      LocalDateTime now = LocalDateTime.now();
      out.print(dtf.format(now)); 
    %>
    
    <%
		List<Problem> myproblist = (List<Problem>) request.getAttribute("problist");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<table width="100%" class="table table-bordered table-striped">
					<%
						for (Problem prob : myproblist) {
					%>
					<tr>
						<td id="pid<%=prob.getPid()%>" width="8%" class="text-center"><%=prob.getPid()%></td>
						<td width="84%"><%=prob.getContent()%></td>
						<td width="8%">
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>