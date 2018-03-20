using System;
using System.Net.Mail;

namespace InnosixWebApp.Helpers
{
    public static class Utilities
    {
        public static bool IsEmailValid(string email)
        {
            try
            {
                var mailAddress = new MailAddress(email);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool ValidUrl(string url)
        {
            Uri validatedUri;

            if (Uri.TryCreate(url, UriKind.Absolute, out validatedUri))
            {
                return (validatedUri.Scheme == Uri.UriSchemeHttp || validatedUri.Scheme == Uri.UriSchemeHttps);
            }
            return false;
        }

        public static string CreateValidUrl(string url)
        {
            Uri uri;
            Uri.TryCreate(url, UriKind.Absolute, out uri);
            return uri.AbsoluteUri.Replace(uri.AbsolutePath, "/");
        }

        public static TValue NullSafe<T, TValue>(this T obj, Func<T, TValue> value)
        {
            try
            {
                return value(obj);
            }
            catch (Exception)
            {
                return default(TValue);
            }
        }
    }
}