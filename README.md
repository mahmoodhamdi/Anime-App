# Anime-Manga Hub

Welcome to Anime-Manga Hub, an application designed to provide detailed information about various anime and manga series. This project follows the Clean Architecture principles and SOLID design principles.

## Features

- [x] **Anime**: Fetch and display details of anime, including latest, popular, and top-rated anime.
- [x] **Manga**: Fetch and display details of manga, including latest, popular, and top-rated manga.
- [x] **Categories**: Browse anime and manga categories.
- [x] **Characters**: Fetch details of characters and list characters associated with specific anime.
- [x] **Episodes**: Fetch details of episodes for a given anime.
- [x] **Reviews**: Read reviews and fetch reviewer details.

---

### Project Structure

The project is structured based on Clean Architecture principles, ensuring separation of concerns and facilitating maintainability and testability. The structure is divided into three main layers:

1. ***Domain Layer***: Contains entities, repositories, and use cases.
2. ***Data Layer***: Implements repositories, data sources, and models.
3. ***Presentation Layer***: To be implemented in the future.

---

### Current Implementations

#### Anime Feature

***Domain Layer***

- `AnimeEntity`
- `AnimeRepository`
- `GetAnimeDetailsUsecase`
- `GetLatestAnimeUsecase`
- `GetPopularAnimeUsecase` 
- `GetTopRatedAnimeUsecase`

***Data Layer***

- `AnimeModel`
- `AnimeRemoteDataSource`
- `AnimeRepositoryImpl`

---

#### Manga Feature

***Domain Layer***

- `MangaEntity`
- `MangaRepository`
- `GetMangaDetailsUsecase`
- `GetLatestMangaUsecase`
- `GetPopularMangaUsecase`
- `GetTopRatedMangaUsecase`

***Data Layer***

- `MangaModel`
- `MangaRemoteDataSource`
- `MangaRepositoryImpl`

---

#### Categories Feature

****Domain Layer****

- `CategoryEntity`
- `CategoryRepository`
- `GetCategoriesListUsecase`
- `GetCategoryByIdUsecase`

****Data Layer****

- `CategoryModel`
- `CategoryRemoteDataSource`
- `CategoryRepositoryImpl`

---

#### Characters Feature

***Domain Layer***

- `CharacterEntity`
- `CharacterRepository`
- `GetCharacterByIdUsecase`
- `GetCharactersListUsecase`
- `GetMediaCharactersListUsecase`

***Data Layer***

- `CharacterModel`
- `CharacterRemoteDataSource`
- `CharacterRepositoryImpl`

---

#### Episodes Feature

***Domain Layer***

- `EpisodeEntity`
- `EpisodeRepository`
- `GetEpisodeByIdUsecase`
- `GetEpisodesListUsecase`

***Data Layer***

- `EpisodeModel`
- `EpisodeRemoteDataSource`
- `EpisodeRepositoryImpl`

---

#### Reviews Feature

***Domain Layer***

- `ReviewEntity`
- `ReviewerEntity`
- `ReviewRepository`
- `GetReviewerByIdUsecase`
- `GetReviewersListUsecase`
- `GetReviewsListUsecase`

***Data Layer***

- `ReviewModel`
- `ReviewerModel`
- `ReviewRemoteDataSource`
- `ReviewRepositoryImpl`

---

### Setup and Installation

1. Clone the repository:
    ```
   git clone https://github.com/mahmoodhamdi/Anime-App.git
   ```
2. Navigate to the project directory:
   ```sh
   cd Anime-App
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

---

### Future Work

- Implement the presentation layer using BLoC architecture.
- Enhance UI/UX for a better user experience.
- Add more features and functionalities.

---

### Contributing

We welcome contributions! Please follow the steps below to contribute:

1. Fork the repository.
2. Create a new branch `git checkout -b feature/new-feature`
3. Commit your changes `git commit -m 'Add some feature'`
4. Push to the branch `git push origin feature/new-feature`
5. Create a new Pull Request.

---

### Contact

For any inquiries or support, please contact [Mahmoud Hamdy](https://www.linkedin.com/in/mahmoud-hamdy-alashwah/).

Happy Coding! 🚀
