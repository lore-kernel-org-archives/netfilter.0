From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: ftp nat doesn't work for ipsec tunnel outgoinging packets
Date: Tue, 25 Oct 2005 13:23:54 +0200
Message-ID: <BAY103-F17577F1C091D2B169A5F4CB2760@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello. I have a very strange problem with ftp.
Here is my network schema:

ftp client (windows nt4) 172.22.1.14
|
|
|172.22.1.254 (network 172.22.1.0/24)
linux box FreeS/WAN IPsec
| public ip
|
|
internet
|
|
| public ip
linux box kernel 2.6.14rc5 26sec IPsec
| 172.16.1.1 (network 172.16.0.0/23)
|
|
|
ftp server (windows 2000 server) 172.16.1.25


The two networks 172.22.1.0/24 and 172.16.0.0/23
are connected with an ipsec tunnel implemented by
FreeS/WAN (KLIPS) on the 172.22.1.254 box and by
Openswan (26sec) on the 172.16.1.1 box.

Here is the "iptables -t nat -L -n" output on the
linux 2.6.14rc5 box (172.16.1.1):

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  172.22.1.14          172.16.1.25         to:172.16.1.1


I'm natting all packets from 172.22.1.14 to 172.16.1.25
with 172.16.1.1 (don't ask me why). Running ls on the
ftp client I get errors like: connections closed from host,
sometimes it works, command not understood.

This is a tcpdump capture on the 172.16.1.1 box:

12:21:47.709908 IP 172.16.1.1.2976 > 172.16.1.25.21: P 
2885906235:2885906259(24) ack 2893999520 win 8608
12:21:47.710303 IP 172.16.1.25.21 > 172.16.1.1.2976: P 1:31(30) ack 24 win 
65488
12:21:49.603650 IP 172.22.1.14.2976 > 172.16.1.25.21: P 
2885906235:2885906260(25) ack 2893999520 win 8608
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What is this packet? Why the source ip address is not changed?

12:21:49.603811 IP 172.16.1.25.21 > 172.22.1.14.2976: R 
2893999520:2893999520(0) win 0
12:21:49.651794 IP 172.16.1.25.21 > 172.16.1.1.2976: P 1:31(30) ack 24 win 
65488
12:21:49.651907 IP 172.16.1.1.2976 > 172.16.1.25.21: R 
2885906259:2885906259(0) win 0

Ftp nat & conntrack modules are loaded.

PS: The same system with linux 2.4.31 and SWAN KLIPS is working.



