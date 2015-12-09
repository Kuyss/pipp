package hr.fer.pipp.sza.webapp.kontroleri;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.server.mvc.Viewable;

@Path("/registracija")
public class RegistracijaKontroler {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziRegistracija() throws ServletException, IOException {
		return Response.ok(new Viewable("/registracija")).build();
	}

}
