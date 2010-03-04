From: Barry Smoke <Barry.Smoke@arklegaudit.gov>
Subject: untrusted internal(squid/vpn forwarding)
Date: Thu, 4 Mar 2010 16:20:10 -0600
Message-ID: <250999BCC487ED429E1673DCFA26CDCC0C5F47020B@postman>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

I've had an iptables script working for years, but with some recent viruses and such slipping in, and also we've been asked to implement a transparent squid...I got to  looking at the UTIN (untrusted internal network) script as an example...and my head is spinning, I can't see where I have gone wrong...


Here is what we are trying to accomplish:
internal lan, and external internet interfaces aliased to $LAN_IFACE, and $INET_IFACE


1)            a)accept only port 80(apache running a squid reporting engine), and ssh(22) on the squid gateway/firewall
                b)don't allow either of those on the outside interface

here are the rules I've used for this:
$IPTABLES -A inputrules -p TCP -i $LAN_IFACE -s 10.0.0.0/16 -d 10.0.50.16 --dport 22 -j ACCEPT
$IPTABLES -A inputrules -p TCP -i $LAN_IFACE -s 10.0.0.0/16 -d 10.0.50.16 --dport 80 -j ACCEPT

2)            prerouting sstp, and pptp vpn's to internal(working 100%) with these rules:
/sbin/iptables -t nat -A PREROUTING -p tcp -s 0/0 -d 170.94.21.20 --dport 443 -j DNAT  --to-destination 10.0.0.16:443
/sbin/iptables -t nat -A PREROUTING -p tcp -s 0/0 -d 170.94.21.20 --dport 1723 -j DNAT  --to-destination 10.0.0.16:1723
/sbin/iptables -t nat -A PREROUTING -p 47 -s 0/0 -d 170.94.21.20 -j DNAT  --to 10.0.0.16

3)            redirect squid(but allow 80 requests to the box itself)
$IPTABLES -t nat -A PREROUTING -p tcp ! -d 10.0.50.16 -i $LAN_IFACE --dport 80  -j REDIRECT --to-port 3128

4)            block any internal requests, but what we allow

5)            forward 443(and possible ssh/ping out)
$IPTABLES -A FORWARD -p tcp --dport 443 -i $LAN_IFACE -j ACCEPT



6)            snat everything allowed out.
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

entire script at:
http://outside.arklegaudit.gov/rc.firewallUITN.sh

vpn forwarding works, 443 works, 80, I get a single entry in squid log, but nothing else.

Thanks in advance for any help, or suggestions.
Barry Smoke
Network Administrator
AR Division of Legislative Audit




