From: Jaap Winius <jwinius@umrk.to>
Subject: Advanced routing problem
Date: Sat, 05 May 2007 17:07:23 +0200
Message-ID: <1178377643.463c9daba4959@www.umrk.to>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

After having configured my first iptables firewall, it looks as though
I've already found something it can't handle. Well, I hope not...

All was fine until a secondary external interface was added. I was
hoping that I could configure the firewall to allow remote users to use
either external interface to access a Windows server on a private net
behind the firewall using VNC.

At first I couldn't access the firewall via the secondary external
interface at all, because the firewall was routing its responses out
its default route -- the primary external interface -- and the ISP was
dropping those packets (hot potato routing). However, after installing
the advanced routing package (iproute), I configured a second default
route and solved that problem.

I then set out adjust the firewall, thinking that all I'd need to do
would be to duplicate some rules to accommodate the new interface (see
rules below). However, that didn't work because, despite my efforts,
the firewall loses track of where the packets come from and sends them
out the primary external interface anyway.

Is there a way around this behavior (advanced DNAT or something), or is
the only solution to use a public IP address for the server?

Any hints towards a solution would be appreciated.

Cheers,

Jaap Winius
The Netherlands

======================

# 192.168.13.2 is the Windows server.

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 5900 \
-j DNAT --to-destination 192.168.13.2

iptables -t filter -A FORWARD -i eth0 -p tcp --dport 5900 \
-m state --state NEW -j ACCEPT

iptables -t filter -A FORWARD -d 192.168.13.2 -i eth0 -o eth1 -p tcp \
-m tcp --dport 5900 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -t filter -A FORWARD -s 192.168.13.2 -i eth1 -o eth0 -p tcp \
-m tcp --sport 5900 -m state --state ESTABLISHED -j ACCEPT

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 \
-j DNAT --to-destination 192.168.13.2

iptables -t filter -A FORWARD -i eth0 -p tcp --dport 1723 \
-m state --state NEW -j ACCEPT

iptables -t filter -A FORWARD -d 192.168.13.2 -i eth0 -o eth1 -p tcp \
-m tcp --dport 1723 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -t filter -A FORWARD -s 192.168.13.2 -i eth1 -o eth0 -p tcp \
-m tcp --sport 1723 -m state --state ESTABLISHED -j ACCEPT

iptables -t nat -A PREROUTING -i eth0 -p 47 \
-j DNAT --to-destination 192.168.13.2

iptables -t filter -A FORWARD -d 192.168.13.2 -i eth0 -o eth1 -p 47 \
-j ACCEPT

iptables -t filter -A FORWARD -s 192.168.13.2 -i eth1 -o eth0 -p 47 \
-j ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.13.2 -o eth0 -p 47 \
-j MASQUERADE

======================

