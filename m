From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: problem with proxy-arp
Date: Thu, 12 Jun 2003 14:43:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E7E@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Jet (jchan@trusecure.com)" <yenjet.chan@eglobal.com.my>, Steven Mugassa <steven.mugassa@intafrica.com>
Cc: netfilter@lists.samba.org

I actually prefer to use "ip addr add" as good practice for the reason =
that it makes rules alot easier to write so you don't have to worry =
about eth0:0 or was that eth0:1 ..etc..etc.. just eth0 with 2 IPs =
hanging off it.

This is the real way to bind multiple addresses to a NIC.. ie.

#ip addr show dev eth1
4: eth1: <BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc pfifo_fast qlen =
100
    link/ether 52:54:05:e3:08:9a brd ff:ff:ff:ff:ff:ff
    inet 10.2.1.1/30 brd 10.2.1.3 scope global eth1
    inet 203.111.79.114/28 scope global eth1

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Jet (jchan@trusecure.com) [mailto:yenjet.chan@eglobal.com.my]
Sent: Thursday, June 12, 2003 1:29 PM
To: Steven Mugassa
Cc: netfilter@lists.samba.org
Subject: Re: problem with proxy-arp


At router B, try this (instead of using the arp command)

ifconfig eth1:10 10.10.10.10 netmask 255.255.255.0 up

The idea is to create an alias interface (I'm using 10 but you can use =
any)
at interface eth1 of router B.


--
Jet (Security Analyst)
http://www.secure-ip.com

