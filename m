From: Tarak Ranjan <contacttrm@yahoo.co.in>
Subject: RE: Blocking ports for outsider
Date: Wed, 13 Feb 2008 12:13:07 +0530
Message-ID: <1202884987.12351.7.camel@tarak.lk.com>
References: <1202726951.23042.0.camel@tarak.lk.com>
	 <004f01c86cb5$64a933f0$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004f01c86cb5$64a933f0$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org

On Mon, 2008-02-11 at 14:52 +0100, Rob Sterenborg wrote:
> >     I have a mail server which has two interface eth0[internal],
> > eth1[external]. i want certain ports like 25, 110, 995 will
> > be open for
> > outsider as wel as local, and some port 10000, 5666 , will be open =
for
> > local only.. , if anyone help me out regarding this...
> >
> > i'm a mail-system guy,so i'm not very much aware of iptables rules,=
 if
> > anyone give me some documentation links for Mailling System related
> > iptables documentation, that will be helpful for me

> $ipt -P INPUT DROP
> $ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> $ipt -A INPUT -m state --state NEW -i lo -j ACCEPT
> $ipt -A INPUT -m state --state NEW -p tcp -m multiport \
>   --dports 25,110,995 -j ACCEPT
> $ipt -A INPUT -m state --state NEW -s $LAN -p tcp \
>   -m multiport --dports 5666,10000 -j ACCEPT

i have made one iptables rule set for my mailserver, but the thing is
that what i want from my rules, it's not responding in that way i
want... might be some thing wrong with my ruleset.=20


1) Locally incoming ssh should be allowed from 2 local ips
2) 25, 110, 995, 80, 443 should be open for 0/0.
3) 10000, 5666 should be open for LAN[192.168.1.0/24] Network

Those are the things i want..... Here is my ruleset in my MAILSERVER no=
t
in Gateway

# Set default policies
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t mangle
$IPTABLES -X


$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A INPUT -d 127.0.0.0/8 -j REJECT

#$IPTABLES can determine which of these three =E2=80=9Cstates=E2=80=9D =
a packet is
in.This can be #represented by three rules:
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state
NEW -j REJECT --reject-with tcp-reset

$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "New not syn:"

$IPTABLES -A INPUT -m state --state INVALID -j DROP

# smtp  One per second limt -burst rate of FIVE
$IPTABLES -A INPUT -p tcp --dport 25 --syn -m limit --limit 1/s
--limit-burst 5 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 25 --syn -j DROP
$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT
$IPTABLES -A INPUT -m state --state NEW -p tcp -m multiport --dports
110,995,443,80,53 -j ACCEPT
#Ports Allow For 192.168.1.0 Network 783-spamassassin, 3310-clamd ports
$IPTABLES -A INPUT -m state --state NEW -s $LAN -p tcp -m multiport
--dports 5666,10000 -j ACCEPT
#Kill all packets from Outside world claiming to be packets generated
from Internal network.
$IPTABLES -A INPUT -i eth1 -s 192.168.1.0/24 -j REJECT
#Enable SSH and TELNET From 210 & 123
$IPTABLES -A INPUT -p tcp  -s 192.168.1.7 -d $MAIL_IP --dport 22 -j
ACCEPT

#OUTPUT RULES
$IPTABLES -A OUTPUT -o lo -j ACCEPT

#FORWARD RULES
$IPTABLES -A FORWARD -m state --state INVALID -j DROP



reg,

Tarak



