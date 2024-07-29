const baseAnimeListUrl = 'https://kitsu.io/api/edge/anime?page%5Bnumber%5D=';
const baseAnimeUrl = 'https://kitsu.io/api/edge/anime/';
const baseMangaListUrl = 'https://kitsu.io/api/edge/manga?page%5Bnumber%5D=';
const baseMangaUrl = 'https://kitsu.io/api/edge/manga/';
const baseEpisodeUrl = 'https://kitsu.io/api/edge/episodes/';
const popular = "&sort=popularityRank";
const topRated = "&sort=ratingRank";
const latest = "&sort=-createdAt";
const characterById = "https://kitsu.io/api/edge/media-characters/";
const afterCharacterId = "/character";
const characterByAnimeId = "https://kitsu.io/api/edge/anime/";
const afterCharacterByAnimeId =
    "/characters?page%5Blimit%5D=6&page%5Boffset%5D=0&sort=role";

const reviewerByReviewId = "https://kitsu.io/api/edge/reviews/";
const afterReviewerId = "/user";
const reviewByAnimeId = "https://kitsu.io/api/edge/anime/";
const afterReviewByAnimeId =
    "/reviews?page%5Blimit%5D=10&page%5Boffset%5D=0&sort=-likesCount";
const categoryByAnimeId = "https://kitsu.io/api/edge/anime/";
const afterCategoryAnimeId =
    "/categories?page%5Blimit%5D=20&page%5Boffset%5D=0";
const categoryById = "https://kitsu.io/api/edge/categories/";
const episodeByAnimeId = "https://kitsu.io/api/edge/anime/";
const afterEpisodeByAnimeId = "/episodes?page%5Blimit%5D=10&page%5Boffset%5D=0";
const episodeById = "https://kitsu.io/api/edge/episodes/";
