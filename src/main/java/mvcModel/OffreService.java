package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import java.util.List;



import entities.Offre;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

/**
 * Session Bean implementation class OffreService
 */
@Stateless
@LocalBean
public class OffreService {

	@PersistenceContext(unitName = "FlexGym")
    private EntityManager em;

    public OffreService() {
        // Constructor logic, if any
    }

    public List<Offre> getAllOffres() {
        TypedQuery<Offre> query = em.createNamedQuery("Offre.findAll", Offre.class);
        return query.getResultList();
    }

    public List<Offre> deleteOffre(int id) {
        Offre offre = em.find(Offre.class, id);
        em.remove(offre);
        List<Offre> offres = getAllOffres();
        return offres;
    }

    public Offre getOffreById(int offreId) {
        return em.find(Offre.class, offreId);
    }

    public void updateOffre(Offre offre) {
        em.merge(offre);
    }

    @Transactional
    public Offre addOffre(Offre offre) {
        em.persist(offre);
        return offre;
    }
    
    public void createOffre(Offre offre) {
        em.persist(offre);
    }

}
