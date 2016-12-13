using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.UtilFolder
{
    public static class Constants
    {
        //maping columns in database
        //public const string CONNECTION_STRING_SERVER = @"Server=(local); Database=dbJackson; integrated security = true;";

        //public const string CONNECTION_STRING_SERVER = @"workstation id=netOffer.mssql.somee.com;packet size=4096;user id=quangthai_itdlu_SQLLogin_1;pwd=llqpnklkxh;data source=netOffer.mssql.somee.com;persist security info=False;initial catalog=netOffer";
        
        //Nhat
        //public const string CONNECTION_STRING_SERVER = @"workstation id=dbAndroidTeam.mssql.somee.com;packet size=4096;user id=jessedlu_SQLLogin_1;pwd=ih4pcuvkmj;data source=dbAndroidTeam.mssql.somee.com;persist security info=False;initial catalog=dbAndroidTeam";
        //public const string CONNECTION_STRING_SERVER = @"workstation id=dbAppPro.mssql.somee.com;packet size=4096;user id=jessedlu_SQLLogin_1;pwd=ih4pcuvkmj;data source=dbAppPro.mssql.somee.com;persist security info=False;initial catalog=dbAppPro";
        //public const string CONNECTION_STRING_SERVER = @"workstation id=dbKingGame.mssql.somee.com;packet size=4096;user id=jessedlu_SQLLogin_1;pwd=ih4pcuvkmj;data source=dbKingGame.mssql.somee.com;persist security info=False;initial catalog=dbKingGame";

        //Vu
        public const string CONNECTION_STRING_SERVER = @"workstation id=dbJackson.mssql.somee.com;packet size=4096;user id=jacksondlu;pwd=QuangVu@1;data source=dbJackson.mssql.somee.com;persist security info=False;initial catalog=dbJackson";

        //pb link
        public const string POSTBACK_LINK = @"&offer_id={offer_id}&aff_sub={aff_sub}&datetime={datetime}&ip={session_ip}";

        ///API link
        ///Get Stat
        ///{0} is NetworkId
        ///{1} is api_key
        ///{2} is current page
        ///{3} is start date
        ///{4} is end date
        public const string API_GET_STAT_DEFAULT = @"https://api.hasoffers.com/Apiv3/json?NetworkId={0}&Target=Affiliate_Report&Method=getStats&api_key={1}&fields[]=Browser.display_name&fields[]=Country.name&fields[]=Offer.name&fields[]=Stat.clicks&fields[]=Stat.conversions&fields[]=Stat.date&fields[]=Stat.payout&groups[]=Stat.date&groups[]=Offer.name&groups[]=Country.name&groups[]=Browser.display_name&sort[Stat.date]=desc&sort[Offer.name]=asc&sort[Browser.display_name]=asc&sort[Country.name]=asc&page={2}&totals=1&data_start={3}&data_end={4}";
        public const string API_GET_STAT_HOUR = @"&fields[]=Stat.hour&groups[]=Stat.hour&sort[Stat.hour]=desc";
        public const string API_GET_STAT_GROSS_CLICK = @"&fields[]=Stat.gross_clicks";
        public const string API_GET_STAT_UNIQUE_CLICK = @"&fields[]=Stat.unique_clicks";
        

        //maping columns in database
        public const string ID_COL = "ID";

        public const string NET_ID_COL = "NET_ID";
        public const string NET_NAME_COL = "NET_NAME";
        public const string NET_API_KEY_COL = "NET_API_KEY";
        public const string NET_STATUS_COL = "NET_STATUS";
        public const string NET_SUB_COL = "AFF_SUB";

        public const string OFFER_ID_COL = "OFFER_ID";
        public const string OFFER_NAME_COL = "OFFER_NAME";
        public const string OFFER_COUNTRY_COL = "OFFER_COUNTRY";
        public const string OFFER_TRACKING_COL = "OFFER_TRACKING";
        public const string OFFER_REVIEW_COL = "OFFER_REVIEW";
        public const string OFFER_ICON_COL = "OFFER_ICON";
        public const string OFFER_PAYOUT_COL = "OFFER_PAYOUT";
        public const string OFFER_POINT_COL = "OFFER_POINT";
        public const string OFFER_RATE_COL = "OFFER_RATE";
        public const string OFFER_DESCRIPTION_COL = "OFFER_DESCRIPTION";
        public const string OFFER_DOWNLOAD_COL = "OFFER_DOWNLOAD";
        public const string OFFER_METAKEY_COL = "META_KEY";
        public const string OFFER_STATUS_COL = "OFFER_STATUS";
        public const string OFFER_CATE_COL = "CATE_NAME";

        public const string MEMBER_ID_COL = "MEMBER_ID";
        public const string MEMBER_NAME_COL = "MEMBER_NAME";
        public const string MEMBER_PASSWORD_COL = "MEMBER_PASSWORD";
        public const string MEMBER_STATUS_COL = "MEMBER_STATUS";
        public const string MEMBER_TOTAL_POINT_COL = "MEMBER_TOTAL_POINT";
        public const string MEMBER_PENDING_POINT_COL = "MEMBER_PENDING_POINT";
        public const string MEMBER_CURRENT_POINT_COL = "MEMBER_CURRENT_POINT";

        // Lead table
        public const string AFF_SUB_COL = "AFF_SUB";
        public const string TIME_COL = "TIME";
        public const string IP_COL = "IP";
        public const string COUNTRY_COL = "COUNTRY";
        public const string CURRENCY_COL = "CURRENCY";
        public const string PAYOUT_COL = "PAYOUT";
        public const string POINT_COL = "POINT";
        public const string USER_AGENT_COL = "USER_AGENT";
        public const string DEVICE_BRAND_COL = "DEVICE_BRAND";
        public const string DEVICE_MODEL_COL = "DEVICE_MODEL";
        public const string DEVICE_OS_COL = "DEVICE_OS";
        public const string DEVICE_OS_VERSION_COL = "DEVICE_OS_VERSION";

        // IP
        public const string COUNTRY_CODE_COL = "COUNTRY_CODE";
        public const string COUNTRY_NAME_COL = "COUNTRY_NAME";
        public const string COUNTRY_CODE_PARA = "@countryCode";
        public const string COUNTRY_NAME_PARA = "@countryName";

        public const string NOTICE_AUTHOR_COL = "AUTHOR";
        public const string NOTICE_CONTENT_COL = "NOTICE";
        public const string NOTICE_CREATE_DATE_COL = "CREATE_TIME";

        public const string NOTICE_AUTHOR_PARA = "@author";
        public const string NOTICE_CONTENT_PARA = "@notice";

        //maping prameters for stored procedure in database
        public const string ID_PARA = "@ID";

        public const string NET_ID_PARA = "@netID";
        public const string NET_NAME_PARA = "@netName";
        public const string NET_API_KEY_PARA = "@netApiKey";
        public const string NET_STATUS_PARA = "@netStatus";
        public const string NET_SUB_PARA = "@affSub";

        public const string OFFER_ID_PARA = "@offerID";
        public const string OFFER_NAME_PARA = "@offerName";
        public const string OFFER_COUNTRY_PARA = "@offerCountry";
        public const string OFFER_TRACKING_PARA = "@offerTracking";
        public const string OFFER_REVIEW_PARA = "@offerReview";
        public const string OFFER_ICON_PARA = "@offerIcon";
        public const string OFFER_PAYOUT_PARA = "@offerPayout";
        public const string OFFER_POINT_PARA = "@offerPoint";
        public const string OFFER_RATE_PARA = "@offerRate";
        public const string OFFER_DOWNLOAD_PARA = "@offerDownload";
        public const string OFFER_META_KEY_PARA = "@offerMetaKey";
        public const string OFFER_STATUS_PARA = "@offerStatus";
        public const string CATE_NAME_PARA = "@cateName";

        public const string USERNAME_PARA = "@userName";
        public const string PASSWORD_PARA = "@password";

        public const string MEMBER_ID_PARA = "@memberID";
        public const string MEMBER_NAME_PARA = "@memberName";
        public const string MEMBER_PASSWORD_PARA = "@memberPassword";
        public const string MEMBER_STATUS_PARA = "@memberStatus";
        public const string MEMBER_TOTAL_POINT_PARA = "@memberTotalPoint";
        public const string MEMBER_PENDING_POINT_PARA = "@memberPendingPoint";
        public const string MEMBER_CURRENT_POINT_PARA = "@memberCurrentPoint";

        // Lead table
        public const string AFF_SUB_PARA = "@affSub";
        public const string TIME_PARA = "@time";
        public const string IP_PARA = "@ip";
        public const string IP_NUMBER_PARA = "@ipNumber";
        public const string COUNTRY_PARA = "@country";
        public const string CURRENCY_PARA = "@currency";
        public const string PAYOUT_PARA = "@payout";
        public const string POINT_PARA = "@point";
        public const string DEVICE_BRAND_PARA = "@deviceBrand";
        public const string DEVICE_MODEL_PARA = "@deviceModel";
        public const string DEVICE_OS_PARA = "@deviceOS";
        public const string DEVICE_OS_VERSION_PARA = "@deviceOSVersion";

        public const string DATE_PARA = "@date";


        //maping stored procedures name in database
        public const string NET_ADD_STORED = "Net_addNet";
        public const string NET_CHECK_EXISTS_STORED = "Net_checkExists";
        public const string NET_DELETE_BY_ID_STORED = "Net_deleteByID";
        public const string NET_GET_ALL_STORED = "Net_getAll";
        public const string NET_GET_BY_ID_STORED = "Net_getByID";
        public const string NET_GET_BY_NAME_STORED = "Net_getByName";
        public const string NET_UPDATE_STATUS_STORED = "Net_updateStatusNet";
        public const string NET_UPDATE_STORED = "Net_updateNet";

        public const string OFFER_ADD_STORED = "Offer_addOffer";
        public const string OFFER_CHECK_EXISTS_STORED = "Offer_checkExists";
        public const string OFFER_DELETE_BY_ID_STORED = "Offer_deleteByID";
        public const string OFFER_DELETE_BY_NET_ID_STORED = "Offer_deleteByNetID";
        public const string OFFER_GET_ALL_STORED = "Offer_getAll";
        public const string OFFER_GET_ALL_BY_NET_ID_STORED = "Offer_getAllByNetID";
        public const string OFFER_GET_BY_ID_STORED = "Offer_getByID";
        public const string OFFER_GET_BY_ID_AFF_SUB_STORED = "Offer_getByIDWithAff_Sub";
        public const string OFFER_UPDATE_STATUS_STORED = "Offer_updateStatusOffer";
        public const string OFFER_UPDATE_STORED = "Offer_updateOffer";

        public const string TRACKING_ADD_STORED = "Tracking_addTracking";
        public const string TRACKING_DELETE_STORED = "Tracking_deleteTracking";

        public const string PASSWORD_CHECK_VALID_STORED = "checkValidPassword";
        public const string PASSWORD_UPDATE_STORED = "updatePassword";

        public const string USER_CHECK_LOGIN_STORED = "checkLogin";

        public const string ADS_NET_GET_BY_ID_STORED = "ads_Net_getByID";
        public const string ADS_OFFER_GET_ALL_ACTIVE_BY_NET_ID_STORED = "ads_Offer_getAllActiveByNetID";
        public const string ADS_OFFER_GET_ALL_BY_NET_ID_STORED = "ads_Offer_getAllByNetID";

        public const string WORKING_NET_GET_ALL_STORED = "working_Net_getAll";
        public const string WORKING_OFFER_GET_ALL_STORED = "working_Offer_getAll";
        public const string WORKING_OFFER_GET_ALL_BY_GEO_STORED = "working_Offer_getAll_by_GEO";
        public const string WORKING_MEMBER_GET_INFO_STORED = "working_Member_getInfo";

        public const string CLICK_NET_GET_ALL_STORED = "click_Net_getAll";
        public const string CLICK_OFFER_GET_ALL_ACTIVE_BY_NET_ID_STORED = "click_Offer_getAllActiveByNetID";
        public const string CLICK_OFFER_GET_ALL_BY_NET_ID_STORED = "click_Offer_getAllByNetID";

        public const string MEMBER_GET_ALL_STORED = "Member_getAll";
        public const string MEMBER_UPDATE_STATUS_STORED = "Member_updateStatus";
        public const string MEMBER_DELETE_BY_ID_STORED = "Member_deleteByID";
        public const string MEMBER_GET_BY_ID_STORED = "Member_getByID";
        public const string MEMBER_CREATE_INVOICE_STORED = "Member_createInvoice";
        public const string MEMBER_CREATE_PAYMEMT_STORED = "Member_createPayment";
        public const string MEMBER_ADD_STORED = "Member_add";
        public const string MEMBER_UPDATE_STORED = "Member_update";
        public const string MEMBER_CHECK_LOGIN_STORED = "Member_checkLogin";

        public const string LEAD_GET_ALL_STORED = "Lead_getAll";
        public const string LEAD_GET_TOP30_STORED = "Lead_getTop30";
        public const string LEAD_GET_TOP30_BY_MEM_STORED = "Lead_getTop30ByMember";
        public const string LEAD_GET_ALL_BY_NET_ID_STORED = "Lead_getAllByNetID";
        public const string LEAD_DELETE_BY_DATE_STORED = "Lead_delteByDate";

        public const string NOTICE_GET_NOTICE_STORED = "Notice_getNotice";
        public const string NOTICE_SAVE_NOTICE_STORED = "Notice_saveNotice";

        //postback
        public const string POSTBACK_PROCESS_STORED = "postback_process";

        //IP
        public const string IP_GET_INFO_STORED = "Ip_GetInfo";

        /// receiver
        // request string
        public const string NET_ID_REQUEST_STRING = "nid";
        public const string AFF_SUB_REQUEST_STRING = "aff_sub";
        public const string OFFER_ID_REQUEST_STRING = "offer_id";

        public const string DATETIME_REQUEST_STRING = "datetime";
        public const string IP_REQUEST_STRING = "ip";
        public const string CURRENCY_REQUEST_STRING = "currency";
        public const string PAYOUT_REQUEST_STRING = "payout";
        public const string DEVICE_BRAND_REQUEST_STRING = "device_brand";
        public const string DEVICE_MODEL_REQUEST_STRING = "device_model";
        public const string DEVICE_OS_REQUEST_STRING = "device_os";
        public const string DEVICE_OS_VERSION_REQUEST_STRING = "device_os_version";
        
    }
}
