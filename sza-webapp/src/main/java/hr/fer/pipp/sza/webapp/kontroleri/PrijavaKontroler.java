package hr.fer.pipp.sza.webapp.kontroleri;

import java.io.IOException;
import java.net.URI;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import org.glassfish.jersey.server.mvc.Viewable;

import hr.fer.pipp.sza.webapp.modeli.Korisnik;
import hr.fer.pipp.sza.webapp.utils.PasswordHash;
import hr.fer.pipp.sza.webapp.utils.Util;

@Path("/prijava")
public class PrijavaKontroler {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziPrijava() throws ServletException, IOException {
		return Response.ok(new Viewable("/prijava")).build();
	}
	
	@POST
	@Produces(MediaType.TEXT_HTML)
	public Response noviKorisnik(@Context HttpServletRequest request, @Context UriInfo uri,
			@FormParam("korisnickoime") String korisnickoIme,
			@FormParam("lozinka") String lozinka)
			 {

		Map<String, String> greska = Util.provjeriFormuPrijavljivanja(korisnickoIme, lozinka);

		if (greska.isEmpty()) {
			Korisnik korisnik = new Korisnik();
			korisnik.setKorisnickoIme(korisnickoIme);
			korisnik.setAktivan(true);
			try {
				korisnik.setLozinka(PasswordHash.createHash(lozinka));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException ignorable) {
			}
			// TODO
			// dodati korisnika u bazu
			request.getSession().setAttribute("user", korisnik);
			return Response.seeOther(URI.create(uri.getBaseUri().toString())).build();
		} else {
			Map<String, String> forma = new HashMap<>();
			forma.put("korisnickoime", korisnickoIme);
			request.setAttribute("forma", forma);
			request.setAttribute("greska", greska);
			return Response.ok(new Viewable("/prijava")).build();
		}
	}

}
