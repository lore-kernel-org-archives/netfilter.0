From: pockiman@freenet.de
Subject: DHCP works but iptables should have dropped
Date: Fri, 12 Oct 2007 23:32:25 +0200
Message-ID: <E1IgS7N-0000Jz-Kg@www3.emo.freenet-rz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

i have a debian (etch) server/firewall with dhcp-server and iptables with eth3 connectet to a switch, and a Laptop without Batterypack and without any Harddisk, USB-Stick or whatever can store Information, also connected  to that switch, no other computer is connect to that switch.

-I've set the default policy of both ipv4 and ipv6 for all chains to DROP (debian server)
-there is no rule specified
-the dhcp-server is configured (by MAC) to delivery the ip xx.xx.xx.34 to the Laptop
-the Laptop has a DVD-drive with a Knoppix-Distribution configured to use DHCP

if i boot the Laptop, there are 4 Packet registered to be dropped by the INPUT-default-policy, but the Laptop gets the ip-address.
In the syslog of the server, there are entries from the dhcp-deamon for the request and the answers., but the OUTPUT - chain - Packet-Counter is already at 0.

How are the packets (i thought it would be UDP) transmitted.

Thanks in advance,
pockiman








