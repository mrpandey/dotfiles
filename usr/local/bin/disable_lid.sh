#!/bin/bash

# PNP0C0D:00 represents lid in ACPI specs, see /proc/acpi/wakeup
echo PNP0C0D:00 > /sys/bus/acpi/drivers/button/unbind
