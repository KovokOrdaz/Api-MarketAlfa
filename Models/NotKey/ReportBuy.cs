using Microsoft.EntityFrameworkCore;

namespace MarketAlfa.Models.NotKey
{
    [Keyless]
    public class ReportBuy
    {
        public string Date { get; set; }
        public int CountB { get; set; }
        public decimal AveragePrice { get; set; }
        public decimal AverageProfit { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal TotalProfit { get; set; }
    }
}