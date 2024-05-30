using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectroVehicleShop
{
    [Serializable]
    public class CartUnit
    {
        public CartUnit() { }
        ~CartUnit() { }
        public string id_transport { get; set; }
        public string name { get; set; }
        public string total_amount { get; set; }
        public string price { get; set; }
        // сума замовлення
        public string cost { get; set; }
    }
}