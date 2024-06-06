package mvcController;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvcModel.AbonnementService;
import mvcModel.ClientService;
import mvcModel.CourService;
import mvcModel.OffreService;
import mvcModel.PersonnelService;
import java.text.ParseException;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import entities.Abonnement;
import entities.Client;
import entities.Cour;
import entities.Offre;
import entities.Personnel;


/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private OffreService serviceOffre;

    @EJB
    private CourService courService;
    
    @EJB
    private ClientService clientService;
    
    @EJB
    private PersonnelService personnelService;
    
    @EJB
    private AbonnementService abonnementService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//   	Auto routing home
//    	String pathInfo = request.getPathInfo();
//	
//        if (pathInfo == null || pathInfo.isEmpty() || "/".equals(pathInfo)) {
//            request.getRequestDispatcher("/home.jsp").forward(request, response);
//        } else {
//            response.sendError(HttpServletResponse.SC_NOT_FOUND);
//        }
//    	
    	
    
//        List<Offre> offres = serviceOffre.getAllOffres();
//        List<Cour> cours = courService.getAllCours();
//        List<Client> clients = clientService.getAllClients();
//        List<Abonnement> abonnements = abonnementService.getAllAbonnements();
//
//        request.setAttribute("offres", offres);
//        request.setAttribute("cours", cours);
//        request.setAttribute("clients",clients);
//        request.setAttribute("abonnements",abonnements);
//        
//        
//        request.getRequestDispatcher("index.jsp").forward(request, response);
//        request.getRequestDispatcher("abonnement.jsp").forward(request, response);
//        request.getRequestDispatcher("client.jsp").forward(request, response);

    	List<Offre> offres = serviceOffre.getAllOffres();
        List<Cour> cours = courService.getAllCours();
    	request.setAttribute("offres", offres);
        request.getRequestDispatcher("offreClient.jsp").forward(request, response);
    
        request.setAttribute("cours", cours);
        request.getRequestDispatcher("coursClient.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createOffre(request, response);
                    break;
                case "update":
                    updateOffre(request, response);
                    break;
                case "delete":
                    deleteOffre(request, response);
                    break;
                case "createClient":
                    createClient(request, response);
                    break;
                case "updateClient":
                    updateClient(request, response);
                    break;
                case "deleteClient":
                    deleteClient(request, response);
                    break;
                case "createAbonnement":
                    createAbonnement(request, response);
                    break;
                case "updateAbonnement":
                    updateAbonnement(request, response);
                    break;
                case "deleteAbonnement":
                    deleteAbonnement(request, response);
                    break;
                case "createCours":
                    createCour(request, response);
                    break;
                case "updateCours":
                    updateCour(request, response);
                    break;
                case "deleteCours":
                    deleteCour(request, response);
                    break;
                case "login":
                	System.out.println("login case");
                	login(request, response);
                	break;
                case "courPage":
                	System.out.println("courPage case");
                	courPage(request,response);
                	System.out.println("method done");
                    break;
                case "offrePage":
                	System.out.println("offrePage case");
                	offrePage(request,response);
                	System.out.println("method done");
                	break;
                case "adminCour":
                	adminCour(request,response);
                	break;
                case "adminAbonnement":
                	adminAbonnement(request,response);
                	break;
                case "adminClient":
                	adminClient(request,response);
                	break;
                case "adminOffre":
                	adminOffre(request,response);
                	break;
                	
                default:
                    response.sendRedirect(request.getContextPath() + "/Controller");
            }
        } else {
            System.out.println("Action null");      }
    }
    
    private void courPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	System.out.println("in method");
    	List<Cour> cours = courService.getAllCours();
    	System.out.println("get all cours");
        request.setAttribute("cours", cours);
        System.out.println("set attribute");
        request.getRequestDispatcher("coursClient.jsp").forward(request, response);
        System.out.println("dispatcher");
    }
    
    private void offrePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	List<Offre> offres = serviceOffre.getAllOffres();
    	request.setAttribute("offres", offres);
        request.getRequestDispatcher("offreClient.jsp").forward(request, response);
    }
    
    private void adminCour(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	List<Cour> cours = courService.getAllCours();
    	request.setAttribute("cours", cours);
        request.getRequestDispatcher("cour.jsp").forward(request, response);
    }
    
    private void adminAbonnement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	List<Abonnement> abonnements = abonnementService.getAllAbonnements();
    	request.setAttribute("abonnements", abonnements);
