package hr.fer.pipp.sza.webapp.kontroleri;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.server.mvc.Viewable;

@Path("/prijava")
public class PrijavaKontroler {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response prikaziPrijava() throws ServletException, IOException {
		return Response.ok(new Viewable("/prijava")).build();
	}

}