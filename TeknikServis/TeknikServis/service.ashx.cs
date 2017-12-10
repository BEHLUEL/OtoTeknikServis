using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Configuration;
using Newtonsoft.Json;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;
using System.Web.SessionState;

namespace TeknikServis
{
    /// <summary>
    /// Summary description for service
    /// </summary>

    public class service : IHttpHandler, IRequiresSessionState
    {

        SqlConnection baglanti = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

        public class Output
        {
            public bool basarili;
            public string status = "";
            public string baslik = "";
            public string mesaj = "";
            public string html = "";
            public int outputid = 0;
            public int count;
            public int id;
            public object data;

        }
        public class form
        {
            public string[] key;
            public string value;
        }
        Output ciktijson = new Output();



        public void ProcessRequest(HttpContext context)
        {

            string islem = context.Request.QueryString["islem"];
            List<String[]> allform = new List<String[]>();
            foreach (string key in context.Request.Form.AllKeys)
            {
                String[] t = new string[] { key, context.Request.Form[key] };
                allform.Add(t);
            }
            //ciktijson.form = allform;
            try
            {
                switch (islem)
                {
                                      
                    case "giris": giris(context); break;                 
                    case "idTasi": idTasi(context); break;
                    case "yeniServisKayit":yeniServisKayit(context);break;                
                    case "cikis": cikis(context); break;                    
                    case "getAraba": getAraba(context); break;
                    case "getMarka":getMarka(context);break;
                    case "getModel":getModel(context);break;
                    case "getMusteri":getMusteri(context); break;
                    case "aracEkle":aracEkle(context);break;
                    case "musteriEkle":musteriEkle(context);break;
                    case "musteriBilgi":musteriBilgi(context);break;
                    case "musteriSil":musteriSil(context);break;
                    case "musteriGuncelle":musteriGuncelle(context);break;
                    case "musteriAra":musteriAra(context);break;
                    case "servisKayitGoster":servisKayitGoster(context); break;
                    case "getCalisan":getCalisan(context);break;
                    case "getTedarikci":getTedarikci(context);break;
                    case "uygunParcalar":uygunParcalar(context);break;
                    case "getParca":getParca(context);break;
                    case "getParca1": getParca1(context); break;
                    case "parcaAlimEkle":parcaAlimEkle(context);break;
                    case "getParcaAlim":getParcaAlim(context);break;
                    case "getParcaAlim1":getParcaAlim1(context);break;
                    case "getParcaAlimId": getParcaAlimId(context); break;
                    case "getParcaAlimId1": getParcaAlimId1(context); break;
                    case "getParcaBilgi":getParcaBilgi(context);break;
                    case "alinanParcalar":alinanParcalar(context);break;
                    case "parcaEkle":parcaEkle(context);break;
                    case "tedarikciBilgi":tedarikciBilgi(context);break;
                    case "tedarikciGuncelle":tedarikciGuncelle(context);break;
                    case "tedarikciSil":tedarikciSil(context);break;
                    case "parcaGuncelle":parcaGuncelle(context);break;
                    case "modelEkle":modelEkle(context);break;
                    case "getCalisanId": getCalisanId(context);break;
                    case "calisanGuncelle": calisanGuncelle(context);break;
                    case "getStatu":getStatu(context);break;
                    case "getCalismaAlani": getCalismaAlani(context); break;
                    case "calisanEkle":calisanEkle(context);break;
                    case "calisanSil":calisanSil(context);break;

                };
            }
            catch (Exception ex)
            {
                ciktijson.basarili = false;
                ciktijson.baslik = "Hata";
                ciktijson.status = "error";
                ciktijson.mesaj = ex.Message;

            }

            if (ciktijson.basarili)
            {
                if (ciktijson.baslik == "") { ciktijson.baslik = "İşlem Başarılı"; }
                if (ciktijson.status == "") { ciktijson.status = "success"; }
                if (ciktijson.mesaj == "") { ciktijson.mesaj = "İşleminiz başarıyla yapıldı"; }
            }
            else
            {

                if (ciktijson.status == "") { ciktijson.status = "error"; }
                if (ciktijson.baslik == "") { ciktijson.baslik = "Hata"; }
                if (ciktijson.mesaj == "") { ciktijson.mesaj = "Beklenmeyen Bir hata oluştu."; }
            }

            if (string.IsNullOrEmpty(context.Request.QueryString["json"]))
            {
                context.Response.ContentType = "text/plain";
            }
            else
            {
                context.Response.ContentType = "application/json";
            }


            context.Response.Write(JsonConvert.SerializeObject(ciktijson));

        }
        
