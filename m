From: PayalR <payal@hotpop.com>
Subject: Re: are these enough now?
Date: Fri, 4 Oct 2002 20:52:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33980.3728311837$1033745267@news.gmane.org>
References: <200210041218.26636@.> <200210041648.00792@.> <200210041309.g94D9ML10904@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210041309.g94D9ML10904@vulcan.rissington.net>
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
To: netfilter@lists.netfilter.org

Hello all,
Thanks a lot for the time and patience. I have written the script and am
posting it here. If such kind of posting is not allowed please tell, so
next time I will post it on a webpage and paste the link. But since ppl.
might be reluctant to launch there browsers for this thing, I took the
liberty of pasting it here.
I have a single PC with all servers on the same machine.
I am not forwading anything.

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

[Is this OUTPUT rule OK?]

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 23 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 161 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 162 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 3306 -j ACCEPT

iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 161 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 162 -j ACCEPT

[udp for these are sufficent I guess]

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

[please see if the state rule looks OK?]

iptables -A OUTPUT -i eth0 -p tcp --sport 21 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 22 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 23 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 25 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 110 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 143 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 161 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 162 -j ACCEPT
iptables -A OUTPUT -i eth0 -p tcp --sport 3306 -j ACCEPT

[is the tag --sport appropriate here? or do I have to use --dport? I alwa=
ys=20
get confused between the usage of these two :)]

iptables -A OUTPUT -i eth0 -p udp --sport 53 -j ACCEPT
iptables -A OUTPUT -i eth0 -p udp --sport 161 -j ACCEPT
iptables -A OUTPUT -i eth0 -p udp --sport 162 -j ACCEPT

[udp here also seems enough]

Shall I block ICMP? I intend to have some logging for SMTP, HTTP and POP3=
=2E
I have yet to formulate the rules for them. I will do it in day or two an=
d let
ask here for opinion.

Also, as Anthony said I am looking forward for pointers on slapper. Or yo=
u=20
might just tell how do I know where the service is which is accessing por=
t=20
2002, plain UNIX :)

Thanks a lot in advance and eagerly waiting for your comments.
Bye.
-Payal

p.s I will drop the telnet also in a day or two :)

