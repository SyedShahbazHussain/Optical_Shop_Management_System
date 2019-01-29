using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{

    public class AppSettings
    {
        OpticalPointOfSaleEntities EF = new OpticalPointOfSaleEntities();
        public string ShopName
        {
            get
            {
                var CustomerOrderExists = EF.AppSettings.FirstOrDefault(r => r.SettingKey == Constants.ShopNameKey);
                if (CustomerOrderExists == null)
                {
                    AppSetting newSetting = new AppSetting();
                    newSetting.SettingKey = Constants.ShopNameKey;
                    newSetting.SettingValue = Constants.DefaultShopName;
                    newSetting.IsActive = true;
                    newSetting.Description = "Name Of Shop";
                    EF.AppSettings.Add(newSetting);
                    EF.SaveChanges();
                    return Constants.DefaultShopName;
                }
                else
                {
                    return CustomerOrderExists.SettingValue;
                }
            }
            
        }
    }
}