        public void cikis(HttpContext context)
        {
            context.Session.Abandon();
        }

        //public void deftereEkle(HttpContext context)
        //{
        //    baglanti.Open();
        //    SqlCommand komut = new SqlCommand("insert into defterlertbl(yemek, gorecekid) values(" + Convert.ToInt32(context.Session["yemek"]) + "," + Convert.ToInt32(context.Session["kullaniciid"]) + "); SELECT SCOPE_IDENTITY();");
        //    komut.CommandType = CommandType.Text;
        //    komut.Connection = baglanti;

        //    int outputid1 = Convert.ToInt32(komut.ExecuteScalar());
        //    ciktijson.basarili = (outputid1 > 0);

        //    baglanti.Close();
        //}
        public void calisanSil(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("delete from Calisanlar where CalisanId=@id");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            komut.Parameters.AddWithValue("@id", id);
            int outputid1 = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid1 > 0);
            baglanti.Close();
        }
        public void calisanEkle(HttpContext context)
        {
            baglanti.Open();
            string ad = context.Request.Form["ad"];
            string soyad = context.Request.Form["soyad"];
            string kimlikno = context.Request.Form["kimlikno"];
            string tel = context.Request.Form["tel"];
            string email = context.Request.Form["email"];
            string adres = context.Request.Form["adres"];
            string statu = context.Request.Form["statu"];
            string calismaalani = context.Request.Form["calismaalani"];

            SqlCommand komut = new SqlCommand("insert into Calisanlar (Ad,Soyad,TCKimlikNo,Tel,Adres,Email,StatuId,CalismaAlaniId)values(@ad,@soyad,@kimlikno,@tel,@adres,@email,@statu,@calismaalani)");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;


            komut.Parameters.AddWithValue("@ad", ad);
            komut.Parameters.AddWithValue("@soyad", soyad);
            komut.Parameters.AddWithValue("@kimlikno", kimlikno);
            komut.Parameters.AddWithValue("@tel", tel);
            komut.Parameters.AddWithValue("@email", email);
            komut.Parameters.AddWithValue("@adres", adres);
            komut.Parameters.AddWithValue("@statu", statu);
            komut.Parameters.AddWithValue("@calismaalani", calismaalani);

            int outputid1 = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid1 > 0);


