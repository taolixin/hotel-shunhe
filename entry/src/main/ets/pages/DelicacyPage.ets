// 商户信息
class ShopInfo {
  shopId: string = ''; //商户id
  shopName: string = '';  //商户名称
  image: ResourceStr | string = '';  //展示图片
  address: string = '';  //酒店地址
  distance: string = ''; //距离

  constructor(shopId: string, shopName: string, image: ResourceStr, address: string, distance: string) {
    this.shopId = shopId;
    this.shopName = shopName;
    this.image = image;
    this.address = address;
    this.distance = distance;
  }
}

// 套餐
class Package {
  image: ResourceStr = ''; //套餐图片
  monthlySell: string = ''; // 月售
  discountedPrice: string = ''; //折扣价
  price: string = ''; //原价
  packageName: string = ''; //套餐名称
  id: string = '';

  constructor(id: string, packageName: string, price: string, discountedPrice: string, monthlySell: string, image: ResourceStr) {
    this.id = id;
    this.packageName = packageName;
    this.price = price;
    this.discountedPrice = discountedPrice;
    this.monthlySell = monthlySell;
    this.image = image;
  }
}

// 美食信息
class PackageInfo {
  shopMonthlySell: string = ''; // 已售数量
  packages: Package[] = [];  //套餐列表信息

  constructor(shopMonthlySell: string, packages: Package[]) {
    this.shopMonthlySell = shopMonthlySell;
    this.packages = packages;
  }
}

class DelicacyClass {
  shopInfo: ShopInfo = new ShopInfo('', '', '', '', '');
  packageInfo: PackageInfo = new PackageInfo('', []);

  constructor(shopInfo: ShopInfo, packageInfo: PackageInfo) {
    this.shopInfo = shopInfo;
    this.packageInfo = packageInfo;
  }
}

@Entry
@Component
struct DelicacyPage {
  @State delicacyList: Array<DelicacyClass> = [
    new DelicacyClass(new ShopInfo('1', '舜和国际酒店（济南店）', $r('app.media.delicacy_shop1'), '济南市经十路26008号', '558.7km'),
      new PackageInfo('652', [
        new Package('11', '巴西烤肉单人自助餐', '139', '132', '50', $r('app.media.delicacy_shop1_pkg1')),
        new Package('12', '特惠双人自助餐', '278', '256', '150', $r('app.media.delicacy_shop1_pkg2')),
        new Package('13', '超值家庭票（2大1小）', '348', '286', '152', $r('app.media.delicacy_shop1_pkg3')),
        new Package('14', '龙年好运四人餐', '641', '299', '300', $r('app.media.delicacy_shop1_pkg4')),
      ])
    ),

    new DelicacyClass(new ShopInfo('2', '舜和大酒店（天禧店）', $r('app.media.delicacy_shop2'), '济南市市中区经十纬五路133号', '557.3km'),
      new PackageInfo('498', [
        new Package('21', '精致海鲜8-10人餐', '2195', '1699', '98', $r('app.media.delicacy_shop2_pkg1')),
        new Package('22', '超值钜惠双人餐', '297', '199', '100', $r('app.media.delicacy_shop2_pkg2')),
        new Package('23', '鲍鱼大虾六人套餐', '1427', '499', '120', $r('app.media.delicacy_shop2_pkg3')),
        new Package('24', '波士顿龙虾6-8人餐', '946', '799', '180', $r('app.media.delicacy_shop2_pkg4')),
      ])
    ),

    new DelicacyClass(new ShopInfo('3', '舜和大酒店（动物园店）', $r('app.media.delicacy_shop3'), '济南市十纬五路188号', '555.1km'),
      new PackageInfo('399', [
        new Package('31', '龙虾鲍鱼8-10人餐', '2230', '1399', '99', $r('app.media.delicacy_shop3_pkg1')),
        new Package('32', '庆典10人套餐', '1200', '888', '180', $r('app.media.delicacy_shop3_pkg2')),
        new Package('33', '店庆套餐', '400', '100', '120', $r('app.media.delicacy_shop3_pkg3')),
      ])
    ),

  ];

