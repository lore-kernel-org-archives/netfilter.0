From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: fxp doesnt work & connection tracking
Date: Sat, 14 Sep 2002 03:58:22 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPGEKBCOAA.stewart.thompson@shaw.ca>
References: <Pine.LNX.4.44.0209141218320.20369-100000@server.piarista-kkt.sulinet.hu>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.44.0209141218320.20369-100000@server.piarista-kkt.sulinet.hu>
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
To: NagyZ <nagyz@piarista-kkt.sulinet.hu>, netfilter@lists.netfilter.org

Hi:

	I don't see any rules to accept new connections. You are only
allowing Established and Related connections. So another machine will
never be able to start a connection. I am not familiar with fxp. Is the
connection to your firewall machine, or forwarded to an internal machine?
The output might work because I don't see any rules here to prevent outgoing
connections. You might have to post your whole rule set so we can see
exactly what you are trying to do.

Stu.......


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of NagyZ
Sent: September 14, 2002 3:22 AM
To: netfilter@lists.netfilter.org
Subject: fxp doesnt work & connection tracking

hi!

if i apply these rules, then incoming fxp's dont work (outgoing is still
work).. any idea?
:
iptables -N szabalyok
iptables -A szabalyok -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A szabalyok -p tcp --dport 21 -d <ip> -j ACCEPT
iptables -A szabalyok -p tcp --dport 22 -d <ip> -j ACCEPT
iptables -A szabalyok -p tcp --dport 1024: -m state --state
ESTABLISHED,RELATED -j ACCEPT
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




