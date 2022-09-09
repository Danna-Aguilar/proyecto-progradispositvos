//
//  ViewController.swift
//  PROEYCTO
//
//  Created by Alumno on 05/09/22.
//  Copyright © 2022 Sebastian Encinas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //reproductor
    var reproductorDrinks : AVAudioPlayer?
    var url_coffe : URL?
    var url_juice : URL?
    var url_soft : URL?
    var secuenciaCoffe1 : [UIImage] = []
    var secuenciaJuice1: [UIImage] = []
    var secuenciaCoca1: [UIImage] = []
    var secuenciaArriba : [UIImage] = []

    @IBOutlet weak var imgArriba: UIImageView!
    @IBOutlet weak var lblSeleccion: UILabel!
    @IBOutlet weak var imgCoffe: UIImageView!
    @IBOutlet weak var imgJuice: UIImageView!
    @IBOutlet weak var imgCoca: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //configurar reproduccion
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            print(error.localizedDescription)
        }
        //OBTENER URL DEL AUDIO
        url_coffe = Bundle.main.url(forResource: "coffe", withExtension : "mp3")
        
        url_juice = Bundle.main.url(forResource: "Juice", withExtension : "mp3")
        
        url_soft = Bundle.main.url(forResource: "soft drink", withExtension : "mp3")
        
        for i in 1...5 {
            let imagen = UIImage(named: "COFFE_\(i)")
            secuenciaCoffe1.append(imagen!)
        }
        for i in 1...5 {
            let imagen = UIImage(named: "JUGO_\(i)")
            secuenciaJuice1.append(imagen!)
        }
        for i in 1...5 {
            let imagen = UIImage(named: "COCA_\(i)")
            secuenciaCoca1.append(imagen!)
        }
        
        //establecer la secuencia al image view
        imgCoffe.animationImages = secuenciaCoffe1
        imgCoffe.animationDuration = 1
        imgCoffe.startAnimating()
        
        imgJuice.animationImages = secuenciaJuice1
        imgJuice.animationDuration = 1
        imgJuice.startAnimating()
        
        imgCoca.animationImages = secuenciaCoca1
        imgCoca.animationDuration = 1
        imgCoca.startAnimating()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doTapCoffer(_ sender: Any) {
        lblSeleccion.text = "Coffe"
        do {
            reproductorDrinks = try AVAudioPlayer(contentsOf: url_coffe!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorDrinks?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        secuenciaArriba = []
        for i in 1...5 {
            let imagen = UIImage(named: "COFFE.2.\(i)")
            secuenciaArriba.append(imagen!)
        }
        
        //establecer la secuencia al image view
        imgArriba.animationImages = secuenciaArriba
        imgArriba.animationDuration = 2.0
        imgArriba.startAnimating()
        
        
    }
    @IBAction func doTapJuice(_ sender: Any) {
        lblSeleccion.text = "Juice"
        do {
            reproductorDrinks = try AVAudioPlayer(contentsOf: url_juice!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorDrinks?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        secuenciaArriba = []

        for i in 1...5 {
            let imagen = UIImage(named: "JUGO.2.\(i)")
            secuenciaArriba.append(imagen!)
        }
        
        //establecer la secuencia al image view
        imgArriba.animationImages = secuenciaArriba
        imgArriba.animationDuration = 2.0
        imgArriba.startAnimating()
    }
    
    @IBAction func doTapCoca(_ sender: Any) {
        lblSeleccion.text = "Soft Drink"
        do {
            reproductorDrinks = try AVAudioPlayer(contentsOf: url_soft!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductorDrinks?.play()
        }catch let error {
            print(error.localizedDescription)
        }
        secuenciaArriba = []

        for i in 1...5 {
            let imagen = UIImage(named: "COCA.2.\(i)")
            secuenciaArriba.append(imagen!)
        }
        
        //establecer la secuencia al image view
        imgArriba.animationImages = secuenciaArriba
        imgArriba.animationDuration = 2.0
        imgArriba.startAnimating()
        
    }
}

