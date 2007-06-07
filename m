From: Ian Moyce <ian@ianmoyce.co.uk>
Subject: Combining rules
Date: Thu, 7 Jun 2007 10:18:55 +0100
Message-ID: <2B31733C-BA34-44B8-AB44-FBBFA81BE9B0@ianmoyce.co.uk>
Mime-Version: 1.0 (Apple Message framework v752.3)
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I am trying to combine a load of ip rules, but I am having problems =20
fathoming it out.

I run a VPS with openVPN. I have the following rules:

iptables -t nat -A POSTROUTING -s 192.168.2.3 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.4 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.5 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.6 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.7 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.8 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.9 -j SNAT --to =20
85.234.144.236
iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to =20
85.234.144.236

Which works great. However, I am wanting to pass any IP traffic from =20
the 192.168.2.x range be passed through a socks proxy on a specific =20
port, which I have been told can work with:

#!/bin/sh

LOCAL_NET=3D192.168.2.0/24
/sbin/iptables -F
/sbin/iptables -t nat -F
/sbin/iptables -P INPUT ACCEPT
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -t nat -P OUTPUT ACCEPT
/sbin/iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to-=20
destination 127.0.0.1:5353
/sbin/iptables -t nat -A OUTPUT -o lo -j RETURN
/sbin/iptables -t nat -A OUTPUT -d 127.0.0.1 -j RETURN
/sbin/iptables -t nat -A OUTPUT -d $LOCAL_NET -j RETURN
/sbin/iptables -t nat -A OUTPUT -m owner --uid-owner 103 -j RETURN
/sbin/iptables -t nat -A OUTPUT -p tcp --syn -j DNAT --to-destination =20=

127.0.0.1:1211
/sbin/iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT
/sbin/iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
/sbin/iptables -A OUTPUT -d $LOCAL_NET -j ACCEPT
/sbin/iptables -A OUTPUT -m owner --uid-owner 103 -j ACCEPT
/sbin/iptables -A OUTPUT -j LOG
/sbin/iptables -A OUTPUT -j REJECT


If someone is able to help me figure this out, I am offerring a =20
reward of =A350 (about $100) as it is driving me insane!!!

Thanks

Andy Dixon=

