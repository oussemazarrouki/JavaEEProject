package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import entities.Abonnement;
import java.util.ArrayList;
import java.util.List;

/**
 * Session Bean implementation class AbonnementService
 */
@Stateless
@LocalBean
public class AbonnementService {

	@PersistenceContext(unitName = "FlexGym")
    private EntityManager em;

    /**
     * Default constructor.
     */
    public AbonnementService() {
        // TODO Auto-generated constructor stub
    }
    
//    public int getAbonnementIdByClientId(int clientId) {
//        Query query = em.createQuery("SELECT a.abonnementId FROM Abonnement a WHERE a.abonnementProp = :clientId");
//        query.setParameter("clientId", clientId);
//        List<Integer> result = query.getResultList();
//        if (!result.isEmpty()) {
//            return result.get(0);
//        } else {
//            return -1; 
//        }
//    }
    
    public List<Abonnement> getAbonnementsByClientId(int clientId) {
        TypedQuery<Abonnement> query = em.createQuery("SELECT a FROM Abonnement a WHERE a.abonnementProp = :clientId", Abonnement.class);
        query.setParameter("clientId", clientId);
        return query.getResultList();
    }
    
    public List<Abonnement> getAllAbonnements() {
        List<Abonnement> abonnements = new ArrayList<>();
        TypedQuery<Abonnement> query = em.createNamedQuery("Abonnement.findAll", Abonnement.class);
        abonnements = query.getResultList();
        return abonnements;
    }

    public List<Abonnement> deleteAbonnementById(int abonnementId) {
        List<Abonnement> abonnements = new ArrayList<>();
        Abonnement abonnement = em.find(Abonnement.class, abonnementId);
        if (abonnement != null) {
            em.remove(abonnement);
        }
        TypedQuery<Abonnement> query = em.createNamedQuery("Abonnement.findAll", Abonnement.class);
        abonnements = query.getResultList();
        return abonnements;
    }

    public Abonnement getAbonnementById(int abonnementId) {
        return em.find(Abonnement.class, abonnementId);
    }

    public Abonnement modifyAbonnement(Abonnement abonnement) {
        Abonnement existingAbonnement = em.find(Abonnement.class, abonnement.getAbonnementId());
        if (existingAbonnement != null) {
            existingAbonnement.setAbonnementEtat(abonnement.getAbonnementEtat());
            existingAbonnement.setDebutDate(abonnement.getDebutDate());
            existingAbonnement.setFinDate(abonnement.getFinDate());
            existingAbonnement.setAbonnementProp(abonnement.getAbonnementProp());
            existingAbonnement.setOffre(abonnement.getOffre());


            em.persist(existingAbonnement);
        }
        return existingAbonnement;
    }

    public Abonnement addAbonnement(Abonnement abonnement) {
        em.persist(abonnement);
        return abonnement;
    }

}
