//
//  BreedTableViewCell.swift
//  CatBreeds
//
//  Created by Roman Arriaga on 3/19/25.
//

import UIKit

final class BreedTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var knownForLabel: UILabel!
    @IBOutlet weak var breedImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        popularityLabel.text = ""
        nameLabel.text = ""
        knownForLabel.text = ""
        breedImageView.image = nil
    }
    
    func configure(breed: Breed) {
        popularityLabel.text =  "\(breed.popularity)"
        nameLabel.text =  breed.name
        knownForLabel.text =  breed.knownFor
    }

}
