import std.stdio;
import std.process;
import std.string;
import std.array;

void main()
{
	//int secim = 0;
	
	do
	{
		MenuGoster();
	
		write("Seciminiz [1/2/3/4/5]: ");
		readf(" %s", &secim);
		
		// Menü seçimi için basılan enter \n tuşunu yoket.
		//chomp(readln());
		
		IslemYap(secim);
		
	} while (secim != 5)
}

void YeniKayitEkle()
{
	system("CLS");
	
	write("Isim : ");
	string kisiIsim = chomp(readln());
		
	write("Soyisim : ");
	string kisiSoyisim = chomp(readln());
	
	write("Telefon : ");
	string kisiTelefon = chomp(readln());
	
	
	File dosya = File("TelefonDefteri.txt", "a");
	
	dosya.writeln(kisiIsim, " ", kisiSoyisim, " | ", kisiTelefon);
	
	writeln("\nBilgiler dosyaya kaydedildi.");
	system("PAUSE");
}

void KayitDuzenleListe()
{
	system("CLS");
	File dosya = File("TelefonDefteri.txt", "r");
	
	int siraNo = 1;
	while (!dosya.eof)
	{
		string satir = dosya.readln();

		write("[", siraNo, "] ", satir);
		
		siraNo++;
	}
}

void KayitDuzenle()
{
	//KayitDuzenleListe();
	
	//int kayitNo;
	//write("\n\nDuzenlenecek kayit numarasini girin : ");
	//readf(" %s", &kayitNo);
	
	File dosya = File("TelefonDefteri.txt", "r");
	
	int siraNo = 1;
	while (!dosya.eof)
	{
		string satir = dosya.readln();
		write("[", siraNo, "] ", satir);
		siraNo++;
	}
	
	system("PAUSE");
}

void KayitSil()
{
	system("CLS");
	/*
	File dosya = File("TelefonDefteri", "w");
	
	dosya.writeln("Zafer");
	dosya.writeln("5438529674");
	*/
	writeln("\nBilgiler silindi.");
	system("PAUSE");
}

void KayitListele()
{
	system("CLS");
	File dosya = File("TelefonDefteri.txt", "r");
	
	int siraNo = 1;
	while (!dosya.eof)
	{
		string satir = dosya.readln();

		write(siraNo, ".", satir);
		
		siraNo++;
	}
	
	writeln("\n\nBilgiler listelendi.");
	system("PAUSE");
}

void IslemYap(int islem)
{
	switch(islem)
	{
		case 1:
			YeniKayitEkle();
			break;
			
		case 2:
			KayitDuzenle();
			break;
			
		case 3:
			KayitSil();
			break;
			
		case 4:
			KayitListele();
			break;
			
		case 5:
			//ProgramiKapat();
			break;
			
		default:
			writeln("\nLutfen 1..5 arasinda bir secenek secin.");
			break;
	}
}

void MenuGoster()
{
	system("cls");
	writeln("===== D Telefon Defteri =====\n");
	writeln("Yeni Kayit Ekle.........: 1");
	writeln("Kayit Duzenle...........: 2");
	writeln("Kayit Sil...............: 3");
	writeln("Kayit Listele...........: 4");
	writeln("Programi Kapat..........: 5");
	writeln();
}