  build() {
    Column() {
      Navigation(){
        // Scanner
        Image($r('app.media.delicacy_banner'))
          .width('100%')

        Scroll() {
          Column() {
            List() {
              ForEach(this.delicacyList, (item: DelicacyClass) => {
                ListItem() {
                  DelicacyItem({ delicacyItem: item })
                }
              }, (item: DelicacyClass) => item.shopInfo.shopId)
            }
            .scrollBar(BarState.Off)
            .padding({ left: 16})
          }
          .alignItems(HorizontalAlign.Start)
          .width('100%')
          .margin({top: 16, bottom: 130})
        }
      }
      .title(this.NavigationTitle)
      .titleMode(NavigationTitleMode.Mini)
      .hideTitleBar(false)
    }
    .width('100%')
    .backgroundColor('#F1F3F5')
  }

  @Builder NavigationTitle() {
    Stack() {
      Text('舜和餐厅')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .margin({top: 16})
  }
}

@Component
struct DelicacyItem {
  @Prop delicacyItem: DelicacyClass;
  build() {
    Column(){
      // store message
      Row(){
        Image(this.delicacyItem.shopInfo.image)
          .width(50) //图片尺寸
          .height(50) //图片尺寸
          .objectFit(ImageFit.Fill) //图片完整填充(不保持原图片宽高比)
          .borderRadius(12) //圆角

        Column() {
          Text(this.delicacyItem.shopInfo.shopName)
            .fontSize(14) //中等文字大小
            .fontWeight(FontWeight.Bold) //加粗
          Text(this.delicacyItem.shopInfo.address)
            .fontColor('#182431') //通用文字颜色 , 淡灰色
            .opacity(0.6) //通用透明度
            .fontSize(10) //小号字体
            .margin({ top: 12 }) //指定上外间距:通用外间距
        }
        .margin({ left: 12 })//左侧间距
        .alignItems(HorizontalAlign.Start) //文字左对齐

        Blank()
        Column() {
          Text(this.delicacyItem.shopInfo.distance)
            .fontSize(14) //中等文字大小
            .fontWeight(FontWeight.Bold) //加粗
          Text(`月销 ${this.delicacyItem.packageInfo.shopMonthlySell} +`)
            .fontColor('#182431') //通用文字颜色 , 淡灰色
            .opacity(0.6) //通用透明度
            .fontSize(10) //小号字体
            .margin({ top: 12 }) //指定上外间距:通用外间距
        }
        .alignItems(HorizontalAlign.End) //文字左对齐
      }
      .width('100%')

      Column() {
        PackageView({packages: this.delicacyItem.packageInfo.packages})
      }
      .width('100%')
      .height(80)
      .margin({ top: 12 })
    }
    .width('95%')
    .height(230)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .padding({top: 8, left: 12, right:12})
    .margin({bottom:16})
  }
}

@Component
struct PackageView{
  @Prop packages: Package[];

  build() {
    Column() {
      Grid() {
        ForEach(this.packages, (item: Package) => {
          GridItem() {
            PackageItem({ packageItem: item })
          }
        }, (item: Package) => item.id)
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
    }
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct PackageItem {
  @Prop packageItem: Package;

  build() {
    Column() {
      Stack() {
        Image(this.packageItem.image)
          .width('100%')
          .objectFit(ImageFit.Cover)
          .height(96)
          .borderRadius(16)
        Text(`月销 ${this.packageItem.monthlySell}+`)
          .padding({top:3, left: 15, right: 15, bottom: 3})
          .backgroundColor(Color.Black)
          .opacity(0.6)
          .borderRadius(16)
          .fontColor(Color.White)
          .fontSize(12)
          .margin({left: 8, bottom: 8})
      }
      .width('100%')
      .alignContent(Alignment.BottomStart)

      Text(this.packageItem.packageName)
        .height(19)
        .width('100%')
        .fontSize(13)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .margin({ top: 8, left: 8})
      Row() {
        Text(`￥ ${this.packageItem.discountedPrice} `)
          .height(32)
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor(Color.Red)
        Text(`￥ ${this.packageItem.price} `)
          .height(32)
          .fontSize(10)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor(Color.Gray)
          .decoration({
            type: TextDecorationType.LineThrough,
            color: Color.Gray
          })

      }
      .margin({ top: 2 })
      .width('100%')
    }
    .width(160)
    .height(169)
  }
}