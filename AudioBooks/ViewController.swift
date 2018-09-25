//
//  ViewController.swift
//  AudioBooks
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Kingfisher
protocol DetailsAudioDelegate: class {
    func showWebView(_ audio: AudioDTO)
}
class ViewController: UIViewController {
    weak var delegate: DetailsAudioDelegate!
    @IBOutlet weak var audioCollectionView: UICollectionView!
    var audioBooks: [AudioDTO] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initView()
        register()
        getDataFromServer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView() {
        navigationController?.navigationBar.isHidden = true
    }
    func getDataFromServer() {
        let audioService = AudioBooksService()
        audioService.audioBooksRequest { (data, error) in
            if let error = error {
                if error.isEmpty {
                    
                }
            } else {
                if let data = data {
                    self.audioBooks = data
                    self.audioCollectionView.reloadData()
                }
            }
        }
    }
    func register() {
        audioCollectionView.register(UINib(nibName: "AudioCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AudioCollectionViewCell")
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return audioBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: AudioCollectionViewCell = audioCollectionView.dequeueReusableCell(withReuseIdentifier: "AudioCollectionViewCell", for: indexPath) as? AudioCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.artistName.text = audioBooks[indexPath.row].artistName
        cell.genresName.text = audioBooks[indexPath.row].genres[0].name
        let urlImage = URL(string: audioBooks[indexPath.row].artworkUrl100)
        cell.artistImage.kf.setImage(with: urlImage)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsAudioVC = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        navigationController?.pushViewController(detailsAudioVC, animated: true)
    }
}

