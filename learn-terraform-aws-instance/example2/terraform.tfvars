servername = "calabvm"
subnet = "10.0.1.0/24"
os_type = "linux"
ec2_monitoring = true
disk = {
    delete_on_termination = false
    encrypted = true
    volume_size = "20"
    volume_type = "standard"
}