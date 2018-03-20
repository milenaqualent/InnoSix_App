using InnosixWebApp.Models;

namespace InnosixWebApp.Helpers
{
    public interface ITechCompanyService
    {
        TCBasicInfo GetTc(long id);
        TCBasicInfo GetTcWithChildren(long id);
        TCBusinessInfo GetTcBusinessInfo(long id);
        TCBasicInfo GetTcTechnology(long id);
        TCIdealPartner GetTcIdealPartner(long id);
        TCContact GetTcContact(long id);
        TCRating GetTcRating(long id);
        void UpdateTcBasicInfo(TCBasicInfo tcBasicInfo);
        void UpdateTcBusinessInfo(TCBusinessInfo tcBusinessInfo);
        void UpdateTcTechnology(TCTechnology tcTechnology, int[] tagIds, int[] techDomainIds);
        void UpdateTcIdealPartner(TCIdealPartner tcIdealPartner);
        void UpdateTcContact(TCContact tcContact);
        void UpdateTcRating(TCRating tcRating);
    }
}