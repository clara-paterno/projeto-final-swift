# 🌱 Smart Plant Monitoring System

An IoT-based mobile application that enables users to monitor environmental conditions of their plants in real time through an intuitive iOS interface.

## 📖 Overview

This project was developed to simplify plant care by integrating IoT devices with a mobile application. Environmental data collected by sensors is transmitted to an ESP32, processed through Node-RED, and made available to an iOS application via a REST API.

The application allows users to register plants, associate them with monitoring devices, and track their environmental conditions, helping them make informed decisions about plant care.

---

## ✨ Features

- Register new plants
- Associate plants with IoT devices
- Real-time monitoring
- Temperature visualization
- Air humidity visualization
- Light intensity visualization
- Clean and intuitive interface
- Automatic data retrieval from the server

---

## 🛠 Technologies

### Mobile
- Swift
- SwiftUI

### Backend
- Node-RED
- REST API
- JSON

### Hardware
- ESP32
- Environmental sensors

### Tools
- Xcode
- Git
- GitHub

---

## 🏗 System Architecture

```text
Environmental Sensors
        │
        ▼
      ESP32
        │
        ▼
    Node-RED
        │
 REST API (JSON)
        │
        ▼
   iOS Application
```

---

## 📱 Application Screens

*(Add screenshots here)*

Example:

- Home Screen
- Plant Details
- Add Plant
- Sensor Data

---

## 🎯 Objectives

- Develop an IoT solution for smart plant monitoring.
- Integrate embedded hardware with a mobile application.
- Practice API consumption in SwiftUI.
- Improve user experience through a simple and intuitive interface.

---

## 📚 What I Learned

Throughout this project I gained practical experience with:

- SwiftUI development
- REST API integration
- JSON parsing
- Node-RED flows
- IoT architecture
- Hardware and software integration
- Team collaboration
- Git version control

---

## 🚀 Future Improvements

- Push notifications for abnormal conditions
- Historical sensor data
- Data visualization charts
- Plant care recommendations
- AI-powered irrigation suggestions
- User authentication
- Cloud database integration

---

## 👥 Team

Developed as an academic project by a multidisciplinary team combining mobile development, IoT, and backend technologies.
