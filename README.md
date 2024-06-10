# Camera Hacking and Streaming via Socket Programming

This project demonstrates how to hack and stream video from a camera over a network using socket programming in Python. It consists of three main components:

1. `korban.bat` - Script to be executed on the victim's computer to start the camera streaming server.
2. `terima-ip.bat` - Script to be executed on the attacker's computer to capture the IP address of the victim's machine.
3. `pelaku.py` - Python script to be executed on the attacker's computer to receive and display the video stream from the victim's machine.

## Getting Started

### Prerequisites

Make sure you have the following installed on both the victim's and the attacker's machines:
- Python 3.x
- OpenCV (`cv2`)
- imutils
- ncat (Netcat)

### Usage

#### Step 1: Set Up the Victim's Machine

1. Execute `korban.bat` on the victim's machine. This script will:
   - Create and execute a Python script (`script.py`) to start a video streaming server.
   - Send the victim's IP address to the attacker's machine.

#### Step 2: Capture Victim's IP Address

1. Execute `terima-ip.bat` on the attacker's machine to capture and save the victim's IP address to a file named `tangkap-ip.txt`.

#### Step 3: Start Receiving the Video Stream

1. Execute `pelaku.py` on the attacker's machine. The script will:
   - Prompt for the IP address of the victim's machine.
   - Connect to the video streaming server on the victim's machine.
   - Display the received video stream.

### Script Details

#### `korban.bat`

This script creates a Python script (`script.py`) on the victim's machine which:
- Initializes a socket server.
- Captures video from the camera.
- Streams the video frames to the connected client.

Additionally, it sends the victim's IP address to the attacker's machine using `ncat`.

#### `terima-ip.bat`

This script uses `ncat` to listen for incoming connections and save the received IP address to `tangkap-ip.txt`.

#### `pelaku.py`

This Python script:
- Connects to the victim's machine using the provided IP address.
- Receives video frames over the network.
- Displays the received video stream using OpenCV.

### Disclaimer

This project is for educational purposes only. Unauthorized access to computer systems is illegal and unethical. Always obtain proper authorization before conducting any testing or deploying similar scripts.
