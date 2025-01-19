using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProductsWeb.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageLink { get; set; }
        public DateTime SellDate { get; set; }
    }
}