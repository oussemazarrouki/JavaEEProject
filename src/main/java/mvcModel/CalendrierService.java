package mvcModel;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import entities.Calendrier;
import java.util.ArrayList;
import java.util.List;

/**
 * Session Bean implementation class CalendrierService
 */
@Stateless
@LocalBean
public class CalendrierService {

	@PersistenceContext(unitName = "FlexGym")
    private EntityManager em;

    /**
     * Default constructor.
     */
    public CalendrierService() {
        // TODO Auto-generated constructor stub
    }

    public List<Calendrier> getAllCalendriers() {
        List<Calendrier> calendriers = new ArrayList<>();
        TypedQuery<Calendrier> query = em.createNamedQuery("Calendrier.findAll", Calendrier.class);
        calendriers = query.getResultList();
        return calendriers;
    }

    public List<Calendrier> deleteCalendrierById(int activiteId) {
        List<Calendrier> calendriers = new ArrayList<>();
        Calendrier calendrier = em.find(Calendrier.class, activiteId);
        if (calendrier != null) {
            em.remove(calendrier);
        }
        TypedQuery<Calendrier> query = em.createNamedQuery("Calendrier.findAll", Calendrier.class);
        calendriers = query.getResultList();
        return calendriers;
    }

    public Calendrier getCalendrierById(int activiteId) {
        return em.find(Calendrier.class, activiteId);
    }

    public Calendrier modifyCalendrier(Calendrier calendrier) {
        Calendrier existingCalendrier = em.find(Calendrier.class, calendrier.getActiviteId());
        if (existingCalendrier != null) {
            existingCalendrier.setActiviteJour(calendrier.getActiviteJour());
            existingCalendrier.setActiviteTemps(calendrier.getActiviteTemps());
            // Update other attributes as needed
            em.persist(existingCalendrier);
        }
        return existingCalendrier;
    }

    public Calendrier addCalendrier(Calendrier calendrier) {
        em.persist(calendrier);
        return calendrier;
    }

}
