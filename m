From: Aleksey Tsalolikhin <atsaloli.tech@gmail.com>
Subject: Re: Should "Transparent web-caching" work with ppp0/pptp? (It 
	doesn't...)
Date: Sat, 25 Apr 2009 06:31:30 -0700
Message-ID: <d17c5b140904250631h4278233dh8989758b38ea2831@mail.gmail.com>
References: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>
	 <49F2D789.6090301@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=WLofuhblTEScSB7x4IxrnJyPavzQ7VYkKaSoYGXaoiI=;
        b=eYNIeM/kt8t7ZYO63Lfryk/fROQw7hJ7Wu0cBgvFlNrnEaog4T24jxnxF9NFvamAzC
         dlS2edgwJ0q/BwqAVJil3By0CidfEvzwnvgN5HasgsBcEQFBBuKKz6KdboUNCeeAr176
         HXMdugRm1OPMQCP9SmGGHfZa9lWGXmq2UgDaY=
In-Reply-To: <49F2D789.6090301@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Dear Pascal,

  Thank you for your reply (Merci).

  Just to restate my issue: =A0I am trying to get outbounds packets
destined for TCP port 80
tunneled through a pptp VPN (out the ppp0 interface).


Diagram of what I am trying to accomplish:

[my server] ---pptp--> [VPN server] --> website

> Where is the squid proxy ?

There is none.  Instead of going through squid, the packets must go
through the VPN.  There is some kind of transparent proxy in the VPN,
because when I route packets destined to a particular website (by
static route using the website's IP address) via the VPN server, the
webserver records HTTP access from the VPN server.

But instead of using select static routes, we want to do this for all
port 80 packets, route them through the VPN server.

[my server] ---pptp--> [VPN server] --> websites


>> Should this work with an ppp0 interface?
>
> Sure. The interface type makes no difference.

Ok.  Here is my trouble:  Connection times out.

# telnet www.google.com 80
Trying 74.125.93.99...
telnet: connect to address 74.125.93.99: Connection timed out

Thanks for explaining about the OUTPUT and the marking.  Here is what
I have now:

My server:  38.98.245.202

pppd: local  IP address 192.168.2.131
pppd: remote IP address 192.168.2.125


[root@vulture ~]# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       tcp  --  anywhere             anywhere            tcp
dpt:http MARK set 0x2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
[root@vulture ~]#


[root@vulture ~]# ip rule ls
0:      from all lookup 255
32765:  from all fwmark 0x2 lookup www.out
32766:  from all lookup main
32767:  from all lookup default
[root@vulture ~]# ip route list table www.out
default via 192.168.2.125 dev ppp0
[root@vulture ~]# ip route
192.168.2.125 dev ppp0  proto kernel  scope link  src 192.168.2.133
69.15.192.18 via 38.98.245.201 dev eth0  src 38.98.245.202
38.98.245.200/29 dev eth0  proto kernel  scope link  src 38.98.245.202
169.254.0.0/16 dev eth0  scope link
default via 38.98.245.201 dev eth0
[root@vulture ~]#

I've checked and disabled source validation aka reverse-path filtering
for ppp0, thanks for that tip!

echo 0 > /proc/sys/net/ipv4/conf/ppp0/rp_filter

I've confirmed source validation is disabled on all interfaces.

(/proc/sys/net/ipv4/conf/all/rp_filter=3D0)

Now my outgoing port 80 connections are hanging...   What can I do next=
, please?

Best,
Aleksey
