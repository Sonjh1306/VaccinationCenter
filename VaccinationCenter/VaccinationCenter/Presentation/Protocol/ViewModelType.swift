//
//  ViewModelType.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/22.
//

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
    var disposeBag: DisposeBag { get set }
}
