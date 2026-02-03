# RGT (Robot Gestures Translate) 🤖🖐️

**RGT** is a specialized integration hub designed to facilitate real-time communication between Computer Vision AI models and Robotic hardware. It serves as the central processing unit that translates recognized human gestures into robotic movements.

## 🌟 Overview
In complex robotics systems, communication latency is the biggest enemy. **RGT** solves this by implementing a dual-protocol architecture, ensuring that as soon as a hand sign is identified, the corresponding robotic command is dispatched and executed.

## 🛠 Project Architecture
The system operates through a three-tier synchronization process:

* **Input Tier (AI Model):** Uses WebSockets to stream gesture labels instantly to the app.
* **Logic Tier (RGT App):** A Flutter-based controller that parses incoming packets and maintains a stable connection with the peripherals.
* **Output Tier (Robotic Arm):** An ESP8266/Arduino-based arm that listens for REST API commands to trigger specific motor sequences.

## ⚙️ Technical Features
- **Bi-Directional Streaming:** Leverages **WebSockets** for continuous, low-latency data input.
- **Action Dispatcher:** Uses an optimized **HTTP client** to send command payloads to the robotic hardware.
- **Real-time Monitoring:** A clean UI to visualize the incoming gesture data and the outgoing hardware status.

## 🚀 Installation & Setup
1. Clone the repository:
   ```bash
   git clone [https://github.com/Adham-Tiger/Robot-Gesture-Translator--RGT-]
