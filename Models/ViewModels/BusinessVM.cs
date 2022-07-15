namespace MarketAlfa.Models.ViewModels
{
    public partial class BusinessVM
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Rif { get; set; }
        public int Ls { get; set; }
        public string Logo { get; set; }
        public string Direction { get; set; }
        public string Mail { get; set; }
        public string Phone { get; set; }
        public string Coin { get; set; }
        public string Acronym { get; set; }
        public int ZoneHorary { get; set; }
        public TimeSpan Input { get; set; }
        public TimeSpan Output { get; set; }
    }
}