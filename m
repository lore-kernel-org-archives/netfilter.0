From: Aleksey Tsalolikhin <atsaloli.tech@gmail.com>
Subject: Should "Transparent web-caching" work with ppp0/pptp? (It doesn't...)
Date: Sat, 25 Apr 2009 00:34:59 -0700
Message-ID: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=D/pG37blQHyI4rw4+stw1k5XkWKI1Z+nXpN/wXAXGOg=;
        b=uk4111N06v/X32IZOgiSxemV4VleK7pBg8hawPx565y7RV50uc+tvc+HAGLLJUUJt4
         IC4H+znZzEiFOwS9pgoX5ZncQe309sF11bCakj2JlySD8eJ2L1mKvgVKWIsFWy8tfl+d
         TskNq9tH6u4U2SDrcEZ3RXjkc8ZsG2PYzo9a8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.  I am trying to get outbounds packets destined for TCP port 80 tunneled
through a pptp VPN (out the ppp0 interface).

I've tried following the example at
http://lartc.org/howto/lartc.cookbook.squid.html
but from the remote web site's viewpoint, the request comes from the
eth0 address
of my server, instead of through the VPN.

Diagram of what I am trying to accomplish:

[my server] ---pptp--> [VPN server] --> website

Should this work with an ppp0 interface?

How do I get help debugging this, please?


My server:  38.98.245.202

pppd: local  IP address 192.168.2.131
pppd: remote IP address 192.168.2.125

[root@vulture ~]# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
MARK       tcp  --  anywhere             anywhere            tcp
dpt:http MARK set 0x2

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

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

I am on CentOS release 5.3 (Final)
Linux 2.6.18-128.1.6.el5 #1 SMP Wed Apr 1 09:19:18 EDT 2009 i686 i686
i386 GNU/Linux

I've tried using PREROUTING instead of OUTPUT, for the mark rule, and
then if I try to connect to port 80 (telnet www.google.com 80), it
just hangs...

If I don't use iptables and instead set a static route for
www.google.com via the VPN server, it works, I can connect and do an
HTTP session (via the VPN).

So is it possible to do route outgoing packets with destination port
80 out a ppp0 interface?

Would appreciate any help in debugging this.

Best,
-at





-- 
Aleksey Tsalolikhin
UNIX System Administrator
"I get stuff done!"
http://www.verticalsysadmin.com/
LinkedIn - http://www.linkedin.com/in/atsaloli
