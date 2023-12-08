import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)  # Use Broadcom pin-numbering scheme

# Setup your GPIO pins here
# Example: GPIO.setup(18, GPIO.IN)

def read_sensor_data():
    # Replace this with your sensor reading logic
    # Example: return GPIO.input(18)
    return {"sensor_value": 0}

if __name__ == "__main__":
    try:
        while True:
            data = read_sensor_data()
            print(f"Sensor Data: {data}")
            time.sleep(5)  # Adjust the sleep time as needed
    finally:
        GPIO.cleanup()  # Clean up GPIO on exit
