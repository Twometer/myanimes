<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="animes" scope="request" type="tk.myanimes.model.AnimeList"/>
<jsp:useBean id="user" scope="request" type="tk.myanimes.model.UserInfo"/>
<jsp:useBean id="formatter" scope="request" type="tk.myanimes.text.Formatter"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>myanimes</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Unica+One&family=Open+Sans:wght@300&family=Exo:wght@300&display=swap"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/list.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <span class="navbar-brand">myanimes</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto ml-5">
            <li class="nav-item active"><a class="nav-link" href="#">Dashboard</a></li>
            <li class="nav-item active"><a class="nav-link" href="#">Animes</a></li>
            <li class="nav-item active"><a class="nav-link" href="#">Characters</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a class="nav-link" href="#">Log in</a></li>
        </ul>
    </div>
</nav>

<div class="main-content">
    <div class="row align-items-center mt-5">
        <div class="col-sm-auto">
            <span class="profile-picture"
                  style="background-image: url(${user.profilePicture})"></span>
        </div>
        <div class="ml-5 col-sm">
            <h2>${user.name}
                <button class="button primary inline ml-2">Follow</button>
            </h2>

            ${user.biography}
        </div>
        <div class="col-sm-auto">
            <p><img alt="Animes" class="icon" src="${pageContext.request.contextPath}/icon/film.svg"> ${animes.size()}
                animes</p>
            <p><img alt="Watchtime" class="icon"
                    src="${pageContext.request.contextPath}/icon/clock.svg"> ${formatter.formatDuration(animes.getTotalDuration())}
            </p>
            <p><img alt="Location" class="icon"
                    src="${pageContext.request.contextPath}/icon/map-pin.svg"> ${user.location}</p>
        </div>
    </div>
    <div id="favorite-anime" class="row align-items-center mt-5 p-3">
        <div class="col-sm-auto">
            <span class="cover-picture small shadow"
                  style="background-image: url('${user.favoriteAnime.coverPicture}')"></span>
        </div>
        <div class="ml-2 col-sm">
            <h4 class="mb-3">${user.favoriteAnime.canonicalTitle}</h4>
            <h4 class="mt-3" style="opacity: 0.35">my favorite anime</h4>
        </div>
    </div>
    <div class="row mt-5 button-bar">
        <button class="button in-bar primary selected">All</button>
        <button class="button in-bar watching">Watching</button>
        <button class="button in-bar watched">Watched</button>
        <button class="button in-bar paused">Paused</button>
        <button class="button in-bar cancelled">Cancelled</button>
        <button class="button in-bar queued">Queued</button>
    </div>
    <div class="row mt-5">

        <c:if test="${animes.size() == 0}">
            <div id="empty-list">
                No animes... yet :3
            </div>
        </c:if>

        <c:forEach var="item" items="${animes}">
            <div class="row align-items-center w-100">
                <div class="col-sm-auto">
                <span class="cover-picture"
                      style="background-image: url(${item.anime.coverPicture})"></span>
                </div>
                <div class="ml-2 col-sm">
                    <h3><i class="dot ${item.watchState.toString()}"></i> ${item.anime.canonicalTitle}</h3>
                    <div class="row mt-3">
                        <div class="col-2"><img alt="Rating" class="icon"
                                                src="${pageContext.request.contextPath}/icon/star.svg"> ${item.score}/10.0
                        </div>
                        <div class="col-3"><img alt="Watched" class="icon"
                                                src="${pageContext.request.contextPath}/icon/calendar.svg"> ${formatter.formatDate(item.watchDate)}
                        </div>
                        <div class="col-3"><img alt="Episodes" class="icon"
                                                src="${pageContext.request.contextPath}/icon/tv.svg"> ${item.anime.episodeCount}
                            episodes
                        </div>
                        <div class="col-auto"><img alt="Studio" class="icon"
                                                   src="${pageContext.request.contextPath}/icon/video.svg"> ${item.anime.animeStudio}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

<script>
    (function () {
        var buttons = [];
        $(".button.in-bar").each(function () {
            buttons.push($(this));
        });
        for (const button of buttons) {
            button.click(function () {
                for (const otherButton of buttons) {
                    otherButton.removeClass("selected");
                }
                button.addClass("selected");
            });
        }
    })();
</script>

</html>