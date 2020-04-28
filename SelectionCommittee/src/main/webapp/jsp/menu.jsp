
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


  <div id="wrapper" class="animate">
    <nav class="navbar header-top fixed-top navbar-expand-lg  navbar-dark bg-dark">
      <span class="navbar-toggler-icon leftmenutrigger"></span>
      <a class="navbar-brand" href="#">Entrants</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav animate side-nav">
          <li class="nav-item">
             <a class="nav-link" href="/home">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <security:authorize access="hasRole('ROLE_ADMIN')">
			 <a href="/create-entrant" class="nav-link">Create entrant</a> 
			</security:authorize>
          </li>
          <li class="nav-item">
            <a href="/success-entrans" class="nav-link">Rating</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-md-auto d-md-flex">
          <li class="nav-item">
            <button class="nav-link product-logout" style = "color : #2e3639">LogOut</button>
          </li>
        </ul>
      </div>
    </nav>
  
  </div>