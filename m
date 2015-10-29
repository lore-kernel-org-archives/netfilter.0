From: GhostOp14 <ghostop14@gmail.com>
Subject: Transparent Bridge NAT Issue
Date: Thu, 29 Oct 2015 13:12:12 -0400
Message-ID: <000c01d1126c$f4857550$dd905ff0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:thread-index:content-language;
        bh=Lq5P3x98yaIbsZn1oplhrmKZVkR1fbRvIOSaJV2bx9U=;
        b=ZqpL46zWHPB2WdnFq+mFq7VFyM5cWWOrneZfmjszHqpPIIF9d8GQsa7eJYq2yc3JNG
         dmPHJlcNoc0KCUd32C7biKW7Y8MtwTA+gZ3YT3DgPUqLKM7Y44KW8lz2Yz+8L/216kp1
         9O3kHmbFo1rPRtsG3OeY5LoKmFOxwXIcXRWqpoy1zzWronVw5M0W/GjMoeowPLsxmqP/
         Q8JqITjUj10ncrYJY87j2Bj4vM/i9wWHKqqsISd/W7XAIykLLgCELG2wTm01cqV+D8sl
         ifZfHkEpADKzUk7ZsCGnqCYWGIT7qCHRkKmTYNJtTUOefj7BUtvtgryUyiWANDSdAPel
         gX5Q==
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to put together a transparent bridge to protect a system.  Using
ebtables, arptables, and iptables, I've ALMOST got it working, and I'm
wondering if using nftables may be the better way to go.  I have a test
script below, but the idea is that the bridge will have 2 NICs in it, eth0
connected to the computer to protect, and eth1 connected to the switch.
What's happening is that the bridge works fine and the protected computer
can communicate, however packets originating locally (the reason for some of
the NAT rules) ultimately doesn't work its way up the IP stack.  The packets
hit the wire with the correctly NAT'd entries so the NAT rules appear to be
working correctly, however the bridge itself doesn't seem to be processing
responding packets.  Originally I thought that the ARP mangling (rather than
an ARP equivalent to a NAT) might be causing the issue, but entering a
static entry in the arp table for a target to talk to produced the same
result.  Any help would be greatly appreciated!

-----------------------------------

#!/bin/bash

BRINT=br0
COMPINT=eth0
SWINT=eth1
COMPMAC="01:02:03:04:05:06"
# change this to the mac of the bridge
SWMAC="11:12:13:14:15:16"
# Set this to the IP address of the computer to protect (this works best if
you bring the bridge up before running this and let the computer DHCP to
pull an address
COMIP="192.168.1.31"

# Non-routable IP for bridge that we can NAT later to $COMIP
BRIP=169.254.66.66
# SNAT port range.
 RANGE=61000-62000

# Just verify the bridge is set up
HASBRIDGE=`ifconfig | grep $BRINT | wc -l`

if [ $HASBRIDGE -eq 0 ]; then
	brctl addbr $BRINT
	brctl addif $BRINT $COMPINT
	brctl addif $BRINT $SWINT
	brctl stp $BRINT off

	# Set the bridge to forward the EAPOL frames
	sysctl -w net.ipv4.ip_forward=1 > /dev/null
	sysctl -w net.ipv6.conf.all.forwarding=1 > /dev/null
	echo 8 > /sys/class/net/$BRINT/bridge/group_fwd_mask

	#bring up both sides of the bridge
	ifconfig $COMPINT 0.0.0.0 up promisc
	ifconfig $SWINT 0.0.0.0 up promisc

	# Just to only have to deal with 1 mac from eth1 and the bridge
	macchanger -m $SWMAC $BRINT >/dev/null
fi

ifconfig $BRINT $BRIP up promisc
route flush 2>/dev/null 
route add -net 192.168.1.0/24 br0
route add default gw 192.168.1.1

ebtables -t nat --flush
ebtables -t nat -A POSTROUTING -s $SWMAC -o $SWINT -j snat --to-src $COMPMAC
--snat-arp

arptables -t nat --flush
arptables -t nat -A OUTPUT -o $BRINT --source-mac $SWMAC -j mangle
--mangle-ip-s $COMIP

iptables -t nat --flush
iptables -t nat -A POSTROUTING -o $BRINT -s $BRIP -p tcp -j SNAT --to
$COMIP:$RANGE
iptables -t nat -A POSTROUTING -o $BRINT -s $BRIP -p udp -j SNAT --to
$COMIP:$RANGE
iptables -t nat -A POSTROUTING -o $BRINT -s $BRIP -p icmp -j SNAT --to
$COMIP


