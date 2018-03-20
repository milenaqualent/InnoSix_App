namespace InnosixWebApp.Models
{
    using System.Linq;
    using DevExpress.Data.Linq.Helpers;
    using DevExpress.Web.Mvc;

    public interface ICustomBindingsHandler<T> where T :class 
    {
        void GetRowCount(GridViewCustomBindingGetDataRowCountArgs e);
        void GetData(GridViewCustomBindingGetDataArgs e);
        void GetSummary(GridViewCustomBindingGetSummaryValuesArgs e);
        void GetGroupingInfo(GridViewCustomBindingGetGroupingInfoArgs e);
        void GetUniqueHeaderFilter(GridViewCustomBindingGetUniqueHeaderFilterValuesArgs e);
    }

    public class CustomBindingsHandler<T, T1>: ICustomBindingsHandler<T1> where T : IQueryable<T1> where T1: class
    {
        private readonly T _data;

        public CustomBindingsHandler(T data)
        {
            _data = data;
        }

        
        public void GetRowCount(GridViewCustomBindingGetDataRowCountArgs e)
        {
            int rowCount;
            e.DataRowCount = GridViewCustomBindingSummaryCache.TryGetCount(e.FilterExpression, out rowCount)
                ? rowCount
                : _data.ApplyFilter(e.FilterExpression).Count();
        }

        public void GetData(GridViewCustomBindingGetDataArgs e)
        {
            e.Data =
                _data.ApplyFilter(e.FilterExpression)
                    .ApplyFilter(e.GroupInfoList)
                    .ApplySorting(e.State.SortedColumns)
                    .Skip(e.StartDataRowIndex)
                    .Take(e.DataRowCount);
        }

        public void GetSummary(GridViewCustomBindingGetSummaryValuesArgs e)
        {
            //            var filter = Persons.ApplyFilter(e.FilterExpression).ApplyFilter(e.GroupInfoList);
            //            var calculateSummary = filter.CalculateSummary(e.SummaryItems);
            //            e.Data = calculateSummary;
            //            var countSummaryItem = e.SummaryItems.FirstOrDefault(state => state.SummaryType == SummaryItemType.Count);
            //            if (e.GroupInfoList.Count == 0 && countSummaryItem != null)
            //            {
            //                var indexOf = e.SummaryItems.IndexOf(countSummaryItem);
            //                var count = calculateSummary[indexOf] != null ? Convert.ToInt32(calculateSummary[indexOf]) : 0;
            //                GridViewCustomBindingSummaryCache.SaveCount(e.FilterExpression, count);
            //            }
        }

        public void GetGroupingInfo(GridViewCustomBindingGetGroupingInfoArgs e)
        {
            e.Data = _data.ApplyFilter(e.FilterExpression)
                .ApplyFilter(e.GroupInfoList)
                .GetGroupInfo(e.FieldName, e.SortOrder);
        }

        public void GetUniqueHeaderFilter(GridViewCustomBindingGetUniqueHeaderFilterValuesArgs e)
        {
            e.Data = _data.ApplyFilter(e.FilterExpression).UniqueValuesForField(e.FieldName);
        }
    }


//    public class CustomBindingsHandler
//    {
//        private static readonly AdventureWorks2014_DataEntities Db = new AdventureWorks2014_DataEntities();
//
//        private static readonly IQueryable<Person> Persons = Db.Person.OrderBy(person => person.BusinessEntityID);
//
//        public static void GetRowCount(GridViewCustomBindingGetDataRowCountArgs e)
//        {
//            int rowCount;
//            e.DataRowCount = GridViewCustomBindingSummaryCache.TryGetCount(e.FilterExpression, out rowCount)
//                ? rowCount
//                : Persons.ApplyFilter(e.FilterExpression).Count();
//        }
//
//        public void GetRowCount1(GridViewCustomBindingGetDataRowCountArgs e)
//        {
//            e.DataRowCount = 13;
//        }
//
//        public static void GetData(GridViewCustomBindingGetDataArgs e)
//        {
//            e.Data =
//                Persons.ApplyFilter(e.FilterExpression)
//                    .ApplyFilter(e.GroupInfoList)
//                    .ApplySorting(e.State.SortedColumns)
//                    .Skip(e.StartDataRowIndex)
//                    .Take(e.DataRowCount);
//        }
//
//        public static void GetSummary(GridViewCustomBindingGetSummaryValuesArgs e)
//        {
//
//        }
//
//        public static void GetGroupingInfo(GridViewCustomBindingGetGroupingInfoArgs e)
//        {
//            e.Data = Persons.ApplyFilter(e.FilterExpression)
//                .ApplyFilter(e.GroupInfoList)
//                .GetGroupInfo(e.FieldName, e.SortOrder);
//        }
//
//        public static void GetUniqueHeaderFilter(GridViewCustomBindingGetUniqueHeaderFilterValuesArgs e)
//        {
//            e.Data = Persons.ApplyFilter(e.FilterExpression).UniqueValuesForField(e.FieldName);
//        }
//    }
}