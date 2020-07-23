
import UIKit




class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playStopButton.setTitle("再生", for: .normal)
        }
        
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.x = UIImage(named: imageNameArray[imageNum])!
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    var imageNum = 0
    var timer: Timer!
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    
    // 画像の名前の配列
    let imageNameArray = ["japan1.jpg", "japan2.jpg", "japan3.jpg", "japan4.jpg", "japan5.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "japan1.jpg")
        imageview.image = image
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.tapped(_:)))
        
        tapGesture.delegate = self
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(tapGesture)
    }
    
    // 進むボタン
    @IBAction func next(_ sender: Any) {
        // インデックス番号をプラス１
        imageNum += 1
        // imageNumが５になったら、０に戻す
        if imageNum == 5 {
            imageNum = 0
            imageview.image = UIImage(named: imageNameArray[imageNum])
        } else {
            imageview.image = UIImage(named: imageNameArray[imageNum])
        }
    }
    
    // 戻るボタン
    @IBAction func back(_ sender: Any) {
        imageNum -= 1
        
        if imageNum == -1 {
            imageNum = 4
            imageview.image = UIImage(named: imageNameArray[imageNum])
        } else {
            imageview.image = UIImage(named: imageNameArray[imageNum])
        }
    }
    
    // 再生、停止ボタン
    @IBAction func playStopButton(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            // 進むボタンと戻るボタンをタップでき流ようにする
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンの文字を再生に変更
            playStopButton.setTitle("再生", for: .normal)
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoPlay(_:)), userInfo: nil, repeats: true)
            // 進むボタンと戻るボタンをタップできないようにする
            nextButton.isEnabled = false
            backButton.isEnabled = false
            // ボタンの文字を停止に変更
            playStopButton.setTitle("停止", for: .normal)
        }
    }
    
    // タイマーで呼び出す処理
    @objc func autoPlay(_ timer: Timer) {
        imageNum += 1
        if imageNum == 5 {
            imageNum = 0
            imageview.image = UIImage(named: imageNameArray[imageNum])
        } else {
            imageview.image = UIImage(named: imageNameArray[imageNum])
        }
    }
    
    // 画像がタップされたら呼ばれる処理
    @objc func tapped(_ sender: UITapGestureRecognizer){
        print("画像がタップ")
        // 画面遷移の処理と、次の画面に画像を渡す処理
    }
}

