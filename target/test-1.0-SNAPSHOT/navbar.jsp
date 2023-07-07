<%-- 
    Document   : navbar
    Created on : Jun 28, 2023, 12:31:52 AM
    Author     : rebaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
    Cookie[] cookies = request.getCookies();
    String username = null;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
                break;
            }
        }
    }
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="Home.jsp">Bike Shop</a>
        
        <span class="navbar-text">Welcome, <%= username%></span>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Home.jsp">Bicycles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">My Orders</a>
                </li>
                <li class="nav-item">
                    <% 
                    String admin = (String) session.getAttribute("username");
                    if(admin.equals("mhamad")){
                        
                       
                    %>
                    <form action="UserServlet" method="post"><button>admin</button></form>
                    <% } else {
%>
<p></p>
<%
}%>
                    
                    
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:history.back()">Back</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
