# Chat-Rooms
This project is a testament to my self-guided learning journey in Swift and SwiftUI. It showcases the basic functionalities of a chat room app, including user login/registration, chat room viewing, message sending, and username updating. Firebase, a third-party cloud service, is used for data storage. 

### Features

- Built with the MVVM (Model-View-ViewModel) design pattern to separate UI, data, and logic, making the code more maintainable and readable.
- Providing guests with limited functions (view the rooms), and navigate them to the login page when requesting further information.
- Using asynchronous network calls (async await) to fetch and update data **live**.
- Distinguished messages sent by other users and the logged-in user
- Dark-mode compatible

### What I learned

- Enhanced my understanding of SwiftUI (basic components, extract reusable components, modifiers, etc.)
- Practiced working with backends
- Enhanced my understanding of async/await in Swift

### References

I also understand that developer forums are my good friend when developing, especially when encountering issues. Some sources of reference include:

- Apple Developer Forums
- StackOverflow
- Hacking With Swift

### TODO

Notice that this project is far from perfect, as it has just achieved the basic functionalities of a real-world chat room app. Some features to be implemented are listed as follows:

- Update users with avatars and an introduction.
- Add warnings/alerts when finishing some operation (update user name, log out)
- Implement a custom login check mechanism (password with a minimum length, username with only certain characters allowed, etc.)
- Update the time stamp for messages
