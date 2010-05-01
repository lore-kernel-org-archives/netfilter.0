From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: What's going on with my iptables?
Date: Sat, 1 May 2010 23:10:25 +0200
Message-ID: <00bb152b4be1b49181900acf571ab85f.squirrel@webmail.vp44.net>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=vp44.com; h=message-id
	:date:subject:from:to:reply-to:mime-version:content-type:
	content-transfer-encoding; s=sel1; bh=CkiHItVzrE1m73kYjPmp9Jxr7x
	A=; b=afLrqGjIDURjFa1dhwGP1nBVCyyzDAL29MxEuWvgYvrpgpKvaQ9WNw1v+3
	qrbhigMwp93Lgpjh3FCGDy+JrzI7RWwOk/1XnpJc1zu+vvN0NX1Z20wyUe47GGu2
	yj7J38UonCCMbyjfLdqKNOMe5iw/8Nih7iUSLD0kBg3w0AXlA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all.
Couple years ago I set up a very basic script to have a machine (running
Debian SID) on my network to act as a router. Two network interfaces, one
with a public IP and the other on the local LAN subnet. It does NAT as
well
as open some inbound ports (SSH, WWW).
Yesterday, at roughly 4PM, the firewall setup stopped working. I was still
able to forward packets from a LAN client, but any connection
originating from the box itself could not be established.
I tried ping and traceroute but none of them went through.

This is my firewall script:

> #!/bin/sh
>
> # Interface connected to Internet
> INTERNET="eth1"
>
> # Address connected to LAN
> LOCAL="10.0.1.0/24"
>
> # OpenVPN
> OV="172.16.0.0/16"
>
> # Clean old firewall
> iptables -F
> iptables -X
> iptables -t nat -F
> iptables -t nat -X
> iptables -t mangle -F
> iptables -t mangle -X
>
> # Load IPTABLES modules for NAT and IP conntrack support
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
>
> # Enable Forwarding
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> # Enable Munin stats
> iptables -A INPUT -d PUBIP
> iptables -A OUTPUT -s PUBIP
> iptables -A FORWARD -i eth1
>
> iptables -A INPUT -d 10.0.1.2
> iptables -A OUTPUT -s 10.0.1.2
> #iptables -A FORWARD -s 10.0.1.2
> iptables -A FORWARD -i eth0
>
> # Setting default filter policy
> iptables -P INPUT DROP
> iptables -P OUTPUT ACCEPT
>
> # Unlimited access to loop back
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>
> # Allow UDP, DNS and Passive FTP
> iptables -A INPUT -i $INTERNET -m state --state ESTABLISHED,RELATED -j
ACCEPT
>
> # Accept some inbound services
> # HTTP
> iptables -A INPUT -j ACCEPT -p tcp --destination-port 80 -i eth1
>
> # SSH
> iptables -A INPUT -j ACCEPT -p tcp --destination-port 22 -i eth1
>
> # Mediabox P2P
> iptables -A FORWARD -i $INTERNET -p tcp --dport 9500 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp -i $INTERNET --dport 9500 -j DNAT
--to-destination 10.0.1.11
> iptables -A FORWARD -i $INTERNET -p tcp --dport 8112 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp -i $INTERNET --dport 8112 -j DNAT
--to-destination 10.0.1.11
>
> # block P2P
> #iptables -A FORWARD -m ipp2p --ipp2p -j DROP
> #iptables -A INPUT -m ipp2p --ipp2p -j DROP
> #iptables -A OUTPUT -m ipp2p --ipp2p -j DROP
>
> # set this system as a router for Rest of LAN
> iptables -t nat -A POSTROUTING -o $INTERNET -j MASQUERADE
> iptables -A FORWARD -s $LOCAL -j ACCEPT
>
> # unlimited access to LAN
> iptables -A INPUT -s $LOCAL -j ACCEPT
> iptables -A OUTPUT -s $LOCAL -j ACCEPT
>
> # unlimited access to OPENVPN
> iptables -A INPUT -s $OV -j ACCEPT
> iptables -A OUTPUT -s $OV -j ACCEPT
>
> # DROP everything and Log it
> #iptables -A INPUT -j LOG
> iptables -A INPUT -j DROP

Now I can get it to work only by commenting out the last line (iptables
-A INPUT -j DROP). But that defies the purpose of a firewall, doesn't
it?
What the heck happened last afternoon??

-JK

