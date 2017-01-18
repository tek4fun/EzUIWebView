//
//  ViewBook.swift
//  EzUIWebView
//
//  Created by iOS Student on 1/16/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class ViewBooks: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    var type : String!
//    var booksPDF = [String]()
//    var booksHTML = [String]()
//    var booksDocx = [String]()
    var booksAll = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        type = self.tabBarItem.title!
        listWithFilter()
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count: Int!

        switch type {
        case "PDF":
            count = counter(ext: ".pdf")
        case "DOCX":
            count = counter(ext: ".docx")
        case "HTML":
            count = counter(ext: ".html")
        case "All":
            count = booksAll.count
        default:
            break
        }
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as! ACellBook
        let book: NSString = booksAll[indexPath.item] as NSString //book's name in BooksAll with extension
        let nameLabel = book.deletingPathExtension //book's name in BooksAll without extension
        let thubImg = UIImage(named:(nameLabel+(".jpg")))
        cell.imageView.image = thubImg
        cell.nameLabel.text = nameLabel
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewDetailBook = self.storyboard?.instantiateViewController(withIdentifier: "DetailBook") as! DetailBook
        let urlString = booksAll[indexPath.item]
        viewDetailBook.urlString = urlString as NSString
        viewDetailBook.type = type
        viewDetailBook.type = self.tabBarItem.title!
        self.navigationController!.pushViewController(viewDetailBook, animated: true)
    }

    func counter (ext:String) -> Int {
        var count: Int = 0
        for element in booksAll {
            if (element.contains(ext)){
                count+=1
            }
        }
        print(count)
        return count
    }

    func listWithFilter () {

        do {
            // if you want to filter the directory contents you can do like this:
            let directoryUrls = try? FileManager.default.contentsOfDirectory(at:URL(fileURLWithPath: "/Users/iosstudent/Downloads/MyBooks/MyBooks/Source/books"), includingPropertiesForKeys: nil, options: [])
            //let docxFiles = directoryUrls?.filter{ $0.pathExtension == "docx" || $0.pathExtension == "docx" || $0.pathExtension == "docx" }
            for path in directoryUrls!{
                booksAll.append(path.lastPathComponent)
                print(booksAll)
            }
        }
        
    }

}
