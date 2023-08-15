//
//  MyTableViewCell.swift
//  TableViewCode
//
//  Created by zaehorang on 2023/08/16.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    //MARK: - 생정자 재정의
    
    // 셀과 오토레이아웃 설정 함수 실행을 위해 생정자 재정의
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 스택뷰 설정 메서드

    func setupStackView() {
        // cell의 기본뷰 contenView에 뷰들 올리기
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)
        
        // 스택뷰 위에 레이블 올리기
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    //MARK: - 오토레이아웃 설정 메서드
    
    func setConstraints() {
        setMainImageViewConstraints()
        setMovieNameLabelConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setMovieNameLabelConstraints() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
}
