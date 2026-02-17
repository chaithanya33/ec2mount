[200~1Ô∏è‚É£ lsblk
What it does

Lists all block devices attached to the system.

Output shows

Disks (nvme1n1)

Partitions (nvme1n1p1)

Mount points

Why you ran it

To identify the new disk you want to format and mount.

Ì≥å Example:

nvme1n1   259:0    0   50G  0 disk

2Ô∏è‚É£ sudo mkfs -t ext4 /dev/nvme1n1
What it does

Formats the disk

Creates an EXT4 filesystem

Internal steps

Deletes existing filesystem (if any)

Creates inode tables

Prepares disk for file storage

‚ö†Ô∏è Data on the disk is erased

Ì≥å ext4 = most common Linux filesystem

3Ô∏è‚É£ sudo mkdir /data
What it does

Creates a directory /data

Why needed

Linux mounts disks on directories, not drive letters.

4Ô∏è‚É£ sudo mount /dev/nvme1n1 /data
What it does

Attaches the disk /dev/nvme1n1

Makes it accessible via /data

Result

Files written to /data go to this disk.

Ì≥å This mount is temporary (lost after reboot)

5Ô∏è‚É£ df -h
What it does

Shows disk usage

-h = human readable

Why you ran it

To confirm:

Disk is mounted

Size & available space

6Ô∏è‚É£ sudo nano /etc/fstab
What it does

Opens the filesystem table

Purpose

To make the mount permanent across reboots.

7Ô∏è‚É£ sudo blkid
What it does

Shows:

UUID

Filesystem type

Example:

/dev/nvme1n1: UUID="a1b2c3" TYPE="ext4"


Ì≥å UUID is safer than device name.

8Ô∏è‚É£ sudo nano /etc/fstab
What you add inside
UUID=a1b2c3   /data   ext4   defaults,nofail   0   2

Why

Auto-mounts disk at boot

Prevents boot failure if disk is missing

9Ô∏è‚É£ sudo mkdir -p /data
What it does

Ensures mount directory exists

-p prevents error if already exists

Ì¥ü sudo mount -a
What it does

Mounts everything in /etc/fstab

No reboot required

Why important

Tests fstab for errors.

‚ö†Ô∏è If this fails ‚Üí system may fail on boot.

1Ô∏è‚É£1Ô∏è‚É£ df -h
Final verification

Confirms:

Disk is mounted

Space is available

Permanent mount works

Ì∑† Overall Flow (Big Picture)
Detect disk ‚Üí Format ‚Üí Create mount point
‚Üí Temporary mount ‚Üí Verify
‚Üí Get UUID ‚Üí Permanent config
‚Üí Test mount ‚Üí Verify again

Ì≥ù Interview-Ready Summary

These commands detect a new disk, format it with an ext4 filesystem, mount it to /data, verify the mount, and configure /etc/fstab so the disk is automatically mounted on every reboot.
