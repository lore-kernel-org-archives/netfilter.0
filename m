From: =?iso-8859-1?Q?Ant=F3nio_Godinho?= <to@mail.isec.pt>
Subject: Various questions
Date: Mon, 28 Jul 2003 15:14:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c35512$838e4fe0$5f50a8c0@isec.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hya,

	I'm kinda new at iptables so I've been using scripts that I've
downloaded from the internet and latelly using shorewall.
	Trying to learn more and improve what I have I've several
questions about iptables.=20
	I'm running a pentium 166 with 32M ram has my home gateway. Eth1
it's my dhcp connection to the cable modem/internet and eth0 my
connection to internal switch 10.10.10.0/24 with 4 computers inside.
	I've made a script to catch all rules that shorewall sends to
iptables and I'll start from that on. I'll post the rules at the end of
the email.
=09
	I think that each redundante rule I add will decrease the
performance of my gateway, since I've an old computer and not enought
money to upgrade it...

	1. Like you can see on the list of rules below I've lots of
rules loging and after droping invalid ( internal IP's ) comming from
the internet:

iptables -A rfc1918 -s 172.16.0.0/12 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 172.16.0.0/12 -j logdrop
=09
	Is it possible to DROP all those IP's in one rule? ( I don't
need to log them since they are invalid anyway )


	2. I've this in one of the rules:

iptables -A rfc1918 -m conntrack --ctorigdst 255.255.255.255 -j RETURN

	RETURN isn't a user defined chain, and I don't see any info
about this on the how-to's, can someone explain me what that does?


	3. This is defining priority ports? Like shaping the traffic?

iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --dport ssh -j TOS
--set-tos 16
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --dport ssh -j TOS
--set-tos 16
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --sport ssh -j TOS
--set-tos 16
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --sport ssh -j TOS
--set-tos 16

	3. Since all my traffic from intranet to gateway loc2fw chain