            baglanti.Close();
        }

        public void getStatu(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from Statuler");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();

            baglanti.Close();
        }
        public void getCalismaAlani(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from CalismaAlanlari");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();

            baglanti.Close();
        }

        public void calisanGuncelle(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            string ad = context.Request.Form["guncellead"];
            string soyad = context.Request.Form["guncellesoyad"];
            string tc = context.Request.Form["guncelletc"];
            string tel = context.Request.Form["guncelletel"];
            string email = context.Request.Form["guncelleemail"];
            string adres = context.Request.Form["guncelleadres"];

            SqlCommand komut = new SqlCommand("update Calisanlar set Ad=@ad, Soyad=@soyad, TcKimlikNo=@tc, Tel=@tel,Adres=@adres,Email=@email where CalisanId=@id");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            komut.Parameters.AddWithValue("@id", id);
            komut.Parameters.AddWithValue("@ad", ad);
            komut.Parameters.AddWithValue("@soyad", soyad);
            komut.Parameters.AddWithValue("@tc", tc);
            komut.Parameters.AddWithValue("@tel", tel);
            komut.Parameters.AddWithValue("@email", email);
            komut.Parameters.AddWithValue("@adres", adres);

            int outputid = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid > 0);

            baglanti.Close();
        }

        public void getCalisanId(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("select * from Calisanlar where CalisanId=@id");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            komut.Parameters.AddWithValue("@id", id);
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }

        public void modelEkle(HttpContext context)
        {
            baglanti.Open();
            string model = context.Request.Form["model"];
            SqlCommand komut = new SqlCommand("insert into Modeller(ModelAdi,MarkaId)values(@model,1)");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            komut.Parameters.AddWithValue("@model", model);
            int outputid1 = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid1 > 0);
            

            baglanti.Close();
        }
        public void getParcaBilgi(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("select * from Parcalar where ParcaId="+Convert.ToInt32(id)+"");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();


            baglanti.Close();
        }

        public void parcaAlimEkle(HttpContext context)
        {
            baglanti.Open();
            string tedarikci = context.Request.Form["tedarikci"];
            string fiyat = context.Request.Form["fiyat"];
            string parcalar = context.Request.Form["parcalar"];
            string parcalar1 = parcalar;
            int uzunluk=parcalar1.Split('\r').Length;
            string[] parcalarSatir = new string[uzunluk];
            string parca;
            int adet;
            int parcaId;
            parcalarSatir = parcalar.Split('\r');
            SqlCommand komutt = new SqlCommand("select TedarikciId from Tedarikciler where TedarikciAdi='" + tedarikci + "'");
            komutt.CommandType = CommandType.Text;
            komutt.Connection = baglanti;
            int tedarikciId = Convert.ToInt32(komutt.ExecuteScalar());
            int outputid1 = Convert.ToInt32(komutt.ExecuteScalar());
            ciktijson.basarili = (outputid1 > 0);

            SqlCommand komut = new SqlCommand("insert into ParcaAlimlar (TedarikciId,Fiyat)values(" + tedarikciId + "," + Convert.ToInt32(fiyat) + ")");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

             outputid1 = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid1 > 0);
            SqlCommand komut1 = new SqlCommand("select top 1 ParcaAlimId from ParcaAlimlar order by ParcaAlimId desc");
            komut1.CommandType = CommandType.Text;
            komut1.Connection = baglanti;
            int parcaAlimId = Convert.ToInt32(komut1.ExecuteScalar());
            outputid1 = Convert.ToInt32(komut1.ExecuteScalar());
            ciktijson.basarili = (outputid1 > 0);

            for (int i = 0; i < uzunluk-1; i++)
            {
                parca = parcalarSatir[i].Split('*')[0];
                parcaId=Convert.ToInt32(parca.Split('-')[1]);
                adet =Convert.ToInt32(parcalarSatir[i].Split('*')[1]);

                SqlCommand komut2 = new SqlCommand("insert into ParcaAlimlar_Parcalar (ParcaAlimId,ParcaId,Adet)values(" + parcaAlimId+","+parcaId+","+adet+")");
                komut2.CommandType = CommandType.Text;
                komut2.Connection = baglanti;

                outputid1 = Convert.ToInt32(komut2.ExecuteNonQuery());
                ciktijson.basarili = (outputid1 > 0);

            }


            

            baglanti.Close();
        }

        public void stokKontrol(HttpContext context)
        {
            baglanti.Open();
            string islemler = context.Request.Form["output"];
            int parcaId;
            int miktar;
            int onarım;
            string[] islemsplit =new string[2];
            islemsplit = islemler.Split('*');
            parcaId = Convert.ToInt32(islemsplit[0].Split(' ')[0]);
            miktar = Convert.ToInt32(islemsplit[1].Split('-')[0]);
            onarım = Convert.ToInt32(islemsplit[1].Split('-')[1]);

            SqlCommand komut = new SqlCommand("select Adet from Parcalar where ParcaId="+parcaId+"");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (Convert.ToInt32(rdr[0]) < miktar)
            {
                ciktijson.basarili = false;

            }
            else ciktijson.basarili = true;

            rdr.Close();
            baglanti.Close();
        }
        public void yeniServisKayit(HttpContext context)
        {
            baglanti.Open();
            string plaka = context.Request.Form["plaka"];
            string yillikbakim = context.Request.Form["yillikBakim"];
            string km = context.Request.Form["km"];
            string islemler = context.Request.Form["parcaIslemler"];
            int fiyat=0;
            string[] parcaId = new string[60];
            string[] miktar = new string[60];
            string[] onarim = new string[60]; 
            string[] islemtam = new string[60];
            string[] islem = new string[2];
            string[] miktarVeislem = new string[2];
            
            islemtam = islemler.Split('\r');
            int j = 0;
            for (int i = 0; i < islemtam.Length - 1; i++)
            {
                string adet;
                string parca;
                string idParca;
                string parcaAdi;
                islem = islemtam[i].Split('*');
                parca = islem[0];
                idParca = parca.Split(' ')[0];
                parcaAdi = parca.Split(' ')[1];
                parcaId[j] = idParca;
                adet = islem[1];
                miktarVeislem= adet.Split('-');
                onarim[j] = miktarVeislem[0];
                miktar[j] = miktarVeislem[1];
                if (miktarVeislem[1] == "1")
                {
                    SqlCommand komut2 = new SqlCommand("update Parcalar set Adet=Adet-" + Convert.ToInt32(miktarVeislem[0]) + " where ParcaId="+Convert.ToInt32(idParca)+"");
                    komut2.CommandType = CommandType.Text;
                    komut2.Connection = baglanti;
                    //int outputId=Convert.ToInt32(komut2.ExecuteNonQuery());
                    int outputid = Convert.ToInt32(komut2.ExecuteNonQuery());
                    ciktijson.basarili = (outputid > 0);

                    SqlCommand komut3 = new SqlCommand("select ParcaFiyat from Parcalar where ParcaId=" + Convert.ToInt32(idParca) + "");
                    komut3.CommandType = CommandType.Text;
                    komut3.Connection = baglanti;
                    SqlDataReader rdr2 = komut3.ExecuteReader();
                    fiyat = fiyat + Convert.ToInt32(rdr2[0]);
                    rdr2.Close();
                }
                else
                {
                    SqlCommand komut3 = new SqlCommand("select TamirUcreti from Parcalar where ParcaId=" + Convert.ToInt32(idParca) + "");
                    komut3.CommandType = CommandType.Text;
                    komut3.Connection = baglanti;
                    SqlDataReader rdr1 = komut3.ExecuteReader();
                    fiyat = fiyat + Convert.ToInt32(rdr1[0]);
                    rdr1.Close();
                }
                
                

               
                j++;
            }
            SqlCommand komut1 = new SqlCommand("select ArabaId from Arabalar where Plaka='"+plaka+"'");
            komut1.CommandType = CommandType.Text;
            komut1.Connection = baglanti;
            SqlDataReader rdr = komut1.ExecuteReader();
            int arabaId = Convert.ToInt32(rdr[0]);

            SqlCommand komut = new SqlCommand("insert into ServisKayitlari(ArabaId,Plaka,KullaniciId,StandartBakim,AracKm,ServisNot,Fiyat) values("+arabaId+","+plaka+","+Convert.ToInt32(context.Session["kullaniciId"])+","+Convert.ToInt32(yillikbakim)+","+Convert.ToInt32(km)+","+islemler+","+fiyat+")");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            int outputid1 = Convert.ToInt32(komut.ExecuteScalar());
            ciktijson.basarili = (outputid1 > 0);
            rdr.Close();
            baglanti.Close();
        }
       
        public void getAraba(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select Plaka, MarkaAdi, ModelAdi,ModelYili,Ad,Soyad,SasiNo from Arabalar A join Musteriler M on M.MusteriId=A.MusteriId join Markalar Ma on A.MarkaId=Ma.MarkaId join Modeller Mo on Mo.ModelId=A.ModelId");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }

        public void getMarka(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from Markalar");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void getModel1(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select ModelId,ModelAdi from Modeller");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }

        public void getModel(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from Modeller");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void alinanParcalar(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("select ParcaAdi,P.ParcaId as[parcaId],PP.Adet as[adet] from Parcalar P join ParcaAlimlar_Parcalar PP on P.ParcaId=PP.ParcaId where ParcaAlimId="+Convert.ToInt32(id)+"");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void getParcaAlimId1(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("select * from ParcaAlimlar where ParcaAlimId=" + Convert.ToInt32(id) + "");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void getParcaAlimId(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("select TedarikciAdi,Fiyat,Tarih from ParcaAlimlar PA join Tedarikciler T on PA.TedarikciId=T.TedarikciId where ParcaAlimId="+Convert.ToInt32(id)+"");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void getParcaAlim1(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from ParcaAlimlar where TedarikciId is null");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void getParcaAlim(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select ParcaAlimId,TedarikciAdi,Fiyat,Tarih from ParcaAlimlar PA join Tedarikciler T on PA.TedarikciId=T.TedarikciId");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }

        public void parcaGuncelle(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            int degisimFiyat =Convert.ToInt32(context.Request.Form["degisimUcret"]);
            int onarimUcret =Convert.ToInt32(context.Request.Form["onarim"]);

            SqlCommand komut = new SqlCommand("update Parcalar set ParcaFiyat=@degisimFiyat,TamirUcreti=@onarimUcret where ParcaId=@id");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            komut.Parameters.AddWithValue("@id", id);

            komut.Parameters.AddWithValue("@degisimFiyat",degisimFiyat);
            komut.Parameters.AddWithValue("@onarimUcret", onarimUcret);

            int outputid = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid > 0);
            //ciktijson.basarili = true;
            ciktijson.mesaj = "Kayıt başarıyla gerçekleştirildi";

            baglanti.Close();
        }
        public void aracEkle(HttpContext context)
        {
            baglanti.Open();
            string tel = context.Request.Form["tel"];
            string marka = context.Request.Form["marka"];
            string model = context.Request.Form["model"];
            string modelYil = context.Request.Form["yil"];
            string sasi = context.Request.Form["sasi"];
            string plaka = context.Request.Form["plaka"];
            int kayitSayisi = 0;
            int yil = Convert.ToInt32(modelYil);
            SqlCommand komut = new SqlCommand("select MusteriId from Musteriler where Telefon='"+tel+"'");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            int outputid = Convert.ToInt32(komut.ExecuteScalar());
            
            ciktijson.data = outputid;
            ciktijson.basarili = (outputid > 0);
            SqlCommand komut1 = new SqlCommand("insert into Arabalar (MusteriId,MarkaId,ModelId,Plaka,ModelYili,SasiNo,ToplamKayit) values("+outputid+",@marka,@model,@plaka,@yil,@sasi,@sayi)");
            komut1.CommandType = CommandType.Text;
            komut1.Connection = baglanti;
            
            int outputid1 = Convert.ToInt32(komut1.ExecuteScalar());
            ciktijson.basarili = (outputid1 > 0);
            
            komut1.Parameters.AddWithValue("@marka", marka);
            komut1.Parameters.AddWithValue("@model", model);
            komut1.Parameters.AddWithValue("@yil", yil);
            komut1.Parameters.AddWithValue("@sasi", sasi);
            komut1.Parameters.AddWithValue("@plaka", plaka);
            komut1.Parameters.AddWithValue("@sayi", kayitSayisi);

            // komut1.Parameters.AddWithValue("@id", outputid);

            //if (ciktijson.basarili)
            //{
            //    SqlDataReader rdr = komut.ExecuteReader();
            //    string musteriId = "";
            //    while (rdr.Read())
            //    {
            //        musteriId += rdr["MusteriId"];
            //        ciktijson.basarili = true;
            //    }

            //    id = Convert.ToInt32(musteriId);





            //SqlCommand komut1 = new SqlCommand("insert into Arabalar(MusteriId,MarkaId,ModelId,Plaka,ModelYili,SasiNo)values("," + Convert.ToInt32(marka) + "," + Convert.ToInt32(model) + ",'" + plaka + "'," + Convert.ToInt32(modelYil) + ",'" + sasi + "')");
            //komut1.CommandType = CommandType.Text;
            //komut1.Connection = baglanti;

            //int outputid1 = Convert.ToInt32(komut1.ExecuteScalar());
            //ciktijson.basarili = (outputid1 > 0);
            baglanti.Close();
        }

        public void getMusteri(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from Musteriler");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
                ciktijson.mesaj = "asdasd";
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        
        public void musteriEkle(HttpContext context) {
            baglanti.Open();
            string ad = context.Request.Form["ad"];
            string soyad = context.Request.Form["soyad"];
            string tckimlik = context.Request.Form["tckimlikno"];
            string telefon = context.Request.Form["telefon"];
            string email = context.Request.Form["email"];
            string adres = context.Request.Form["adres"];

            SqlCommand komut = new SqlCommand("insert into Musteriler (Ad,Soyad,TcKimlikNo,Telefon,Email,Adres) values('" + ad + "','"+soyad+"','"+tckimlik+"','"+telefon+"','"+email+"','"+adres+ "'); SELECT SCOPE_IDENTITY();");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            int outputid1 = Convert.ToInt32(komut.ExecuteScalar());
            ciktijson.basarili = (outputid1 > 0);
            baglanti.Close();
        }
        public void parcaEkle(HttpContext context)
        {
            baglanti.Open();
            string a = context.Request.Form["parcaadi"];
            string b = context.Request.Form["modeller"];
            string eklenecek = context.Request.Form["modellertxt"];
            string eklenecek1 = eklenecek;
            int uzunluk=eklenecek1.Split('\r').Length;
            string[] modeluyumu = new string[uzunluk];
            //List<string> modeluyumu = new List<string>();
            modeluyumu=eklenecek.Split('\r');
           
            string parca = modeluyumu[0].Split('*')[0];
            //SqlCommand komut = new SqlCommand("insert into Parcalar (ParcaAdi,Adet,ParcaFiyat,TamirUcreti) values('" + parca + "',0,0,0)");
            SqlCommand komut = new SqlCommand("exec parcaEkle '"+parca+"'");

            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            int outputid = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid > 0);
            SqlCommand komut1 = new SqlCommand("select Top 1 ParcaId From Parcalar order by ParcaId desc");
            komut1.CommandType = CommandType.Text;
            komut1.Connection = baglanti;
            int parcaId=Convert.ToInt32(komut1.ExecuteScalar());
            outputid = Convert.ToInt32(komut1.ExecuteScalar());
            ciktijson.basarili = (outputid > 0);
           
            
            /////
           
            for (int i = 0;i<uzunluk-1; i++)
            {
                string model;
                model = modeluyumu[i].Split('*')[1];
                SqlCommand komut2 = new SqlCommand("select ModelId from Modeller where ModelAdi='" + model + "'");
                komut2.CommandType = CommandType.Text;
                komut2.Connection = baglanti;
                int modelId = Convert.ToInt32(komut2.ExecuteScalar());
                outputid = Convert.ToInt32(komut2.ExecuteScalar());
                ciktijson.basarili = (outputid > 0);
                SqlCommand komut3 = new SqlCommand("insert into Parcalar_Modeller(ParcaId,ModelId)values(" + parcaId + "," + modelId + ") ");
                komut3.CommandType = CommandType.Text;
                komut3.Connection = baglanti;

                int outputid1 = Convert.ToInt32(komut3.ExecuteNonQuery());
                ciktijson.basarili = (outputid1 > 0);

            }
            baglanti.Close();
        }


        public void giris(HttpContext context)
        { 
            string kullaniciadi = context.Request.Form["kullaniciadi"];
            string sifre = context.Request.Form["sifre"];

            baglanti.Open();
            SqlCommand komut = new SqlCommand("select kullanciId from Kullanicilar where KullaniciAdi=@kullaniciadi and Sifre=@sifre ");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            komut.Parameters.AddWithValue("@kullaniciadi", kullaniciadi);
            komut.Parameters.AddWithValue("@sifre", sifre);
            int outputid = Convert.ToInt32(komut.ExecuteScalar());
            ciktijson.basarili = (outputid > 0);
            if (ciktijson.basarili)
            {
                SqlDataReader rdr = komut.ExecuteReader();
                string kullaniciid = "";
                while (rdr.Read())
                {
                    kullaniciid += rdr["kullaniciid"];
                    ciktijson.basarili = true;
                }
                int id;
                id = Convert.ToInt32(kullaniciid);


                context.Session["kullaniciid"] = id.ToString();
                rdr.Close();
            }
            ciktijson.basarili = true;
            
        }
        public void musteriBilgi(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            int id1 = Convert.ToInt32(id);

            SqlCommand komut = new SqlCommand("select * from Musteriler where MusteriId=@id; SELECT SCOPE_IDENTITY();");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            komut.Parameters.AddWithValue("@id", id1);


            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            //komut.Parameters.AddWithValue("@ad", ad);

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();

            baglanti.Close();
        }
        public void musteriSil(HttpContext context)
        {
            
        }
        public void musteriGuncelle(HttpContext context)
        {
            string id = context.Request.Form["id"];
            string ad = context.Request.Form["guncelleAd"];
            string soyad = context.Request.Form["guncelleSoyad"];
            string tc = context.Request.Form["guncelleTc"];
            string tel = context.Request.Form["guncelleTel"];
            string email = context.Request.Form["guncelleEmail"];
            string adres = context.Request.Form["guncelleAdres"];
            int id1 = Convert.ToInt32(id);
            baglanti.Open();
            SqlCommand komut1 = new SqlCommand("update Musteriler set Ad=@ad , Soyad=@soyad , TcKimlikNo=@tc ,  Telefon=@tel , Email=@email , Adres=@adres where MusteriId=@id; SELECT SCOPE_IDENTITY();");
            komut1.CommandType = CommandType.Text;
            komut1.Connection = baglanti;
            //and pcheck=@pcheck and scheck=@scheck
            komut1.Parameters.AddWithValue("@id", id1);
            komut1.Parameters.AddWithValue("@ad", ad);
            komut1.Parameters.AddWithValue("@soyad", soyad);
            komut1.Parameters.AddWithValue("@email", email);
            komut1.Parameters.AddWithValue("@tc", tc);
            komut1.Parameters.AddWithValue("@tel", tel);
            komut1.Parameters.AddWithValue("@adres", adres);

            int outputid = Convert.ToInt32(komut1.ExecuteNonQuery());
            ciktijson.basarili = (outputid > 0);
            //ciktijson.basarili = true;
            ciktijson.mesaj = "Kayıt başarıyla gerçekleştirildi";

            baglanti.Close();
        }
        public void musteriAra(HttpContext context)
        {
            baglanti.Open();
            string tel = context.Request.Form["araTel"];
            SqlCommand komut = new SqlCommand("select * from Musteriler where Telefon=@tel; SELECT SCOPE_IDENTITY();");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            komut.Parameters.AddWithValue("@tel", tel);


            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            //komut.Parameters.AddWithValue("@ad", ad);

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            
            rdr.Close();

            baglanti.Close();
        }
        public void servisKayitGoster(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from ServisKayitlari");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            SqlDataReader rdr = komut.ExecuteReader();
            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
                ciktijson.mesaj = "asdasd";
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }

        public void getCalisan(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select CalisanId,Ad,Soyad,TCKimlikNo,Tel,Adres,Email,CalismaAlani,Statu from Calisanlar C join CalismaAlanlari CA on C.CalismaAlaniId=CA.CalismaAlaniId join Statuler S on S.StatuId=C.StatuId; SELECT SCOPE_IDENTITY();");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void tedarikciBilgi(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];
            SqlCommand komut = new SqlCommand("select * from Tedarikciler where TedarikciId="+Convert.ToInt32(id)+"");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void tedarikciSil(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["id"];

            SqlCommand komut = new SqlCommand("delete from Tedarikciler where TedarikciId=@id");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            komut.Parameters.AddWithValue("@id", id);

            int outputid = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid > 0);

            baglanti.Close();
        }
        public void tedarikciGuncelle(HttpContext context)
        {
            baglanti.Open();
            string id = context.Request.Form["guncelleid"];
            string tedarikci = context.Request.Form["guncelleTedarikci"];
            string email = context.Request.Form["guncelleEmail"];
            string tel = context.Request.Form["guncelletel"];
            string fax = context.Request.Form["guncellefax"];
            string adres = context.Request.Form["guncelleadres"];

            SqlCommand komut = new SqlCommand("update Tedarikciler set TedarikciAdi='"+tedarikci+"',Tel='"+tel+"',Fax='"+fax+"',Adres='"+adres+"',Email='"+email+"' where TedarikciId="+Convert.ToUInt32(id)+"");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;
            int outputid = Convert.ToInt32(komut.ExecuteNonQuery());
            ciktijson.basarili = (outputid > 0);
            baglanti.Close();
        }
        public void getTedarikci(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from Tedarikciler");
            komut.CommandType = CommandType.Text;
            komut.Connection=baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();

            baglanti.Close();
        }

        public void uygunParcalar(HttpContext context)
        {
            baglanti.Open();
            string plaka = context.Request.Form["plaka"];
            SqlCommand komut = new SqlCommand("select P.ParcaId,ParcaAdi  from Parcalar P join Parcalar_Modeller PM on P.ParcaId=PM.ParcaId join Arabalar A on A.ModelId=PM.ModelId where Plaka='"+plaka+"'");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        public void getParca1(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select ParcaId,ParcaAdi from Parcalar");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
    

        public void getParca(HttpContext context)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select ParcaId,ParcaAdi,Adet,KullanilabilirYil,ParcaFiyat,TamirUcreti from Parcalar");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();
            baglanti.Close();
        }
        
        // context.Response.Redirect("tarifler.aspx");
        //            ciktijson.id= MD5Sifrele(kullaniciid);
        //if (rdr.HasRows)
        //{
        //    var r = Serialize(rdr);
        //    ciktijson.data = r;
        //    ciktijson.basarili = true;

        //}

        //else
        //{
        //    ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
        //}

        /////



        //public static string MD5Sifrele(string metin)
        //{
        //    // MD5CryptoServiceProvider nesnenin yeni bir instance'sını oluşturalım.
        //    MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

        //    //Girilen veriyi bir byte dizisine dönüştürelim ve hash hesaplamasını yapalım.
        //    byte[] btr = Encoding.UTF8.GetBytes(metin);
        //    btr = md5.ComputeHash(btr);

        //    //byte'ları biriktirmek için yeni bir StringBuilder ve string oluşturalım.
        //    StringBuilder sb = new StringBuilder();


        //    //hash yapılmış her bir byte'ı dizi içinden alalım ve her birini hexadecimal string olarak formatlayalım.
        //    foreach (byte ba in btr)
        //    {
        //        sb.Append(ba.ToString("x2").ToLower());
        //    }

        //    //hexadecimal(onaltılık) stringi geri döndürelim.
        //    return sb.ToString();
        //}
        public void kullanicitarif(HttpContext context)
        {
            baglanti.Open();

            SqlCommand komut1 = new SqlCommand("select * from yemeklertbl where yemekid= select yemek from defterlertbl where gorecekid=" + Convert.ToInt32(context.Session["kullaniciid"]) + " ");
            komut1.CommandType = CommandType.Text;
            komut1.Connection = baglanti;

            SqlDataReader rdr = komut1.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();




            baglanti.Close();
        }
        public void idTasi(HttpContext context)
        {
            string yemekid = context.Request.Form["id"];
            context.Session["yemek"] = yemekid;
        }

        public void tarifibul(HttpContext context)
        {
            baglanti.Open();

            SqlCommand komut = new SqlCommand("select * from yemeklertbl where yemekid=" + Convert.ToInt32(context.Session["yemek"]) + "");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            //komut.Parameters.AddWithValue("@ad", ad);

            SqlDataReader rdr = komut.ExecuteReader();

            if (rdr.HasRows)
            {
                var r = Serialize(rdr);
                ciktijson.data = r;
                ciktijson.basarili = true;
            }
            else
            {
                ciktijson.mesaj = "Henüz hiçbir kayıt bulunamadı...";
            }

            /////
            rdr.Close();




            baglanti.Close();
        }

        public void kaydol(HttpContext context)
        {
            baglanti.Open();

            string adsoyad = context.Request.Form["adsoyad"];
            string kullaniciadi = context.Request.Form["kullaniciadi"];
            string email = context.Request.Form["email"];
            string sifre = context.Request.Form["sifre"];

            SqlCommand komut = new SqlCommand("insert into kullanicilartbl(adsoyad, kullaniciadi, email, sifre) values(@adsoyad, @kullaniciadi, @email, @sifre);  SELECT SCOPE_IDENTITY();");
            komut.CommandType = CommandType.Text;
            komut.Connection = baglanti;

            komut.Parameters.AddWithValue("@adsoyad", adsoyad);
            komut.Parameters.AddWithValue("@kullaniciadi", kullaniciadi);
            komut.Parameters.AddWithValue("@email", email);
            komut.Parameters.AddWithValue("@sifre", sifre);



            int outputid1 = Convert.ToInt32(komut.ExecuteScalar());
            ciktijson.basarili = (outputid1 > 0);


            baglanti.Close();
        }

        public IEnumerable<Dictionary<string, object>> Serialize(SqlDataReader reader)
        {
            var results = new List<Dictionary<string, object>>();
            var cols = new List<string>();
            for (int i = 0; i < reader.FieldCount; i++)
            {
                cols.Add(reader.GetName(i));

            }

            while (reader.Read())
            {
                results.Add(SerializeRow(cols, reader));

            }
            return results;
        }

        public Dictionary<string, object> SerializeRow(IEnumerable<string> cols, SqlDataReader reader)
        {
            var results = new Dictionary<string, object>();
            foreach (var col in cols)
            {
                results.Add(col, reader[col]);
            }
            return results;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}