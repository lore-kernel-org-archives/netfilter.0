From: Alexis <alexis@attla.net.ar>
Subject: Re: Running iptables behind router
Date: Tue, 17 Feb 2004 09:39:07 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <632269680.20040217093907@attla.net.ar>
References: <20040216235513.GA1219@room101>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040216235513.GA1219@room101>
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
To: Kean Pedersen <netfilter@zakarun.dk>
Cc: netfilter <netfilter@lists.netfilter.org>

yes, do this


echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -p FORWARD DROP

iptables -A FORWARD -s 192.168.2.0/24 -j ACCEPT

then, you have 2 options

1 to use 1 ip of 192.168.1 to nat all the .2 network, or use a pool,
its your choice

1st case
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to
192.168.1.254

or

iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE


2nd case

iptables  -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to
192.168.1.50-192.168.1.60




Hello Kean,

Monday, February 16, 2004, 8:55:14 PM, you wrote:

KP> Hi, I have some problems setting up iptables on a linux box, acting as a
KP> router between two networks. I have an internet connection through a
KP> hardware router, which I have no access to. This router uses NAT, and
KP> has an interface on 192.168.1.1. So far I've had my LAN on
KP> 192.168.1.0/24, with no problems, but would like to split it into two
KP> LANs, one on 192.168.1.0/24, having the hardware router and some hosts,
KP> and another one on 192.168.2.0/24, acting as an "internal" LAN.

KP> I'd then like to connect these two LANs with a linux box running
KP> iptables, so the both LANs have access to the internet through the
KP> hardware router.

KP> I sat up the iptables machine (which have two NICs) to the IPs
KP> 192.168.1.100 and 192.168.2.100, one on each interface. How should I set
KP> up iptables, so the 192.168.2.0/24 range have access through iptables,
KP> and further through the hardware router onto the internet? Only outbound
KP> connections will be made. (Inbound connections are mapped in the
KP> hardware router to 192.168.1.x to specific hosts, no problem there).

KP> The computers on the 192.168.2.0/24 range should be able to make
KP> connections to the 192.168.1.0/24 range, but not the other way around.

KP> Any help is appreciated.

KP> --
KP> Kean Pedersen


-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar



