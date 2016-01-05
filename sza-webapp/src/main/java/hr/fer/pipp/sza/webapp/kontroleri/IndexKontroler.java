package hr.fer.pipp.sza.webapp.kontroleri;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.server.mvc.Viewable;

import hr.fer.pipp.sza.webapp.dao.DAOAnketa;
import hr.fer.pipp.sza.webapp.modeli.Anketa;

@Path("/")
public class IndexKontroler {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziIndex(@Context HttpServletRequest req) throws ServletException, IOException {
		return Response.ok(new Viewable("/index")).build();
	}

	@GET
	@Path("ankete")
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziAnkete(@Context HttpServletRequest req) throws ServletException, IOException {
		List<Anketa> ankete;
		if (req.getSession().getAttribute("korisnik") == null) {
			ankete = DAOAnketa.getDAO().dohvatiAnkete(false); // nije logiran
		} else {
			ankete = DAOAnketa.getDAO().dohvatiAnkete(true); // logiran
		}
		req.setAttribute("ankete", ankete);
		return Response.ok(new Viewable("/ankete")).build();
	}

	@GET
	@Path("anketari")
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziAnketare(@Context HttpServletRequest req) throws ServletException, IOException {
		// TODO
		// Dodati popis anketara iz baze
		return Response.ok(new Viewable("/anketari")).build();
	}

	@GET
	@Path("korisnici")
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziKorisnike(@Context HttpServletRequest req) throws ServletException, IOException {
		// TODO
		// Dodati popis narucitelja iz baze
		return Response.ok(new Viewable("/korisnici")).build();
	}

}
