From: "Charles" <charles@aib.net>
Subject: Proper way to setup DNAT to servers inside a different internal
	network (VPN)?
Date: Mon, 18 Apr 2005 18:34:03 +0800
Message-ID: <001e01c54402$240ecbe0$0200a8c0@HOME>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,

My boss has need me to setup a DNAT at the gateway into a LAN server =
inside
an IPSec VPN, which is not at the same network as the pub gateway. That
create a big problem! I hope someone can help me!

The pub gateway is a RedHat 8.0 Linux with kernel 2.4.18, iptables =
1.2.6a
1.2.3.137 is the public ip at the pub gateway
10.8.1.88 is the internal network address of the pub gateway
and 10.8.2.99 is the internal network of the LAN server
the vpn gateway at the LAN network is also the LAN gateway, has its own
broadband connection connect to the Internet
We need to forward at least (will be more in the future) HTTP, FTP, PPTP
traffic at 1.2.3.137 into the LAN server!!

I try to draw the network config here:
[Internet client] <--> (eth0:1.2.3.137) [pub gateway] (eth1:10.8.1.88)
<-(VPN)-> [vpn gateway] (eth1:10.8.2.1) <-LAN->(eth0:10.8.2.99) LAN =
Server

I've successfully make half the way by using DNAT and SNAT:
iptables -t nat -A PREROUTING -i eth0 -d 1.2.3.137 -j DNAT --to =
10.8.2.99
iptables -t nat -A POSTROUTING -d 10.8.2.99 -j SNAT --to-source =
10.8.1.88

Problems:
- Internet client connect to 1.2.3.137 http can connect to the LAN =
server,
browsing webpage is ok, but when doing a HTTP post upload it fails by =
hang a
period of time and then browser report webpage not found!
- Internet client connect to 1.2.3.137 ftp can connect to the LAN =
server,
but ftp cannot start file transfer with both active/passive mode!
- Internet client connect to 1.2.3.137 PPTP can connect to the LAN =
server
and start the pptp vpn connection, strange?

Am I missing something?


Thanks a lot!
Charles

--=20
I am using the free version of SPAMfighter for private users.
It has removed 23251 spam emails to date.
Paying users do not have this message in their emails.
Try www.SPAMfighter.com for free now!


