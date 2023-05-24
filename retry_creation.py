import subprocess
import time

max_retries = 3
retry_delay = 10
attempt = 1

while attempt <= max_retries:
    print(f"Attempt {attempt}: Creating VM with Terraform...")
    create_process = subprocess.run(["terraform", "apply", "-auto-approve"], capture_output=True)

    if create_process.returncode == 0:
        print("VM creation successful!")
        break
    else:
        print(f"VM creation failed. Retrying in {retry_delay} seconds...")
        time.sleep(retry_delay)
        attempt += 1

if attempt > max_retries:
    print("Maximum number of retries reached. Exiting...")
    exit(1)
