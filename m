From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Marking packets and using a different routing table from main
Date: Wed, 11 Mar 2009 15:55:51 +0100
Message-ID: <145d4e1a0903110755y26a85020id89d00ee2fe649f0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=oiBP10Qf6jxusFwJsjdGzuQK2iWTsByY4DHDqbs1toU=;
        b=KPD0nTsFaxMpy9uG3S3yw66v6lplh/bSgXtpUBpT+v/SCUtWkfj9A20fpg2S0AilPK
         xDSgn3HLeoSeVY0p6GWIUn8Wh5AOjUD3pqaiv8M50p0wckrrCbTe0V75GXFDGlsj4r/z
         9vvDPGtHu1yYV+ff7+rF4gXPnB9Rwusv1vTLw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I'm trying to route some network traffic to be ouput from a specific
interface in my host but I can't get it working.

I want RTSP outcoming traffic from my host being output through the
interface (let it be) ra0, but I want to do it configuring packets to
follow the routing table 1 instead the main one, so I can configure
multiple interfaces with different routing tables and switch marking
rules instead of changing the main routing table.

This is what I do:

1. Mark traffic:

iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --set-mark 1


2. Configure interface:

ifconfig ra0 up 192.168.0.2/24 netmask 255.255.255.0
iwconfig ra0 essid network_X


3. Add ip rule:

ip rule add fwmark 1 table 1 prio 1


4. Configure routing table 1:

ip route add 192.168.0.0/24 dev ra0
ip route add default via 192.168.0.1 dev ra0


As soon as I have this set up, traffic is properly sent, but I have
noted that this is because I've got in the main routing table
configured:

192.168.0.0/24 dev ra0  proto kernel  scope link  src 192.168.0.2
default via 192.168.0.1 dev ra0


Then, if I remove the default line in the main table, the traffic is
lost (not sent). I've tried with TCP, UDP and ICMP traffic and I get
the same results. I can't understand why the packets don't follow the
configured rules (that's routing table 1) instead of the main one, as
I have marked packets and configured rules and routing tables in order
to do it.

I have also noted that if I add a prohibit rule in the rule table,
marked packets are not sent (that's ok), so marked packets follow
prohibit rules but not other tables than the main one.


I'm using Ubuntu 8.10 (kernel 2.6.27-11) and iptables 1.4.0. These are
the modules I have loaded:

$ lsmod | grep ip
iptable_nat            13448  0
nf_nat                 25368  1 iptable_nat
nf_conntrack_ipv4      21900  3 iptable_nat,nf_nat
nf_conntrack           72032  3 iptable_nat,nf_nat,nf_conntrack_ipv4
iptable_mangle         10880  1
ipv6                  263972  10
iptable_filter         10752  0
ip_tables              19600  3 iptable_nat,iptable_mangle,iptable_filter
x_tables               22916  5 xt_DSCP,xt_MARK,xt_tcpudp,iptable_nat,ip_tables


I would like to know if anyone has faced some related issues or if
anyone can help me in order to solve this. Any help would be much
appreciated.


Thanks for your time,
Javi
