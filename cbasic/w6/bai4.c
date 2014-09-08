/* Thong tin ve 1 dien thoai gom co: */
/* Ten dien thoai la xau toi da 30 ky tu (Nokia5530) */
/* Gia dien thoai kieu long */
/* Danh gia thang diem 10, kieu so thuc */
/* Viet chuong trinh co giao dien menu thuc hien */
/*      Chon 1. Cho phep nhap tu ban phim thong tin dien thoai, cho toi khi ten dien thoai la $$$ thi stop. Luu toan bo thong tin dien thoai ra file nhi phan (khong su dung mang de luu tru o buoc nay) */
/*      Chon 2. Doc lai file nhi phan va luu vao 1 mang */
/*      Chon 3. Sap xep mang theo thu tu tang dan cua ten dien thoai */
/*      Chon 4. Nhap vao 1 ten can tim, in ra gia va diem danh gia dien thoai do. Thuc hien tim kiem tuan tu va nhi phan */
/*      Chon 5. Ket thuc */


#include "phone.h"

int main()
{
  PhoneInfo phoneList[MAXLENGTH];
  char name[MAXLENGTH];
  long int price;
  float rating;
  char str[MAXLENGTH];
  char *ptr;
  int flag = 0;
  int i = 0;
  int j;
  FILE *f;
  char filename[] = "phone.dat";

  if((f = fopen(filename, "a+b")) == NULL)
    {
      printf("Khong mo duoc file %s!\n", filename);
      return 1;
    }
  
  char ch;
  while(1)
    {
      ch = menu();
      switch(ch)
	{
	case '1':
	  printf("\nBan chon 1\n");
	  nhapThongTin(f);
	  continue;
	case '2':
	  printf("\nBan chon 2\n");
	  printf("Pending...\n");
	  while(!feof(f))
	    {
	      fgets(name, MAXLENGTH, f);
	      fscanf(f, "%li\t%f\n", &price, &rating);
	      name[strlen(name)-1]='\0';
	      strcpy(phoneList[i].name, name);
	      phoneList[i].price = price;
	      phoneList[i].rating = rating;
	      i++;
	    }
	  printf("Da doc xong!\n");
	  printf("Danh sach cac phan tu trong mang:\n");
	  for(j=0;j<i;j++) printf("Dien thoai: %s\nGia tien: %li\nRating: %f\n\n", phoneList[j].name, phoneList[j].price, phoneList[j].rating);
	  continue;
	case '3':
	  printf("\nBan chon 3\n");
	  sortPhoneName(phoneList, i);
	  for(j=0;j<i;j++) printf("Dien thoai: %s\nGia tien: %li\nRating: %f\n\n", phoneList[j].name, phoneList[j].price, phoneList[j].rating);
	  continue;
	case '4':
	  printf("\nBan chon 4\n");
	  printf("Hay nhap ten dien thoai ban muon tim: "); gets(str);
	  printf("\nDanh sach cac dien thoai co ten la %s:\n", str);
	  for(j=0;j<i;j++)
	    {
	      if(strcmp(phoneList[j].name, str) == 0) 
		{
		  printf("Dien thoai: %s\nGia tien: %li\nRating: %f\n\n", phoneList[j].name, phoneList[j].price, phoneList[j].rating);
		  flag = 1;
		}
	    }
	  if(flag == 0) printf("Khong co dien thoai ban can tim!\n");
	  flag = 0;
	  continue;
	case '5':
	  printf("\nBan chon 5\nChuong trinh ket thuc!\nClosing...\n");
	  break;
	default:
	  printf("\nBan da nhap sai lua chon (Chi chon tu 1 toi 5), xin vui long chon lai!\n");
	  continue;
	}
      break;
    }
  

  fclose(f);
  return 0;
}