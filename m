From: "Adem" <for-gmane@alicewho.com>
Subject: Re: The "badguy" example in the man page not working (-->"iptables: No chain/target/match by that name")
Date: Fri, 14 Nov 2008 18:48:48 +0100
Message-ID: <gfkds5$ti4$1@ger.gmane.org>
References: <gfk58b$qlv$1@ger.gmane.org> <1226678430.11373.265.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

"Matt Zagrabelny" wrote:
> On Fri, 2008-11-14 at 16:22 +0100, Adem wrote:
> > The following example from the man page doesn't work on my box:
> > 
> >   iptables -A FORWARD -m recent --name badguy --rcheck --seconds 60 -j DROP
> >   iptables -A FORWARD -p tcp -i eth0 --dport 139 -m recent --name badguy --set -j DROP
> 
> I see 'eth0' in your rule, but below there is no eth0.

Oops. that was just a cut&paste error, I actually had changed it,
tried everything, but w/o success.
Any other ideas what it might be?

BTW, it is a virtual private server (VPS) box, there is nothing under /boot.

Here the version info:

# uname -r
2.6.9-023stab048.4-smp

# iptables --version
iptables v1.3.6

And here the other rules iptables has accepted:

# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     0    --  anywhere             anywhere            state RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp flags:!FIN,SYN,RST,ACK/SYN reject-with tcp-reset
DROP       0    --  anywhere             anywhere            state INVALID
ACCEPT     0    --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:8443
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:8880
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:www
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:https
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:submission
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssmtp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3s
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap2
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imaps
DROP       tcp  --  anywhere             anywhere            tcp dpt:poppassd
DROP       tcp  --  anywhere             anywhere            tcp dpt:mysql
DROP       tcp  --  anywhere             anywhere            tcp dpt:postgresql
DROP       tcp  --  anywhere             anywhere            tcp dpt:9008
DROP       tcp  --  anywhere             anywhere            tcp dpt:9080
DROP       udp  --  anywhere             anywhere            udp dpt:netbios-ns
DROP       udp  --  anywhere             anywhere            udp dpt:netbios-dgm
DROP       tcp  --  anywhere             anywhere            tcp dpt:netbios-ssn
DROP       tcp  --  anywhere             anywhere            tcp dpt:microsoft-ds
DROP       udp  --  anywhere             anywhere            udp dpt:openvpn
ACCEPT     udp  --  anywhere             anywhere            udp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:domain
ACCEPT     icmp --  anywhere             anywhere            icmp type 8 code 0
DROP       0    --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     0    --  anywhere             anywhere            state RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp flags:!FIN,SYN,RST,ACK/SYN reject-with tcp-reset
DROP       0    --  anywhere             anywhere            state INVALID
ACCEPT     0    --  anywhere             anywhere
DROP       0    --  anywhere             anywhere

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     0    --  anywhere             anywhere            state RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp flags:!FIN,SYN,RST,ACK/SYN reject-with tcp-reset
DROP       0    --  anywhere             anywhere            state INVALID
ACCEPT     0    --  anywhere             anywhere
ACCEPT     0    --  anywhere             anywhere


> > It says: "iptables: No chain/target/match by that name"
> > 
> > What could be the reason?
> > 
> > My ifconfig:
> > 
> > lo        Link encap:Local Loopback
> >           inet addr:127.0.0.1  Mask:255.0.0.0
> >           UP LOOPBACK RUNNING  MTU:16436  Metric:1
> >           RX packets:382878 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:382868 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:0
> >           RX bytes:3307823766 (3.0 GiB)  TX bytes:78410937 (74.7 MiB)
> > 
> > venet0    Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
> >           inet addr:127.0.0.1  P-t-P:127.0.0.1  Bcast:0.0.0.0  Mask:255.255.255.255
> >           UP BROADCAST POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1
> >           RX packets:109018 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:101974 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:0
> >           RX bytes:49437708 (47.1 MiB)  TX bytes:49733010 (47.4 MiB)
> > 
> > venet0:0  Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
> >           inet addr:87.x.x.x  P-t-P:87.x.x.x  Bcast:0.0.0.0  Mask:255.255.255.255
> >           UP BROADCAST POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1