it's from trusted ip's ( it's from me or any member of my famely ),
that's one of the things I can remove, anyone has any other advice or
improvent to the listo f rules I've bellow?



	Sorry for this really long email, thanx,

		Ant=F3nio Godinho


###		Rules
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -F
iptables -X
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p ! icmp -m state --state INVALID -j DROP
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p ! icmp -m state --state INVALID -j DROP
iptables -A FORWARD -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -p ! icmp -m state --state INVALID -j DROP
iptables -N newnotsyn
iptables -A newnotsyn -j LOG --log-level info --log-prefix
FIREWALL:newnotsyn:DROP:
iptables -A newnotsyn -j DROP
iptables -N icmpdef
iptables -N common
iptables -N reject
iptables -N dynamic
iptables -N eth1_fwd
iptables -A eth1_fwd -j dynamic
iptables -N eth1_in
iptables -A eth1_in -j dynamic
iptables -N eth0_fwd
iptables -A eth0_fwd -j dynamic
iptables -N eth0_in
iptables -A eth0_in -j dynamic
iptables -A reject -p tcp -j REJECT --reject-with tcp-reset
iptables -A reject -p udp -j REJECT
iptables -A common -p icmp -j icmpdef
iptables -A common -p udp --dport 135 -j reject
iptables -A common -p udp --dport 137:139 -j reject
iptables -A common -p udp --dport 445 -j reject
iptables -A common -p tcp --dport 139 -j reject
iptables -A common -p tcp --dport 445 -j reject
iptables -A common -p tcp --dport 135 -j reject
iptables -A common -p udp --dport 1900 -j DROP
iptables -A common -d 255.255.255.255 -j DROP
iptables -A common -d 224.0.0.0/4 -j DROP
iptables -A common -p tcp --dport 113 -j reject
iptables -A common -p udp --sport 53 -mstate --state NEW -j DROP
iptables -A common -d 213.22.99.255 -j DROP
iptables -A common -d 10.10.10.255 -j DROP
iptables -A eth1_in -p udp --dport 67:68 -j ACCEPT
iptables -A OUTPUT -o eth1 -p udp --dport 67:68 -j ACCEPT
iptables -N rfc1918
iptables -N logdrop
iptables -A logdrop -j LOG --log-level info --log-prefix
FIREWALL:logdrop:DROP:
iptables -A logdrop -j DROP
iptables -A rfc1918 -s 255.255.255.255 -j RETURN
iptables -A rfc1918 -m conntrack --ctorigdst 255.255.255.255 -j RETURN
iptables -A rfc1918 -s 169.254.0.0/16 -j DROP
iptables -A rfc1918 -m conntrack --ctorigdst 169.254.0.0/16 -j DROP
iptables -A rfc1918 -s 172.16.0.0/12 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 172.16.0.0/12 -j logdrop
iptables -A rfc1918 -s 192.0.2.0/24 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 192.0.2.0/24 -j logdrop
iptables -A rfc1918 -s 192.168.0.0/16 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 192.168.0.0/16 -j logdrop
iptables -A rfc1918 -s 0.0.0.0/7 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 0.0.0.0/7 -j logdrop
iptables -A rfc1918 -s 2.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 2.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 5.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 5.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 7.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 7.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 10.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 10.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 23.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 23.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 27.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 27.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 31.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 31.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 36.0.0.0/7 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 36.0.0.0/7 -j logdrop
iptables -A rfc1918 -s 39.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 39.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 41.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 41.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 42.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 42.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 49.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 49.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 50.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 50.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 58.0.0.0/7 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 58.0.0.0/7 -j logdrop
iptables -A rfc1918 -s 60.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 60.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 70.0.0.0/7 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 70.0.0.0/7 -j logdrop
iptables -A rfc1918 -s 72.0.0.0/5 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 72.0.0.0/5 -j logdrop
iptables -A rfc1918 -s 83.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 83.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 84.0.0.0/6 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 84.0.0.0/6 -j logdrop
iptables -A rfc1918 -s 88.0.0.0/5 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 88.0.0.0/5 -j logdrop
iptables -A rfc1918 -s 96.0.0.0/3 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 96.0.0.0/3 -j logdrop
iptables -A rfc1918 -s 127.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 127.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 197.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 197.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 198.18.0.0/15 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 198.18.0.0/15 -j logdrop
iptables -A rfc1918 -s 201.0.0.0/8 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 201.0.0.0/8 -j logdrop
iptables -A rfc1918 -s 240.0.0.0/4 -j logdrop
iptables -A rfc1918 -m conntrack --ctorigdst 240.0.0.0/4 -j logdrop
iptables -A eth1_fwd -m state --state NEW -j rfc1918
iptables -A eth1_in -m state --state NEW -j rfc1918
iptables -N fw2net
iptables -A fw2net -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A fw2net -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A fw2net -p tcp -m state --state NEW --dport 53 -j ACCEPT
iptables -A fw2net -p udp -m state --state NEW --dport 53 -j ACCEPT
iptables -N loc2net
iptables -A loc2net -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A loc2net -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A loc2net -p udp -m state --state NEW --dport 53 -j ACCEPT
iptables -N loc2fw
iptables -A loc2fw -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A loc2fw -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A loc2fw -p tcp -m state --state NEW --dport 53 -j ACCEPT
iptables -A loc2fw -p udp -m state --state NEW --dport 53 -j ACCEPT
iptables -A loc2fw -p tcp -m state --state NEW --dport 22 -j ACCEPT
iptables -N net2fw
iptables -A net2fw -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A net2fw -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A net2fw -p tcp -m state --state NEW --dport 22 -j ACCEPT
iptables -A loc2fw -p icmp --icmp-type 8 -j ACCEPT
iptables -A net2fw -p icmp --icmp-type 8 -j ACCEPT
iptables -N fw2loc
iptables -A fw2loc -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A fw2loc -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A fw2loc -p icmp --icmp-type 8 -j ACCEPT
iptables -A fw2net -p icmp --icmp-type 8 -j ACCEPT
iptables -A loc2fw -p tcp -m state --state NEW --dport 80 -j ACCEPT
iptables -A net2fw -p tcp -m state --state NEW --dport 80 -j ACCEPT
iptables -A loc2fw -p tcp -m state --state NEW --dport 21 -j ACCEPT
iptables -A loc2fw -p tcp -m state --state NEW --dport 5900:5910 -j
ACCEPT
iptables -A net2fw -p tcp -m state --state NEW --dport 21 -j ACCEPT
iptables -N net2all
iptables -A net2all -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A net2all -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A net2all -j common
iptables -A net2all -j LOG --log-level info --log-prefix
FIREWALL:net2all:DROP:
iptables -A net2all -j DROP
iptables -N all2all
iptables -A all2all -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A all2all -m state --state NEW -p tcp ! --syn -j newnotsyn
iptables -A all2all -j common
iptables -A all2all -j LOG --log-level info --log-prefix
FIREWALL:all2all:REJECT:
iptables -A all2all -j reject
iptables -A fw2net -j ACCEPT
iptables -A fw2loc -j all2all
iptables -A net2fw -j net2all
iptables -A loc2fw -j all2all
iptables -A loc2net -j ACCEPT
iptables -t mangle -N pretos
iptables -t mangle -N outtos
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --dport ssh -j TOS
--set-tos 16
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --dport ssh -j TOS
--set-tos 16
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --sport ssh -j TOS
--set-tos 16
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --sport ssh -j TOS
--set-tos 16
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --dport ftp -j TOS
--set-tos 16
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --dport ftp -j TOS
--set-tos 16
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --sport ftp -j TOS
--set-tos 16
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --sport ftp -j TOS
--set-tos 16
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --sport ftp-data -j TOS
--set-tos 8
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --sport ftp-data -j TOS
--set-tos 8
iptables -t mangle -A outtos -p tcp -d 0.0.0.0/0 --dport ftp-data -j TOS
--set-tos 8
iptables -t mangle -A pretos -p tcp -d 0.0.0.0/0 --dport ftp-data -j TOS
--set-tos 8
iptables -t mangle -A PREROUTING -j pretos
iptables -t mangle -A OUTPUT -j outtos
iptables -A OUTPUT -o eth1 -d 0.0.0.0/0 -j fw2net
iptables -A eth1_in -s 0.0.0.0/0 -j net2fw
iptables -A eth1_fwd -o eth0 -d 0.0.0.0/0 -j net2all
iptables -A OUTPUT -o eth0 -d 0.0.0.0/0 -j fw2loc
iptables -A eth0_in -s 0.0.0.0/0 -j loc2fw
iptables -A eth0_fwd -o eth1 -d 0.0.0.0/0 -j loc2net
iptables -A FORWARD -i eth1 -j eth1_fwd
iptables -A INPUT -i eth1 -j eth1_in
iptables -A FORWARD -i eth0 -j eth0_fwd
iptables -A INPUT -i eth0 -j eth0_in
iptables -A INPUT -j common
iptables -A INPUT -j LOG --log-level info --log-prefix
FIREWALL:INPUT:REJECT:
iptables -A INPUT -j reject
iptables -A OUTPUT -j common
iptables -A OUTPUT -j LOG --log-level info --log-prefix
FIREWALL:OUTPUT:REJECT:
iptables -A OUTPUT -j reject
iptables -A FORWARD -j common
iptables -A FORWARD -j LOG --log-level info --log-prefix
FIREWALL:FORWARD:REJECT:
iptables -A FORWARD -j reject
iptables -D INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D INPUT -p udp --dport 53 -j ACCEPT
iptables -D OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D OUTPUT -p udp --dport 53 -j ACCEPT
iptables -D FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -D FORWARD -p udp --dport 53 -j ACCEPT




