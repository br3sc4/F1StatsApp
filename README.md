# F1StatsApp

This project is a simple progammatically made UIKit application that shows all Formula 1 championship races and both drivers and constructors standings.

All data are retrieved form [ergast.com](https://ergast.com/mrd/).

## Architecture

The entire project is based on the Model-View-Controller (MVC) architecture which is the architecture that UIKit conforms to.

![MVC architecture diagram](/Docs/architecture.png)

The `F1StatsKit` include the entire application business logic in order to separate it from the ui framework.

## Lesson learned
- How to display data in a `UITableView` using `UITableViewDiffableDataSource`
- How to handle programmatically both `UITabBarView` and `UINavigationView`
- How to display different data types in a `UICollectionView` with `UICollectionViewCompositionalLayout`

## License

[GNU General Public License v3.0](/LICENSE)
