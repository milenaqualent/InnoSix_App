namespace InnosixWebApp.Helpers
{
    using System.Collections.Generic;
    using System.IO;
    using Models;

    public interface IInnosixCsvWrapper
    {
        IEnumerable<TCBasicInfo> ReadCsv(string filePath);
        IEnumerable<TCBasicInfo> ReadCsv(Stream inputStream);
    }
}