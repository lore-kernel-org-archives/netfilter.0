From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: FTP failed
Date: Fri, 5 Jul 2002 14:05:34 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA246@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Mitsuo HAMADA' <mhamada@qwanty.com>, netfilter@lists.samba.org

Umm... I don't have incoming rules for ftp and only if I run an FTP server..
all you need is the ftp connection tracking, RELATED,ESTABLISHED Accepted
and that's all..

if you want to limit them from other protocols then MASQ only port 21...

All the users have to do is use passive mode on their FTP client (Don't use
DOS ftp, it's somehow broken from my own tests)..

$IPTABLES -A INPUT -j DROP
$IPTABLES -A FORWARD -j DROP
/sbin/insmod iptables                   >/dev/null 2>&1
/sbin/insmod iptables_nat               >/dev/null 2>&1
/sbin/insmod iptables_filter            >/dev/null 2>&1
/sbin/insmod ip_MASQUERADE              >/dev/null 2>&1
/sbin/insmod ip_conntrack               >/dev/null 2>&1
/sbin/insmod ip_conntrack_ftp           >/dev/null 2>&1

$IPTABLES -A POSTROUTING -o $EXTDEV -t nat -s $INTWK -p tcp --dport 21 -j
MASQUERADE # ALL Workstations
$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A INPUT -i $INTDEV -j ACCEPT
$IPTABLES -A FORWARD -i eth0 -j ACCEPT
$IPTABLES -A INPUT -i $EXTDEV -p tcp -m state --state ESTABLISHED,RELATED -j
ACCEPT 

I think that's about all I needed.. forgive me if I've missed some..

BTW: Why is it I'm seeing so many people using the ! so much?? I actually
never use it except for possibly #!/bin/bash and that's it.

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Mitsuo HAMADA [mailto:mhamada@qwanty.com]
Sent: Friday, 05 July 2002 1:00 PM
To: netfilter@lists.samba.org
Subject: FTP failed



+-----------+         +------------+
| 40 clients|---------|Linux Server|--------Internet
+-----------+         +------------+
                     eth1          eth0

When all 40 clients ara getting files from ftp server from the Internet,
ftp transfer failed on some of 40 clients.
At this time, I found "EXPECTING: proto=6 src=xxx.xxx.xxx.xxx 
dst=xxx.xxx.xxx.xxx sport=0 dport=1039" in ip_conntrack.

How can I fix this problem?

Our filter setting is written below.

iptables -A INPUT -i ! lo -j DROP
iptables -A OUTPUT -o ! lo -j DROP
iptables -A FORWARD -j DROP
iptables -N good-bad
iptables -N bad-good
iptables -A FORWARD -i eth1 -o eth0 -j good-bad
iptables -A FORWARD -i eth0 -o eth1 -j bad-good
iptables -A FORWARD -j LOG
iptables -A good-bad -p tcp --dport ftp -j ACCEPT
iptables -A good-bad -p tcp --dport ftp-data -j ACCEPT
iptables -A good-bad -j DROP
iptables -A bad-good -p tcp --sport ftp -j ACCEPT
iptables -A bad-good -p tcp --sport ftp-data -j ACCEPT
iptables -A bad-good -j DROP

iptables -N bad-if
iptables -N good-if
iptables -A INPUT -i eth0 -j bad-if
iptables -A INPUT -i eth1 -j good-if
iptables -A bad-if -p tcp --sport ftp ! --syn -j ACCEPT
iptables -A bad-if -p tcp --sport ftp-data -j ACCEPT
iptables -A bad-if -p tcp --dport ftp -j ACCEPT
iptables -A bad-if -p tcp --dport ftp-data -j ACCEPT
iptables -A bad-if -j DROP
iptables -A good-if -p tcp --dport ftp -j ACCEPT
iptables -A good-if -p tcp --dport ftp-data -j ACCEPT
iptables -A good-if -p DROP

iptables -D INPUT 1
iptables -D FORWARD 1
iptables -D OUTPUT 1

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

--
Mitsuo HAMADA

