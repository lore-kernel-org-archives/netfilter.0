From: ip tables <iptables_help@yahoo.com>
Subject: natting issue-URGENT---i need help badly
Date: Tue, 3 Feb 2004 08:17:51 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040203161751.6693.qmail@web20725.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear group,

I have a machine with 2 NICs one having the IP
10.2.240.19(eth2) and one 192.168.128.4(eth1). I use
redhat 9.0(2.4.20-8) with the built in iptables
V1.2.7a.
Yes i have a eth0 also.
I have the following rules. My idea is to permit only
http on port 80 and nrpc on port 1352. With this setup
after making the POSTROUTING default policy to ACCEPT
i could telnet to both the ports 1352 and 80. But when
i try to connect to the Domino server via a Lotus
notes client it fails. I would prefer to have the
POSTROUTING to DROP by default also. I'm confused.
Help me. Thanks for your time.

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -t nat --policy PREROUTING DROP
iptables -t nat --policy OUTPUT DROP
iptables -t nat --policy POSTROUTING ACCEPT
iptables -t nat -A POSTROUTING -o eth2 -j SNAT
--to-source 10.2.240.19
iptables -t nat -A PREROUTING -i eth2 -p tcp --sport
1:65535 -d 10.2.240.19 \
--dport 80 -j DNAT --to-destination 192.168.128.5
iptables -t nat -A PREROUTING -i eth2 -p tcp --sport
1:65535 -d 10.2.240.19 \
--dport 1352 -j DNAT --to-destination 192.168.128.5
iptables -t nat -A PREROUTING -i eth2 -p udp --sport
1:65535 -d 10.2.240.19 \
--dport 1352 -j DNAT --to-destination 192.168.128.5
iptables -A FORWARD -i eth2 -o eth1 -p tcp --sport
1:65535 -d 192.168.128.5 \
--dport 80 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -p tcp --sport
1:65535 \
-d 192.168.128.5 --dport 1352 -m state --state NEW -j
ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -p udp --sport
1:65535 \
-d 192.168.128.5 --dport 1352 -m state --state NEW -j
ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -p tcp -m state \
--state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -p tcp -m state \
--state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -p udp -m state \
--state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -p udp -m state \
--state RELATED,ESTABLISHED -j ACCEPT


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

