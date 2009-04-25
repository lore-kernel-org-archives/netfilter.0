From: Aleksey Tsalolikhin <atsaloli.tech@gmail.com>
Subject: Re: Should "Transparent web-caching" work with ppp0/pptp? (It 
	doesn't...)
Date: Sat, 25 Apr 2009 08:11:31 -0700
Message-ID: <d17c5b140904250811j401614bbje53cce5aedb14fa7@mail.gmail.com>
References: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>
	 <49F2D789.6090301@plouf.fr.eu.org>
	 <d17c5b140904250631h4278233dh8989758b38ea2831@mail.gmail.com>
	 <49F32073.9040207@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=zezpzcxzoSybi3qD91g8npxlYXW25cTnFzHdPx9vFIA=;
        b=e3Y0RC/Y8ChQoIlIxdgCz35BFgn5ucaKJHY/Y0kXnMVvNcKrkUlDnaEts6b/6TSBa6
         bZO/Xt77WIzC3BxTm3F+HpMg6jB7vwr6RcGroUdeF9wsLfHn6xojxCGMossi2ugUeGz0
         RO5LjRGcInAp7PJcUbwe/QA5pd3erw+7uSQns=
In-Reply-To: <49F32073.9040207@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear Pascal,


> As a test, you can try to force the source address in the telnet command
> line :
>
> $ telnet -b 192.168.2.131 www.google.com 80
>
> If it works, you know what to do : SNAT or MASQUERADE on ppp0.


[root@vulture ~]#  telnet -b 192.168.2.131 www.google.com 80
telnet: invalid option -- b
Usage: telnet  [-8] [-E] [-K] [-L] [-X atype] [-a] [-d] [-e char] [-k realm]
        [-l user] [-f/-F] [-n tracefile] [-r] [-x] [host-name [port]]
[root@vulture ~]#


[root@vulture ~]# uname -a
Linux vulture.coreitpro.com 2.6.18-128.1.6.el5 #1 SMP Wed Apr 1
09:19:18 EDT 2009 i686 i686 i386 GNU/Linux
[root@vulture ~]# cat /etc/redhat-release
CentOS release 5.3 (Final)
[root@vulture ~]#

However, I've run tcpdump as you suggested and the packets are being
routed out the ppp0 interface!

[root@vulture ~]# tcpdump -i ppp0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
10:32:21.908975 IP vulture.coreitpro.com.33352 >
qw-in-f104.google.com.http: S 1458102499:1458102499(0) win 5840 <mss
1460,sackOK,timestamp 27190999 0,nop,wscale 7>
10:32:24.910107 IP vulture.coreitpro.com.33352 >
qw-in-f104.google.com.http: S 1458102499:1458102499(0) win 5840 <mss
1460,sackOK,timestamp 27194000 0,nop,wscale 7>
10:32:30.913391 IP vulture.coreitpro.com.33352 >
qw-in-f104.google.com.http: S 1458102499:1458102499(0) win 5840 <mss
1460,sackOK,timestamp 27200000 0,nop,wscale 7>


"tcpdump -i eth0 port 80" shows no return packets.   (obviously,
neither does ppp0)

I've tried running tcpdump on the web server as well, and I don't see
ANY packets coming in from the VPN server when I run "telnet website
80" on the pptp client... (the CentOS box).

Could I be running into 1a?

1a) the PPTP server sees a source address different from the remote
endpoint address and drops the packet because of rp_filter=1 or
iptables filtering. So the connection times out.

If I don't use iptables, and just set up a static route for that web
site via the PPTP server, and telnet to website 80, it works!!
tcpdump shows the packets are addressed to the website and it answers
back:

10:58:39.759071 IP 192.168.2.133.60744 > qw-in-f104.google.com.http: S
3121597650:3121597650(0) win 5424 <mss 1356,sackOK,timestamp 28768118
0,nop,wscale 7>
10:58:39.855024 IP qw-in-f104.google.com.http > 192.168.2.133.60744: S
3367683736:3367683736(0) ack 3121597651 win 5672 <mss
1430,sackOK,timestamp 1670282111 28768118,nop,wscale 6>
10:58:39.855055 IP 192.168.2.133.60744 > qw-in-f104.google.com.http: .
ack 1 win 43 <nop,nop,timestamp 28768214 1670282111>


So why does it work with static route and doesn't work with the alt
routing table  trick?  The only difference I can see is, in the static
route case, the packets are a little bit smaller.

Any ideas?

Thanks,
Aleksey


P.S. I am including my previous post below for reference.

 I am trying to get outbounds packets
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

(/proc/sys/net/ipv4/conf/all/rp_filter=0)
