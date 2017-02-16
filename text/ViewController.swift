//内购Demo，看代码说话吧
import UIKit
import StoreKit
class ViewController:UIViewController,SKPaymentTransactionObserver,SKProductsRequestDelegate{
    var  product = ""
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blue
        super.viewDidLoad()
        SKPaymentQueue.default().add(self)
        buy(type: 2)
    }
    func buy(type:Int){
        if SKPaymentQueue.canMakePayments() {
            print("允许内购")
            product = "cn.okek.ichexingwuyou.month_1_2"
            let set = NSSet.init(array: [product])
            let request = SKProductsRequest.init(productIdentifiers: set as! Set<String>)
            request.delegate = self
            request.start()
        }else{
            print("不允许程序内购购买")
        }
    }
    
    func requestProductData(){
        product = "cn.okek.ichexingwuyou.month_1_2"
        let set = NSSet.init(array: [product])
        let request = SKProductsRequest.init(productIdentifiers: set as! Set<String>)
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print(response.products)
        let res = response.products
        print(res.description)
        for payments in res {
             let payment = SKPayment.init(product:payments )
            SKPaymentQueue.default().add(payment)
        }
       
    }
    func request(_ request: SKRequest, didFailWithError error: Error) {
        
    }
    func requestDidFinish(_ request: SKRequest) {
        
    }
    //SKPaymentTransactionObserver
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {//交易结果
        
        
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
