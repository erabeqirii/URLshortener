namespace urlShortener_eb.Models
{
    using System;
    using System.Collections.Generic;

    public class urlShortenerViewModel
    {
        public urlshortener_history UrlShortener { get; set; }
        public IEnumerable<urlshortener_history> UrlShortenerList { get; set; }
    }
}
