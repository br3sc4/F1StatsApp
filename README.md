# F1StatsApp

This project is a simple progammatically made UIKit application that shows all Formula 1 championship races and both drivers and constructors standings.

All data are retrieved form [ergast.com](https://ergast.com/mrd/). 
Here are few endpoints I used:
- [Races](https://ergast.com/api/f1/current.json)
- [Drivers Standings](https://ergast.com/api/f1/current/driverStandings.json)
- [Constructors Standings](https://ergast.com/api/f1/current/constructorStandings.json)

## Architecture

The entire project is based on the Model-View-Controller (MVC) architecture.

![MVC architecture diagram](/Docs/architecture.png)

### Entities

- `StandingsStore` and `RacesStore` are responsible to store the standings and races and provide few methods to format data for `ViewControllers` and to fetch data from the network.
- `ViewControllerFactory` and `UIViewControllerFactory` are responsible to create the `UIViewControllers` and inject their required dependecies. 
- `UITabBarController` is responsible to handle the navigation between appplications tabs.
- `StandingsViewController` is responsible to handle the `UICollectionView` and populate it with the `StandingsStore` data.
- `RacesViewController` is responsible to handle the `UITableView` and populate it with the `RacessStore` data.

> Both `StandingsViewController` and `RacesViewController` use `DiffableDataSorce` and `NSDiffableDataSourceSnapshot` to populate data inside views

The `F1StatsKit` include the entire application business logic in order to separate it from the ui framework. So in the future if we want to reimplement it with a different ui framework we can do it without recreating everything from scratch.

## Lesson learned

- How to display data in a `UITableView` using `UITableViewDiffableDataSource`
- How to handle programmatically both `UITabBarView` and `UINavigationView`
- How to display different data types in a `UICollectionView` with `UICollectionViewCompositionalLayout`

## License

[GNU General Public License v3.0](/LICENSE)
