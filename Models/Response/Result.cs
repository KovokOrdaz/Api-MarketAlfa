namespace MarketAlfa.Models.Response
{
    public class Result
    {
        public int Success { get; set; }
        public string Message { get; set; }
        public object Data { get; set; }

        public Result()
        {
            this.Success = 0;
            this.Data = null;
        }
    }
}