From: Kurt Haenen <Kurt.Haenen@quintux.com>
Subject: Problems with bridge+router setup
Date: Sun, 27 Dec 2015 12:00:57 +0100
Message-ID: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear all,

I'm trying to setup a Raspberry Pi2 as a special kind of bridge+router, 
but am getting stuck (basically way before the difficult stuff starts) 
with just basic bridging already.  I've tried figuring this out on my 
own and with searching through all stuff on the Internet, but still am 
no step closer to understanding the cause of my problems (even though I 
don't thing I'm an idiot), so this is basically a cry for help ...


So, the basics of my setup:

Client <----> RPI2 <----> LAN

The RPI2 has an extra eth1 via USB to which the Windows-7 client is 
connected, while the rest of the network is connected through eth0 of 
the RPI2.  The LAN contains a server that hands out DHCP addresses.

The RPI2 is running the latest Raspbian Jessie (Linux raspberrypi 
4.1.13-v7+ #826 SMP PREEMPT Fri Nov 13 20:19:03 GMT 2015 armv7l 
GNU/Linux).
I created the bridge through the /etc/network/interfaces config file:
     auto lo eth1 br0
     iface lo inet loopback
     iface eth0 inet manual
     iface eth1 inet manual
     iface br0 inet dhcp
         bridge_fd 0
         bridge_maxwait 0
         bridge_stp off
         bridge_ports eth0 eth1

The fd, maxwait and stp bridge settings were actually added after 
checking the Internet for the problems I was hitting.  I've also tried 
executing explicit brctl commands for the same, but that didn't change 
anything ...  No ebtables or iptables rules applied yet, since I first 
wanted to test basic bridging.

With this setup, when I attach my Windows-7 client to eth1 of the RPI 
and ensure the client has a static IP in the same range as the LAN, then 
everything seems to work fine.  I can ping hosts on the LAN from the 
client and vice-versa, BUT ...

If I tell the client to use DHCP, then it (most of the time) doesn't 
get an IP address.  I added a rule to just log events in the FORWARD 
chain of ebtables' filter table, which (filtered on ports 67 and 68) 
shows:

Dec 27 10:35:54 raspberrypi kernel: [73804.793870] LOG_FORWARD IN=eth1 
OUT=eth0 MAC source = 00:26:2d:c6:df:50 MAC dest = ff:ff:ff:ff:ff:ff 
proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x00, IP 
proto=17 SPT=68 DPT=67
Dec 27 10:35:54 raspberrypi kernel: [73804.794508] LOG_FORWARD IN=eth0 
OUT=eth1 MAC source = 00:e0:4c:e8:42:30 MAC dest = ff:ff:ff:ff:ff:ff 
proto = 0x0800 IP SRC=192.168.21.1 IP DST=255.255.255.255, IP tos=0x10, 
IP proto=17 SPT=67 DPT=68
Dec 27 10:35:54 raspberrypi kernel: [73804.799762] LOG_FORWARD IN=eth0 
OUT=eth1 MAC source = 00:e0:4c:e8:42:30 MAC dest = ff:ff:ff:ff:ff:ff 
proto = 0x0800 IP SRC=192.168.21.1 IP DST=255.255.255.255, IP tos=0x10, 
IP proto=17 SPT=67 DPT=68
Dec 27 10:35:54 raspberrypi kernel: [73804.801009] LOG_FORWARD IN=eth1 
OUT=eth0 MAC source = 00:26:2d:c6:df:50 MAC dest = ff:ff:ff:ff:ff:ff 
proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x00, IP 
proto=17 SPT=68 DPT=67
Dec 27 10:35:54 raspberrypi kernel: [73804.809660] LOG_FORWARD IN=eth0 
OUT=eth1 MAC source = 00:e0:4c:e8:42:30 MAC dest = ff:ff:ff:ff:ff:ff 
proto = 0x0800 IP SRC=192.168.21.1 IP DST=255.255.255.255, IP tos=0x10, 
IP proto=17 SPT=67 DPT=68
Dec 27 10:35:55 raspberrypi kernel: [73805.917988] LOG_FORWARD IN=eth1 
OUT=eth0 MAC source = 00:26:2d:c6:df:50 MAC dest = ff:ff:ff:ff:ff:ff 
proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x00, IP 
proto=17 SPT=68 DPT=67
Dec 27 10:35:55 raspberrypi kernel: [73805.924720] LOG_FORWARD IN=eth0 
OUT=eth1 MAC source = 00:e0:4c:e8:42:3
0 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0800 IP SRC=192.168.21.1 IP 
DST=255.255.255.255, IP tos=0x10, IP proto=17 SPT=67 DPT=68

So, I would conclude from this (correct me if I'm wrong) that the 
server (192.168.21.1) is receiving the request for a DHCP address and 
even responds back, but for some reason this response either never 
reaches the Windows 7 machine or it refuses to use it.

Now, yesterday, for an extensive period, the problem was gone: I could 
attach the client, get an IP, detach it, attach it again and get the 
same IP again.  Then this morning, with nothing changed, not even the 
power taken off from any of the involved devices (apart from the client 
which was put to sleep while detached from the network), it came back to 
not getting an IP at all ...

So, any clue, tips or whatever that could help me in figuring out the 
root cause here?

Much thanks in advance and happy hollidays to all!

K.
