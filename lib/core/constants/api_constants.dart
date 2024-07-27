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
    "/characters?page%5Blimit%5D=6&page%5Boffset%5D=1&sort=role";