//    	List<Client> clients = clientService.getAllClients();
//        request.setAttribute("clients", clients);
    	List<Offre> offres = serviceOffre.getAllOffres();
    	request.setAttribute("offres", offres);
        request.getRequestDispatcher("abonnement.jsp").forward(request, response);
    }
    private void adminOffre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	List<Offre> offres = serviceOffre.getAllOffres();
    	List<Cour> cours = courService.getAllCours();
        request.setAttribute("cours", cours);
    	request.setAttribute("offres", offres);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    private void adminClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	List<Client> clients = clientService.getAllClients();
    	request.setAttribute("clients", clients);
        request.getRequestDispatcher("client.jsp").forward(request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	System.out.println("login method");
    	String clientEmail = request.getParameter("email");
        String clientPassword = request.getParameter("password");
        
        Client client = clientService.getClientByLoginAndPassword(clientEmail, clientPassword);
        Personnel personnel = personnelService.getPersonnelByLoginAndPassword(clientEmail, clientPassword);

        if (client != null && personnel == null) {
            // Client login successful
        	System.out.println("Client");
            HttpSession session = request.getSession();
            session.setAttribute("activeUser", client);
            session.setMaxInactiveInterval(5 * 60); 
            request.setAttribute("clientEmail", clientEmail);
            request.setAttribute("clientPassword", clientPassword);
            getClientInformation(request, response);
            request.getRequestDispatcher("clientDashboard.jsp").forward(request, response);
            System.out.println("Get client success");            
        }
        else if (client == null && personnel != null) {
        	System.out.println("Personnel");
        	HttpSession session = request.getSession();
            session.setAttribute("activeUser", personnel);
            session.setMaxInactiveInterval(5 * 60); 
            List<Offre> offres = serviceOffre.getAllOffres();
            List<Cour> cours = courService.getAllCours();
            request.setAttribute("offres", offres);
            request.setAttribute("cours", cours);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else {
        	System.out.println("Invalid");
	        request.setAttribute("errorMessage", "Invalid login credentials");
	        request.getRequestDispatcher("login.jsp").forward(request, response); 
	        
        }
    }
    
    private void getClientInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Get method  success");            

    	String clientEmail = (String) request.getAttribute("clientEmail");
        String clientPassword = (String) request.getAttribute("clientPassword");

        Client client = clientService.getClientByLoginAndPassword(clientEmail, clientPassword);
        List<Abonnement> abonnements = abonnementService.getAbonnementsByClientId(client.getClientId());
        
        

        if (client != null) {
        	request.setAttribute("clientNom", client.getClientNom());
            request.setAttribute("clientPrenom", client.getClientPrenom());
            request.setAttribute("clientEmail", client.getClientEmail());
            request.setAttribute("clientPass", client.getClientPass());
            request.setAttribute("clientTel", client.getClientTel());
            request.setAttribute("clientDatenais", client.getClientDatenais());
            request.setAttribute("abonnements", abonnements);
            request.getRequestDispatcher("clientDashboard.jsp").forward(request, response);
            
        } else {
            request.setAttribute("errorMessage", "Client not found with provided credentials");
            request.getRequestDispatcher("clientDashboard.jsp").forward(request, response);
        }
    }
    private void createOffre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("offreNom");
        String detail = request.getParameter("offreDetail");
        Float prix = Float.parseFloat(request.getParameter("offrePrix"));
        int courId = Integer.parseInt(request.getParameter("offreCour"));

        Cour cour = courService.getCourById(courId);

        Offre offre = new Offre();
        offre.setOffreNom(nom);
        offre.setOffreDetail(detail);
        offre.setOffrePrix(prix);
        offre.setCour(cour);

        serviceOffre.createOffre(offre);
        List<Offre> offres = serviceOffre.getAllOffres();
        List<Cour> cours = courService.getAllCours();
        request.setAttribute("offres", offres);
        request.setAttribute("cours", cours);
        request.getRequestDispatcher("index.jsp").forward(request, response);

        
    }

    private void updateOffre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int offreId = Integer.parseInt(request.getParameter("offreId"));
        String nom = request.getParameter("offreNom");
        String detail = request.getParameter("offreDetail");
        float prix = Float.parseFloat(request.getParameter("offrePrix"));
        int courId = Integer.parseInt(request.getParameter("offreCour"));

        Cour cour = courService.getCourById(courId);

        Offre offre = serviceOffre.getOffreById(offreId);
        offre.setOffreNom(nom);
        offre.setOffreDetail(detail);
        offre.setOffrePrix(prix);
        offre.setCour(cour);


        serviceOffre.updateOffre(offre);
        System.out.println("Offre updated");

        List<Offre> offres = serviceOffre.getAllOffres();
        List<Cour> cours = courService.getAllCours();
        request.setAttribute("offres", offres);
        request.setAttribute("cours", cours);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    private void deleteOffre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int offreId = Integer.parseInt(request.getParameter("offreId"));

        serviceOffre.deleteOffre(offreId);
        List<Offre> offres = serviceOffre.getAllOffres();
        List<Cour> cours = courService.getAllCours();
        request.setAttribute("offres", offres);
        request.setAttribute("cours", cours);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

