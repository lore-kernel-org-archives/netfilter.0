From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: fxp doesnt work & connection tracking
Date: Sat, 14 Sep 2002 12:22:14 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209141218320.20369-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi!

if i apply these rules, then incoming fxp's dont work (outgoing is still 
work).. any idea?
:
iptables -N szabalyok
iptables -A szabalyok -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A szabalyok -p tcp --dport 21 -d <ip> -j ACCEPT
iptables -A szabalyok -p tcp --dport 22 -d <ip> -j ACCEPT
iptables -A szabalyok -p tcp --dport 1024: -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A szabalyok -j DROP
iptables -A INPUT -j szabalyok
iptables -A FORWARD -j szabalyok

other:
before that, i did:
modprobe ip_conntrack_ftp ports=21,etc,etc
modprobe ip_conntrack_irc ports=6667,6668,6669,7000,31337

but in lsmod i see:
ip_conntrack_irc        2400   0  (unused)
ip_conntrack_ftp        3136   0  (unused)

why is that? if i understand the howto correctly, it should be unused..
any idea?

NagyZ



