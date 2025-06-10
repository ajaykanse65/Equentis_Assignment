
# 📝 Task Manager App

A simple **Task Manager App** built with **Flutter + Bloc + Hive** — manage your tasks with a beautiful UI and persistent local storage.

## 🚀 Features

✅ Add / Edit / Delete Tasks  
✅ Mark Tasks as Done / Pending  
✅ Filter Tasks → All / Done / Pending (using Chips)  
✅ Persistent Storage (Hive local DB)  
✅ Light / Dark Theme Toggle  
✅ Modern UI with Smooth Animations  

## 📂 Project Structure

```
lib/
├── data/           # Models & Repositories (Hive)
│   ├── models/
│   ├── repositories/
├── logic/          # Bloc & Cubit
│   ├── bloc/
│   ├── cubit/
├── ui/             # Pages & Widgets
│   ├── pages/
│   ├── widgets/
└── main.dart       # App Entry Point
```

## ⚙ Setup & Run

### 1️⃣ Clone this repo

```bash
git clone <[your-repo-url](https://github.com/ajaykanse65/Equentis_Assignment.git)>
cd <equentis_assignment>
```

### 2️⃣ Install packages

```bash
flutter pub get
```

### 3️⃣ Generate Hive Adapter (if not already generated)

```bash
flutter packages pub run build_runner build
```

### 4️⃣ Run the app

```bash
flutter run
```

## 🛠 Tech Stack

- **Flutter**  
- **Hive** for local storage  
- **Bloc** for state management  
- **ThemeCubit** for light/dark mode  

## 🎨 UI Highlights

- AppBar with theme switcher  
- Filter chips: All | Done | Pending  
- Task List with modern animated cards  
- Add/Edit Task with Date Picker  
- FloatingActionButton with label  

## 🙌 Author

**Ajay Kanase**  
[GitHub Profile](https://github.com/ajaykanse65)