private void createClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String nom = request.getParameter("clientNom");
    String prenom = request.getParameter("clientPrenom");
    String email = request.getParameter("clientEmail");
    int telephone = Integer.parseInt(request.getParameter("clientTel"));
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    

    Client client = new Client();
    client.setClientNom(nom);
    client.setClientPrenom(prenom);
    client.setClientEmail(email);
    client.setClientTel(telephone);
    Date dateNaissance; 
    try {
    	dateNaissance = dateFormat.parse(request.getParameter("clientDatenais"));
    	client.setClientDatenais(dateNaissance);
    } catch (ParseException e) {
        e.printStackTrace();
    }

    clientService.addClient(client);
    
    List<Client> clients = clientService.getAllClients();
	request.setAttribute("clients", clients);
    request.getRequestDispatcher("client.jsp").forward(request, response);
    response.sendRedirect(request.getContextPath() + "/client.jsp");
}
private void updateClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String clientIdStr = request.getParameter("clientId");
    int clientId = Integer.parseInt(clientIdStr);

    String nom = request.getParameter("clientNom");
    String prenom = request.getParameter("clientPrenom");
    String email = request.getParameter("clientEmail");
    int telephone = Integer.parseInt(request.getParameter("clientTel"));
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");



    Client client = clientService.getClientById(clientId);
    client.setClientNom(nom);
    client.setClientPrenom(prenom);
    client.setClientEmail(email);
    client.setClientTel(telephone);
    Date dateNaissance; 
    try {
    	dateNaissance = dateFormat.parse(request.getParameter("clientDatenais"));
    	client.setClientDatenais(dateNaissance);
    } catch (ParseException e) {
        e.printStackTrace();
    }


    clientService.modifyClient(client);
    
    List<Client> clients = clientService.getAllClients();
	request.setAttribute("clients", clients);
    request.getRequestDispatcher("client.jsp").forward(request, response);
    response.sendRedirect(request.getContextPath() + "/client.jsp");
}
private void deleteClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int clientId = Integer.parseInt(request.getParameter("clientId"));

    clientService.deleteClientById(clientId);
    
    List<Client> clients = clientService.getAllClients();
	request.setAttribute("clients", clients);
    request.getRequestDispatcher("client.jsp").forward(request, response);
    response.sendRedirect(request.getContextPath() + "/client.jsp");
}

