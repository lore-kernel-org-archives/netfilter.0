From: "A. Sayler" <asayler@comcast.net>
Subject: PPTP Server and PPTP clients on a firewalled gateway
Date: Sat, 4 Dec 2004 16:14:29 -0800
Message-ID: <000601c4da5f$63bcc380$0401a8c0@dell>
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

Hi,

If anybody might some insight into this problem I would certainly =
appreciate it.

I have multiple wireless clients that need access to outside corporate =
VPN servers through my system.  I also have a PPTP server listening on =
the local gateway host for other users to connect to our internal =
network from outside.

I have a 2 NIC system.=20

I have an internal interface of WLAN0 and the external interface of =
ETH0.

I have made sure to load the following modules...
ip_conntrack_proto_gre
ip_conntrack_pptp
ip_nat_pptp
ip_nat_proto_gre

I have added the following commands to the rest of my firewall rules

iptables -I INPUT -p 47 -j ACCEPT
iptables -I INPUT -p tcp --dport 1723 -j ACCEPT

iptables -I OUTPUT -p 47 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 1723 -j ACCEPT

iptables -I FORWARD -p 47 -j ACCEPT
iptables -I FORWARD -p tcp --dport 1723 -j ACCEPT

iptables -I FILTER -p 47 -j ACCEPT
iptables -I FILTER -p tcp --dport 1723 -j ACCEPT

I'm masquerading all connections out.

currently the clients can get out and connect properly but the outside =
clients trying to connect to our local system via the PPTP server on the =
gateway box can not get a connection.

I think it has something to do with how I'm routing the connection to =
the local host but I'm not sure what I need to change. Or is this even =
possible?

Any thoughts?

Thanks,
Adam
