# ecommerce_product_listing_app

## How I Built It

I followed a step-by-step development workflow to build this app from scratch:

### Project Setup  
- Initialized a new Flutter project  
- Added necessary dependencies like `dio`, `riverpod`, `sqflite` in `pubspec.yaml`  
- Created folders structure

### UI Development  
- Implemented the entire UI based on Figma design  
- Ensured responsiveness across different device sizes

### API & Model Setup  
- Used [DummyJSON API](https://dummyjson.com/products) as backend  
- Created the product model based on API response  
- Handled JSON parsing and error handling

### Local Database (SQLite)  
- Set up a local database using `sqflite`  
- Stored fetched products for offline support  
- Wrote CRUD operations to sync API data with local DB

### State Management (Riverpod)  
- Used Riverpod for scalable and testable state management  
- Managed UI states, API states, DB states using Providers

### Pagination  
- pagination logic  


### Search Functionality  
- Enabled real-time search by product name  

### Sorting  
- Added sorting options based on price and rating  

### GitHub Workflow  
- Pushed project to GitHub  
- Created and worked on multiple branches for features  
- Followed proper commit messages and PR merging strategy
