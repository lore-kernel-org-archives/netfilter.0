From: Joe Drago <joe@drago.cc>
Subject: round robin SNAT, multiple "to IP" setup, AIM issue?
Date: Wed,  8 Sep 2004 13:27:32 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094675252.413f6b34166d6@www.gotdoofed.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a simple setup for a Linux router with two interfaces. One interface
(eth1) is my internal side, running the 10.176.60.1/22, and the other interface
(eth0) has 10 public IP addresses on it, similar to 5.5.5.0/23 (first 3 octets
changed to 5.5.5 to protect the innocent. :-)

Internet - [eth0 5.5.5.60-5.5.5.69] - NAT - [eth1 10.176.60.1/22] - Clients

To configure this device, I use a series of commands, listed here. Mind you, the
only change from my real config is the public IPs have been replaced with the
"5.5.5.0" range. 

--
ifconfig eth0 up
ifconfig eth1 up
ifconfig eth0 5.5.5.60 netmask 255.255.254.0
ip addr add 5.5.5.61/23 dev eth0
ip addr add 5.5.5.62/23 dev eth0
ip addr add 5.5.5.63/23 dev eth0
ip addr add 5.5.5.64/23 dev eth0
ip addr add 5.5.5.65/23 dev eth0
ip addr add 5.5.5.66/23 dev eth0
ip addr add 5.5.5.67/23 dev eth0
ip addr add 5.5.5.68/23 dev eth0
ip addr add 5.5.5.69/23 dev eth0

ifconfig eth1 10.176.60.1 netmask 255.255.252.0
route add default gw 5.5.5.1
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 5.5.5.60-5.5.5.69
echo 1 > /proc/sys/net/ipv4/ip_forward
--

This setup has worked perfect for me for a while, but recently I noticed that
when I try to connect to the AOL Instant Messenger service, it refuses to
complete the connection. I recorded the conversation with Ethereal and realized
that it was talking to two servers over at AOL. One of them provided the
authentication, and the other one was what carried on the regular AIM conversation. 

This is the very reason it seems to break. The AIM client (tried the real AIM
client running on an XP work laptop and gaim/Debian on my work machine) attempts
to connect to the auth server. The linux router chooses the next available WAN
IP for this connection (let's say 5.5.5.60 port 5190). Once the authentication
completes, it attempts to connect to the main AIM server (port 5190 again), in
which the linux router chooses 5.5.5.61 to talk to this. The IP discrepancy is a
no-no to the second server, and sends me away. 

To make a long story short (TOO LATE!), I need to figure out a way to have the
Linux box use the same IP for both connections to the AIM servers. My first idea
was to potentially route all traffic destined for port 5190 across one of the
ten WAN IPs, but then I wondered if there was a way to have the linux router
"prefer" to use the same WAN IP as much as possible without resorting to a
1-to-1 setup. There are more than 10 clients, so that really isn't an option. 

Any advice is appreciated, including potential fixes to the generic config as it
is. I don't claim to be an expert on any of this. :-D

Joe Drago
StreamLine Communications



