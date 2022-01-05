//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gamerary.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Game
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Game()
        {
            this.GameLists = new HashSet<GameList>();
        }

        public int gameID { get; set; }
        public Nullable<int> platformID { get; set; }
        public Nullable<int> genreID { get; set; }
        [Required(ErrorMessage = "Oyun ismi girmek zorundasınız!")]
        public string gameName { get; set; }
        [Required(ErrorMessage = "Yayıncı firma ismi girmek zorundasınız!")]
        public string publisherName { get; set; }
        [Required(ErrorMessage = "Geliştirici firma ismi girmek zorundasınız!")]
        public string developerName { get; set; }
        [Required(ErrorMessage = "Tarih girmek zorundasınız!")]
        [Display(Name = "releaseDate")]
        [DataType(DataType.Date)]
        public string releaseDate { get; set; }
        [Required(ErrorMessage = "Fiyat bilgisini girmek zorundasınız!")]
        public decimal price { get; set; }
        public Nullable<double> rating { get; set; }
        [Required(ErrorMessage = "Oyun içeriğini girmek zorundasınız!")]
        public string content { get; set; }

        public virtual GamePlatform GamePlatform { get; set; }
        public virtual Genre Genre { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GameList> GameLists { get; set; }
    }
}
