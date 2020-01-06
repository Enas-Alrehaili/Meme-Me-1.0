//
//  MemeCollectionVC.swift
//  Memeef
//
//  Created by Enas Alrehaili on 2019-10-25.
//  Copyright © 2019 Enas Alrehaili. All rights reserved.
//
import Foundation
import UIKit

class MemeCollectionVC: UICollectionViewController  {

    var memes : [Meme] {
        
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        collectionView.reloadData()
           
       }
       override func viewDidLoad(){
        super.viewDidLoad()
       }
    
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
       
       }

 override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
    let meme = memes[indexPath.row]
    cell.MemeImageView?.image = meme.memedImage
    return cell
   }
    
  /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let lenght = (collectionView.bounds.size.width - 20) / 3
           return CGSize(width: lenght, height: lenght)
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimunInteritemSpacingForSectionAt  section: Int) -> CGFloat {
           return 10
       }*/

   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let meme = memes[indexPath.row]
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let detailController = storyboard.instantiateViewController(withIdentifier: "detailController") as! MemeDetailsVC
        detailController.meme = meme
        self.navigationController?.pushViewController(detailController, animated: true)
       }

}
