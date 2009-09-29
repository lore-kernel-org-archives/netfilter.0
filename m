From: Bill Hendrickson <wjhendrickson@gmail.com>
Subject: SSH Port Forwarding with iptables
Date: Tue, 29 Sep 2009 11:16:45 -0400
Message-ID: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=ypoZU8n2w4WU0gVWBYY616gLGp8FiINlTKoPiLszNgw=;
        b=UoVyYJZL5WQ0+3fo6E4U8p28g9Bq7UvnC+0+/CP+82GFuwDjurjnCKgsuRYYEevn3z
         Nlj9ijRICD2x6I5NkaH1n/O1H51t6TnA8mYK6AjFqY9GocbLnRodRzqxtDIlqWv3rsLn
         fs4GJ+B6jzFB2flvgU8/Que5fz5Xi51GtciZk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter list <netfilter@vger.kernel.org>

Hey list,

I'm having trouble setting up port forwarding using iptables.  This is
my first attempt so I'm not surprised.  I want to have a dual-NIC
linux server set up to take incoming SSH requests on a non-standard
port, and forward them to an internal server running SSH on the
standard port.  I actually need to have two internal servers set up
this way, and handling HTTP redirects as well, but I'll settle for one
working SSH server.


This is my setup:

EXTERNAL_PC<===>SWITCH<===>GATEWAY_SVR<== x/o ==>INTERNAL_SVR

EXTERNAL_PC
eth0:172.17.17.9

SWITCH:
Linksys SD2008 (no ipaddr)

GATEWAY_SVR
eth0:172.17.17.165
eth1:172.16.0.165

INTERNAL_SVR
eth0:172.16.0.101


I poured thru tutorials and other googled bounty, and this is what I
came up with for my iptables script (hand-typed, not cut-and-paste):

<<<<<<<<<<<<<<>>>>>>>>>>>>
#!/bin/bash

modprobe iptable_nat
echo 1 > /proc/sys/net/ipv4/ip_forward

EXT_IFACE="eth0"
EXT_IP="172.17.17.165"
INT_IFACE="eth1"

SSH_IP="172.16.0.101"
SSH_PORT="2203"

IPT="/sbin/iptables"
$IPT -F
$IPT -F -t nat
$IPT -X

$IPT -A OUTPUT -o $EXT_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A OUTPUT -o $INT_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT

# wide open, for testing...
$IPT -t nat -P PREROUTING ACCEPT
$IPT -t nat -P POSTROUTING ACCEPT
$IPT -t nat -P OUTPUT ACCEPT

$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -i lo -j ACCEPT

$IPT -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP --dport
$SSH_PORT --sport 1024:65535 -j DNAT --to $SSH_HOST:22
$IPT -A FORWARD -p tcp -i $EXT_IFACE -o $INT_IFACE -d $SSH_HOST
--dport $SSH_PORT --sport 1024:65535 -m state --state NEW -j ACCEPT

$IPT -A FORWARD -j LOG --log-prefix "meh "

<<<<<<<<<<<<<<>>>>>>>>>>>>

All 3 boxes are running Fedora 8.  All three boxes are set up for
static IP: there is no default gateway defined for any box, and the
netmask for all three is 255.255.255.0.  There is no DNS/internet
involved (at least /etc/resolv.conf is empty).  TCP_wrappers are
disabled.  I can successfully SSH from GATEWAY_SVR to INTERNAL_SVR no
problem.  I can also SSH from EXTERNAL_PC to GATEWAY_SVR no problem.
But when I try to SSH from EXTERNAL_PC directly to INTERNAL_SVR, via
the redirected port, e.g.:

root@EXTERNAL_PC # ssh -p 2203 172.17.17.165

it just hangs, until SSH times out.  I have Wireshark running on
INTERNAL_SVR, so I know the packets are getting there.  They just seem
to get stuck on the return path, at the GATEWAY_SVR box.

This is what is getting logged on GATEWAY_SVR, in /var/log/messages:

meh IN=eth0 OUT=eth1 SRC=172.17.17.9 DST=172.16.0.101 LEN=60 TOS=0x00
PREC=0x00 TTL=63 ID=53921 DF PROTO=TCP SPT=34718 DPT=22 WINDOW=5840
RES=0x00 SYN URGP=0
meh IN=eth0 OUT=eth1 SRC=172.17.17.9 DST=172.16.0.101 LEN=44 TOS=0x00
PREC=0x00 TTL=45 ID=24728 PROTO=TCP SPT=58967 DPT=22 WINDOW=3072
RES=0x00 SYN URGP=0
meh IN=eth0 OUT=eth1 SRC=172.17.17.9 DST=172.16.0.101 LEN=44 TOS=0x00
PREC=0x00 TTL=46 ID=20175 PROTO=TCP SPT=58968 DPT=22 WINDOW=4096
RES=0x00 SYN URGP=0

If I nmap port 2203 on GATEWAY_SVR from EXTERNAL_PC, it reports the
state as "filtered".

The infuriating thing is, I had it working briefly.  Then I tried to
add two more internal SSH servers, but those dogs did not hunt - they
were "filtered", although the first one still worked.  Then I dorked
things all up, and can get nothing to work now.

Can anyone help?

-bill