private void createAbonnement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String abonnementEtat = request.getParameter("abonnementEtat");
    Byte etat=0;
    if(abonnementEtat=="Active") {
    	etat=1;
    }else if(abonnementEtat=="Expired") {
    	etat=0;
    }
    int abonnementProp = Integer.parseInt(request.getParameter("abonnementProp"));
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    int offreId = Integer.parseInt(request.getParameter("abonnementType"));

    Offre offre = serviceOffre.getOffreById(offreId);

    Abonnement abonnement = new Abonnement();
    abonnement.setAbonnementEtat(etat);
    abonnement.setAbonnementProp(abonnementProp);
    abonnement.setOffre(offre);
    Date debutDate; 
    try {
    	debutDate = dateFormat.parse(request.getParameter("debutDate"));
    	abonnement.setDebutDate(debutDate);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    Date finDate; 
    try {
    	finDate = dateFormat.parse(request.getParameter("finDate"));
    	abonnement.setFinDate(finDate);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    
    abonnementService.addAbonnement(abonnement);

    List<Abonnement> abonnements = abonnementService.getAllAbonnements();
	request.setAttribute("abonnements", abonnements);
//	List<Client> clients = clientService.getAllClients();
//    request.setAttribute("clients", clients);
	List<Offre> offres = serviceOffre.getAllOffres();
	request.setAttribute("offres", offres);

    request.getRequestDispatcher("abonnement.jsp").forward(request, response);
}
private void updateAbonnement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    int abonnementId = Integer.parseInt(request.getParameter("abonnementId"));
    System.out.println("Id:"+abonnementId);

    String abonnementEtat = request.getParameter("abonnementEtat");
    System.out.println("Etat:"+abonnementEtat);

    Byte etat=0;
    if(abonnementEtat.equals("Active")) {
    	etat=1;
    }else if(abonnementEtat.equals("Expired")) {
    	etat=0;
    }
    System.out.println("Avant abonnement");
    int abonnementProp = Integer.parseInt(request.getParameter("abonnementProp"));
    System.out.println("abonnemet prop: "+abonnementProp);
    int offreId = Integer.parseInt(request.getParameter("abonnementType"));
    System.out.println("offre id:"+offreId);
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    

    Offre offre = serviceOffre.getOffreById(offreId);
    System.out.println("Offre : "+offre.getOffreNom());

    Abonnement abonnement = abonnementService.getAbonnementById(abonnementId);
    
    Date debutDate; 
    try {
    	debutDate = dateFormat.parse(request.getParameter("debutDate"));
        System.out.println("get debut date ");
    	abonnement.setDebutDate(debutDate);
    	System.out.println("set debut date ");
    } catch (ParseException e) {
        e.printStackTrace();
    }
    Date finDate; 
    try {
    	finDate = dateFormat.parse(request.getParameter("finDate"));
    	System.out.println("get debut date ");
    	abonnement.setFinDate(finDate);
    	System.out.println("set debut date ");
    } catch (ParseException e) {
        e.printStackTrace();
    }
    System.out.println("Set abonnement ");
    abonnement.setAbonnementEtat(etat);
    System.out.println("set etat ");
    abonnement.setAbonnementProp(abonnementProp);
    System.out.println("set prop ");
    abonnement.setOffre(offre);
    System.out.println("set offre ");
    abonnementService.modifyAbonnement(abonnement);
    System.out.println("Modifier");
    List<Abonnement> abonnements = abonnementService.getAllAbonnements();
	request.setAttribute("abonnements", abonnements);
	List<Offre> offres = serviceOffre.getAllOffres();
	request.setAttribute("offres", offres);

    request.getRequestDispatcher("abonnement.jsp").forward(request, response);
}
private void deleteAbonnement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int abonnementId = Integer.parseInt(request.getParameter("abonnementId"));

    abonnementService.deleteAbonnementById(abonnementId);
    
    List<Abonnement> abonnements = abonnementService.getAllAbonnements();
	request.setAttribute("abonnements", abonnements);
//	List<Client> clients = clientService.getAllClients();
//    request.setAttribute("clients", clients);
	List<Offre> offres = serviceOffre.getAllOffres();
	request.setAttribute("offres", offres);
    request.getRequestDispatcher("abonnement.jsp").forward(request, response);
}
private void createCour(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String courNom = request.getParameter("courNom");
    String courDetail = request.getParameter("courDetail");
    
    // You may need to adjust this logic based on your specific requirements
    Cour cour = new Cour();
    cour.setCourNom(courNom);
    cour.setCourDetail(courDetail);
    cour.setPersonnel(null);

    courService.addCour(cour);
    
    List<Cour> cours = courService.getAllCours();
	request.setAttribute("cours", cours);
    request.getRequestDispatcher("cour.jsp").forward(request, response);
}
private void updateCour(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int courId = Integer.parseInt(request.getParameter("coursId"));

    String courNom = request.getParameter("courNom");
    String courDetail = request.getParameter("courDetail");

    // Fetch the existing cour object from the database
    Cour cour = courService.getCourById(courId);
    if (cour != null) {
        // Update the attributes of the existing cour
        cour.setCourNom(courNom);
        cour.setCourDetail(courDetail);
        cour.setPersonnel(null);

        // Modify the cour in the database
        courService.modifyCour(cour);
    }
    
    List<Cour> cours = courService.getAllCours();
	request.setAttribute("cours", cours);
    request.getRequestDispatcher("cour.jsp").forward(request, response);
}
private void deleteCour(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int courId = Integer.parseInt(request.getParameter("courId"));
    
    courService.deleteCourById(courId);
    
    List<Cour> cours = courService.getAllCours();
	request.setAttribute("cours", cours);
    request.getRequestDispatcher("cour.jsp").forward(request, response);
}
}


//int offreId = Integer.parseInt(request.getParameter("offreId"));
//serviceOffre.deleteOffreById(offreId);
//response.sendRedirect(request.getContextPath() + "/Controller");
