From: Pete Zieba <pete_1024@yahoo.com>
Subject: Using a remote internet connection.
Date: Fri, 3 Oct 2003 17:30:50 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031004003050.57956.qmail@web12701.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi !

I have a somewhat odd situation. I am trying to use
the internet connection of a friend through a vpn
tunnel. My reason for this stems from the fact that my
ISP is rather restrictive. I cannot even ping machines
on the internet.
My setup is as follows:

*I have a linux machine, and so does my friend.
*I have iptables and OpenVPN running on both linux
machines. The VPN is functional, so is routing.
*Both linux machines have two NICS, eth0, and eth1.
Both act as a firewall/gateway for the LAN side.
*eth0 is the LAN side, eth1 the WAN.

*My friend connects to the internet using a cable
modem, and has a real IP on the net.
*I would like to use this connection as if I were on
his LAN side.

*OpenVPN creates a device, "tun0", which is what my
PPP ip is on.
my LAN subnet is 10.0.0.XXX
my VPN PPP ip is 10.0.1.2, which connects to 10.0.1.1
friend's LAN subnet is 10.0.3.XXX
friend's VPN PPP ip is 10.0.1.1, which connects to
10.0.1.2

With this setup, I am currently able to get out to the
internet, as well as ping machines on his network.
I would also like to be able to use his gateway.

openVPN adds this entry, which allows me to see
machines on his network:
route add -net 10.0.3.0 netmask 255.255.255.0 gw
10.0.1.1

everything up to this point is functional.

This is how I am using his machine as a gateway:
On my linux box, I am doing the following steps:

1. route del default
2. route add -host [friends cable modem IP] gw [my
former default gateway]
3. route add default gw 10.0.1.1

Logic in steps:
1. Don't want my old default gateway for all traffic.
2. I am using my former default GW in step 2 as a
means of connecting to his WAN IP, so that the VPN
connection is maintained. This works.
3. I am adding his PPP VPN ip as my default gateway.
This kinda' works.

I then do the following:
I reconfig my workstation to use his ISP's nameserver.
I can now ping domains (yahoo, etc.)
I CANNOT get to MOST websites. (msn.com is one of my
few successes)

*Note that everything works fine if I try to get to
websites using "links" as a browser in the console of
my linux box. It is only machines on my LAN side that
have problems.

My theory on why this does not fully work:
I am using my workstation, which uses my linux box as
a gateway.
My linux box uses the remote machine as a gateway.
The remote machine uses the cable modem as the
gateway.

Wouldn't the packets trying to get to the net from me
have an extra HOP? Could this be the cause of the
problem?

This is my linux box's routing table before my crazy 3
step idea:
Destination     Gateway         Genmask         Flags
Metric Ref    Use Iface
10.0.1.1        *               255.255.255.255 UH   
0      0        0 tun0
localnet        *               255.255.255.0   U    
0      0        0 eth0
10.0.3.1        10.0.1.1        255.255.255.0   UG   
0      0        0 tun0
[my WAN subnet] *               255.255.254.0   U    
0      0        0 eth1
loopback        *               255.0.0.0       U    
0      0        0 lo
default         [my WAN gw]     0.0.0.0         UG   
0      0        0 eth1


This is my linux box's routing table after my crazy 3
step idea:
Destination     Gateway         Genmask         Flags
Metric Ref    Use Iface
[friends WAN IP][my WAN GW]     255.255.255.255 UGH  
0      0        0 eth1
10.0.1.1        *               255.255.255.255 UH   
0      0        0 tun0
localnet        *               255.255.255.0   U    
0      0        0 eth0
10.0.3.1        10.0.1.1        255.255.255.0   UG   
0      0        0 tun0
[my WAN subnet] *               255.255.254.0   U    
0      0        0 eth1
loopback        *               255.0.0.0       U    
0      0        0 lo
default         10.0.1.1        0.0.0.0         UG   
0      0        0 tun0

Sorry about the long explanation. I do not have a mail
account capable of receiving any decent amount of
mail, so I cannot subscribe to the mailing list, so if
anyone has any ideas, I would appreciate it if replies
could also be sent to my address. Thanks for your time

Peter Zieba

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

