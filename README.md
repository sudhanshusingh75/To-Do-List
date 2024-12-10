# To-Do List App

A basic iOS To-Do List app where users can add and manage tasks. The app ensures that tasks persist even after closing the app, thanks to `UserDefaults`.

## Features
- **Add Tasks**: Users can add tasks to the list.
- **Edit Tasks**: Tapping on a task navigates to the **Edit Task** view, where the task can be modified or deleted.
- **Remove Tasks**: Tasks can be deleted from the **Edit Task** view.
- **Data Persistence**: The app uses `UserDefaults` to save tasks, so they remain available even after the app is closed and reopened.

## How It Works
1. **Add a Task**: Enter the task details in the input field and press the "Add" button to include it in the list.
2. **Edit a Task**: Tap on a task in the list to navigate to the **Edit Task** view. You can update the task details here.
3. **Delete a Task**: In the **Edit Task** view, you can delete the task if it is no longer needed.
4. **Persistent Storage**: Tasks are stored locally using `UserDefaults`.

## Technical Details
- **Platform**: iOS
- **Language**: Swift
- **Data Storage**: `UserDefaults`

## Future Scope
- Integration of notifications for task deadlines.
- Enhanced UI with categorization and prioritization of tasks.
- Advanced storage solutions like Core Data or Realm for larger datasets.

## Installation
1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

## License
This project is open-source and available under the MIT License.
