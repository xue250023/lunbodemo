import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, SliderGalleryControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let identifer:[String] = [
                    "imageCell"
                ]
                let id = identifer[indexPath.item]
                let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
                return cell
    }
    //Mark:设置高度
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.item {
        case 0 :
            return 360
        default:
            return 0
        }
    }
    
    //获取屏幕宽度
    let screenWidth =  UIScreen.main.bounds.size.width

    //图片轮播组件
    var sliderGallery : SliderGalleryController!

    //图片集合
    var images = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593665767162&di=c1020f64d786a325a67ee879e3ac9e5d&imgtype=0&src=http%3A%2F%2Fimg.app178.com%2Ftu%2F201410%2Fyhrgcry32t4.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593665767162&di=d006cd9610c46120b1aabe234ab4812c&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201401%2F22%2F134002dhye9qe2g2nq2geu.jpg",
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593665767161&di=3725ac75d78e2823033bb54bdf33e3ea&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20170330%2F20170330044723_a0c69f758cc90e87e8c8e620eb55308e_2.jpeg",
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593665767160&di=73123c4ec1a7def8d911d815147d385c&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201312%2F03%2F165620x7cknad7vruvec1z.jpg",
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593665767159&di=1bf25e664df31768dc4010fabb44d4e2&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F54fbb2fb43166d22d552b941432309f79052d23a.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: set Datasource
        self.tableView.dataSource = self
        self.tableView.delegate = self
      
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 10, y: 40, width: screenWidth,
                                          height: (screenWidth-20)/4*3);
        //将图片轮播组件添加到当前视图
        self.addChild(sliderGallery)
        tableView.tableHeaderView =  sliderGallery.view
    }
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: screenWidth-20, height: (screenWidth-20)/4*3)
    }

    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [String] {
        return images
    }


 
}

 //定义ImageClass
class ImageCell: UITableViewCell {

}
