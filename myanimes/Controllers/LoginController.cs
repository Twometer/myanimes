﻿using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using myanimes.Database;
using myanimes.Models.Request;
using myanimes.Models.Response;
using myanimes.Services;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace myanimes.Controllers
{
    [Route("~/login/{action=Index}")]
    public class LoginController : Controller
    {
        private readonly DatabaseContext database;

        private readonly CryptoService crypto;

        public LoginController(DatabaseContext database, CryptoService crypto)
        {
            this.database = database;
            this.crypto = crypto;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ActionName("Index")]
        public async Task<ActionResult<LoginResponseModel>> IndexPost([FromBody] LoginRequestModel request)
        {
            var user = await database.Users.SingleOrDefaultAsync(u => u.Name == request.Username);

            if (user == default || !crypto.HashMatches(request.Password, user.PasswordHash, user.PasswordSalt))
            {
                return BadRequest(new LoginResponseModel("Invalid username or password"));
            }

            var claims = new List<Claim> { new Claim(ClaimTypes.Name, user.Name) };
            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

            return new LoginResponseModel("ok");
        }

    }
}