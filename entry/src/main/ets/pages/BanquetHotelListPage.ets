// 宴会厅酒店
import router from '@ohos.router';

class BanquetHotelClass {
  id: string = '';  // 酒店id
  hotelName: string = '';  // 酒店名称
  hotelAddress: string = '';  // 酒店地址
  displayImg: ResourceStr = '';  // 酒店图片
  maxArea: string = '';   // 酒店面积
  maxCapacity: string = '';  // 可容纳人数
  distance: string = ''; // 距离

  constructor(id: string, hotelName: string, hotelAddress: string, displayImg: ResourceStr, maxArea: string, maxCapacity: string, distance: string) {
    this.id = id;
    this.hotelName = hotelName;
    this.hotelAddress = hotelAddress;
    this.displayImg = displayImg;
    this.maxArea = maxArea;
    this.maxCapacity = maxCapacity;
    this.distance = distance;
  }
}

@Entry
@Component
struct BanquetHotelListPage {
  @State banquetHotelList: Array<BanquetHotelClass> = [
    new BanquetHotelClass('1', '舜和国际酒店', '济南市经十路26008号（近济南西站）', $r('app.media.banquetHotel1'), '1300㎡', '1200人', '559.6km'),
    new BanquetHotelClass('2', '山东舜和酒店', '山东省济南市历下区泺源大街53号', $r('app.media.banquetHotel2'), '200㎡', '140人', '557.3km'),
    new BanquetHotelClass('3', '舜和国际酒店天禧店', '山东省济南市中区经十纬五路133号', $r('app.media.banquetHotel3'), '200㎡', '140人', '380.1km'),
    new BanquetHotelClass('4', '舜和枣庄大酒店', '山东省枣庄市中区解放北路139号', $r('app.media.banquetHotel4'), '300㎡', '240人', '100.3km'),
    new BanquetHotelClass('5', '舜和海鲜（天发店）', '山东省济南市天桥区堤口路31号（靠近火车站）', $r('app.media.banquetHotel5'), '280㎡', '160人', '400km'),
    new BanquetHotelClass('6', '舜和国际酒店(南京店）', '江苏省南京市', $r('app.media.banquetHotel6'), '1300㎡', '1200人', '20km'),
  ];

  build() {
    Column(){
      Navigation() {
        Scroll() {
          Column() {
            List({ space: 12 }) {
              ForEach(this.banquetHotelList, (item: BanquetHotelClass) => {
                ListItem() {
                  BanquetHotelItem({ banquetHotelItem: item })
                }
              }, (item: BanquetHotelClass) => item.id)
            }
            .scrollBar(BarState.Off)
            .padding({ left: 16, right: 16 })
          }
          .margin({ top: 18, bottom: 20 })
          .alignItems(HorizontalAlign.Start)
        }
      }
      .title(this.NavigationTitle)
      .titleMode(NavigationTitleMode.Mini)
      .hideTitleBar(false)
    }
    .height('100%')
    .width('100%')
  }

  @Builder NavigationTitle() {
    Stack() {
      Text('婚宴预订')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .margin({top: 16})
  }
}

@Component
struct BanquetHotelItem {
  @Prop banquetHotelItem: BanquetHotelClass;

  build() {
    Column() {
      Image(this.banquetHotelItem.displayImg)
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(150)
        .borderRadius(10)
      Row() {
        Text(this.banquetHotelItem.hotelName)
          .fontSize(18)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Blank()
        Text(this.banquetHotelItem.distance)
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .margin({ top: 8})
      .padding({left: 8, right: 15})
      Row(){
        Image($r('app.media.pos_icon'))
          .height(30)
          .width(30)
        Text(this.banquetHotelItem.hotelAddress)
          .fontSize(12)
          .fontColor(Color.Gray)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      Row() {
        Text(this.banquetHotelItem.maxCapacity)
          .styleBorder()
        Text(this.banquetHotelItem.maxArea)
          .styleBorder()
        Blank()
        Row(){
          Text('即刻预定')
            .fontSize(15)
          Image($r('app.media.arrow_right'))
            .height(20)
            .width(20)
        }
        .onClick(()=>{
          router.pushUrl({url: 'pages/BanquetListPage'})
        })

      }
      .width('100%')
      .padding({right: 8})

    }
    .height('245')
  }
}

@Extend(Text)
function styleBorder() {
  .textAlign(TextAlign.Center)
  .fontSize(10)
  .border({ width: 1, color: Color.Gray })
  .padding(3)
  .width(45)
  .margin({left: 8})
}