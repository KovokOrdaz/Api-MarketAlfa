namespace MarketAlfa.Models.Response
{
    public class UserResult
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public bool Privilege { get; set; }
        public string Token { get; set; }
    }
}