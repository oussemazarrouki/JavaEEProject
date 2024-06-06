package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import java.util.ArrayList;
import java.util.List;

import entities.Client;
import entities.Personnel;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

/**
 * Session Bean implementation class PersonnelService
 */
@Stateless
@LocalBean
public class PersonnelService {

	@PersistenceContext(unitName = "FlexGym")
    private EntityManager em;

    /**
     * Default constructor.
     */
    public PersonnelService() {
        // TODO Auto-generated constructor stub
    }

    public List<Personnel> getAllPersonnel() {
        List<Personnel> personnelList = new ArrayList<>();
        TypedQuery<Personnel> query = em.createNamedQuery("Personnel.findAll", Personnel.class);
        personnelList = query.getResultList();
        return personnelList;
    }
    
    public Personnel getPersonnelByLoginAndPassword(String personnelEmail, String personnelPassword) {
        try {
            TypedQuery<Personnel> query = em.createQuery("SELECT p FROM Personnel p WHERE p.personnelEmail = :email AND p.personnelPass = :password", Personnel.class);
            query.setParameter("email", personnelEmail);
            query.setParameter("password", personnelPassword);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Personnel> deletePersonnelById(int personnelId) {
        List<Personnel> personnelList = new ArrayList<>();
        Personnel personnel = em.find(Personnel.class, personnelId);
        if (personnel != null) {
            em.remove(personnel);
        }
        TypedQuery<Personnel> query = em.createNamedQuery("Personnel.findAll", Personnel.class);
        personnelList = query.getResultList();
        return personnelList;
    }

    public Personnel getPersonnelById(int personnelId) {
        return em.find(Personnel.class, personnelId);
    }

    public Personnel modifyPersonnel(Personnel personnel) {
        Personnel existingPersonnel = em.find(Personnel.class, personnel.getPersonnelId());
        if (existingPersonnel != null) {
            existingPersonnel.setPersonnelNom(personnel.getPersonnelNom());
            existingPersonnel.setPersonnelPrenom(personnel.getPersonnelPrenom());
            existingPersonnel.setPersonnelEmail(personnel.getPersonnelEmail());
            existingPersonnel.setPersonnelPass(personnel.getPersonnelPass());
            existingPersonnel.setPersonnelRole(personnel.getPersonnelRole());
            // Update other attributes as needed
            em.persist(existingPersonnel);
        }
        return existingPersonnel;
    }

    public Personnel addPersonnel(Personnel personnel) {
        em.persist(personnel);
        return personnel;
    }

}
