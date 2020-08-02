package tk.myanimes.model;

public class UserInfo {

    private String name;

    private String location;

    private String biography;

    private String profilePicture;

    private AnimeInfo favoriteAnime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public AnimeInfo getFavoriteAnime() {
        return favoriteAnime;
    }

    public void setFavoriteAnime(AnimeInfo favoriteAnime) {
        this.favoriteAnime = favoriteAnime;
    }
}