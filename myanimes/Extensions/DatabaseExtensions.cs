﻿using myanimes.Database.Entities.Animes;
using System.Threading.Tasks;

namespace myanimes.Database
{
    public static class DatabaseExtensions
    {
        public static async Task<AnimeDbo> ToAnimeDbo(this Anime anime, DatabaseContext ctx)
        {
            return null; // TODO
        }

        public static async Task<Anime> ToAnime(this AnimeDbo animeDbo, DatabaseContext ctx)
        {
            return null; // TODO
        }
    }
}