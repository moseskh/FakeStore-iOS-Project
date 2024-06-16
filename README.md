# FakeStore iOS Project

## Introduction

This is a demo iOS app that mimics a fake e-commerce store. The app showcases a list of products using a collection view, handles click events, and displays detailed product information along with a list of suggested products in the same category.

## Features

### Product Listing

The primary interface of the application utilizes a `UICollectionView` to display a list of products. This component is optimized for performance and includes a hover animation to enhance the user experience. 

### Detailed Product View

Upon selecting a product, the application transitions to a detailed view controller that displays comprehensive product information using a `UITableView`. This view includes:
- Product image
- Description
- Price
- Star ratings (using the `Cosmos` library)
- A list of suggested products in the same category (using a `UICollectionView`)

### Error Handling

The app handles potential error cases, such as network failures, and provides appropriate feedback to the user using alert controllers and retry mechanisms. Additionally, the application includes a network status checker that monitors connectivity and informs the user of the current network status through a visual indicator.

### Caching Mechanism

To minimize unnecessary API requests and enhance performance, the application employs a caching mechanism. A cache manager, implemented using generic functions, is responsible for storing and retrieving various data types. This approach ensures that cached data is used whenever valid, reducing the load on network resources.

### Data Loading and Refreshing

Each view controller incorporates a refresh controller that allows users to manually reload data. This feature ensures that users can update the displayed information at their convenience. Additionally, the application implements a loading indicator that is presented during network requests. This indicator provides visual feedback to the user, ensuring a smooth and informative experience while data is being fetched or refreshed from the server. 

## Third-Party Libraries

- **Cosmos**: A versatile star rating control for iOS, used to display product ratings.
- **SDWebImage**: An asynchronous image downloader with built-in cache support, used to efficiently load and cache product images.

## Project Structure

- **Models**: Contains the data models used in the app.
- **Views**: Contains the UI components, including custom collection view cells and table view cells.
- **ViewControllers**: Contains the view controllers for the main product list and product detail screens.
- **Managers**: Contains the API Caller, Caching Manager and Network Manager.
- **Presenters**: Contains the Loading Indicator Presenter and Alert Presenter.

## Acknowledgements

This project utilizes sample data only for demonstration purposes, the design and functionality of the application are influenced by various e-commerce platforms.
