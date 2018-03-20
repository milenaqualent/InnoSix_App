using InnosixWebApp;
using Microsoft.Owin;

[assembly: OwinStartup(typeof(Startup))]

namespace InnosixWebApp
{
    using Autofac;
    using Autofac.Extras.NLog;
    using Autofac.Integration.Mvc;
    using InnosixWebApp.Helpers;
    using Models;
    using Owin;
    using System.Linq;
    using System.Web.Mvc;

    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            var builder = new ContainerBuilder();

            builder.RegisterControllers(typeof (Startup).Assembly);

            builder.RegisterModule<SimpleNLogModule>();

            builder.RegisterType<InnosixCsvWrapper>().As<IInnosixCsvWrapper>();

            builder.RegisterType<EmailHelper>().As<IEmailHelper>();

            builder.RegisterType<TechCompanyService>().As<ITechCompanyService>();

            builder.Register(context => new InnosixEntities()).AsSelf();

            var container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
            app.UseAutofacMiddleware(container);
            app.UseAutofacMvc();
            ConfigureAuth(app);
        }
    }
}