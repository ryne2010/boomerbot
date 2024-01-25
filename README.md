# boomerbot

## Start Here

1. Flash OS to SD card
  Use RPi Imager to flash RPi OS Legacy Lite 64-bit
  Enable SSH with RSA key
  Config Wifi

  TODO: Use "flash_rpios_to_sd.sh" in /Developer/scripts
2. Boot RPi with flashed SD card
3. Connect to RPi via SSH
  Use "connect_to_rpi.sh" in /Developer/scripts
4. Copy startup scripts to RPi
  Use "copy_startup_scripts_to_rpi.sh" in /Developer/scripts
5. Edit RPi bootup config file - `/boot/config.txt` (steps copied from [here](https://docs.arducam.com/Raspberry-Pi-Camera/Multi-Camera-CamArray/quick-start/#imx519-multi-camera-kit:~:text=CAM1%C2%A0by%C2%A0default.-,IMX519%20Multi%2DCamera%20Kit%3A,following%20item%20under%20it%3A%0Adtoverlay%3Dimx519%0A%23Save%20and%20reboot.,-For%C2%A0Bullseye%C2%A0users))

  ```bash
  sudo nano /boot/config.txt
  ```

  #Find the line: [all], add the following item under it:
  dtoverlay=imx519
  #Save and reboot.
6. Install Arducam Camera Packages (steps copied from [here](https://docs.arducam.com/Raspberry-Pi-Camera/Multi-Camera-CamArray/quick-start/#64mp-ov64a40-multi-camera-kit:~:text=Operation%20Guide,64MP%20OV64A40%20Camera))

6.1. Download scripts and grant privilege

  ```bash
  wget -O install_pivariety_pkgs.sh https://github.com/ArduCAM/Arducam-Pivariety-V4L2-Driver/releases/download/install_script/install_pivariety_pkgs.sh
  ```

  ```bash
  chmod +x ./install_pivariety_pkgs.sh
  ```

6.2. Install libcamera

  ```bash
  ./install_pivariety_pkgs.sh -p libcamera
  ```

6.3. Install libcamera-apps

  ```bash
  ./install_pivariety_pkgs.sh -p libcamera_apps
  ```

6.4. Install camera drivers

  ```bash
  ./install_pivariety_pkgs.sh -p ov64a40_kernel_driver
  ```

6.5. Reboot

  ```bash
  sudo reboot
  ```

6.6. Capture & view test image
  ***NOTE***: XQuartz must be installed on host machine, feh must be installed on RPi

  ```bash
  libcamera-still -t 5000 -n -o test.jpg
  ```

  ```bash
  feh test.jpg
  ```

  May take some time to display

7. Initialize project

```bash
cd ~
chmod +x init.sh
./init.sh
```
