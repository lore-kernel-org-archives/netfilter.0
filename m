From: Mitsuo HAMADA <mhamada@qwanty.com>
Subject: FTP failed
Date: Fri, 05 Jul 2002 12:00:18 +0900 (JST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1025838018.3d250bc21ca94@skyblue.qwanty.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org


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

