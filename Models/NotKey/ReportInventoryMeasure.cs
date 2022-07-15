using Microsoft.EntityFrameworkCore;

namespace MarketAlfa.Models.NotKey
{
    [Keyless]
    public class ReportInventoryMeasure
    {
        public int Code { get; set; }
        public int CountB { get; set; }
        public string Name { get; set; }
        public decimal AmountTotal { get; set; }
    }
}
