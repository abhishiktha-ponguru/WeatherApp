//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    var weatherType: WeatherType = .weather
    var dataSource: [[Climate]]?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        dateFormatter.dateFormat = DateFormat.fullDateTime
        self.title = weatherType == .weather ? ScreenName.weatherDetails : ScreenName.weatherForecast
        tableView?.register(UINib(nibName: TableCell.climateCell, bundle: nil), forCellReuseIdentifier: TableCell.climateCell)
    }
}

extension WeatherDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let climateCell = tableView.dequeueReusableCell(withIdentifier: TableCell.climateCell, for: indexPath) as? ClimateCell else { return UITableViewCell() }
        climateCell.dateFormatter = dateFormatter
        climateCell.dataSource = dataSource?[indexPath.section][indexPath.row]
        climateCell.configureCell()
        return climateCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if Calendar.current.isDateInToday(dateFormatter.date(from: dataSource?[section].first?.dt_txt ?? "") ?? Date()) {
            return DayType.today
        } else if Calendar.current.isDateInTomorrow(dateFormatter.date(from: dataSource?[section].first?.dt_txt ?? "") ?? Date()) {
            return DayType.tomorrow
        }
        return dataSource?[section].first?.dt_txt?.calculateDate(dateFormatter)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
