From: Kean Pedersen <netfilter@zakarun.dk>
Subject: Running iptables behind router
Date: Tue, 17 Feb 2004 00:55:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040216235513.GA1219@room101>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi, I have some problems setting up iptables on a linux box, acting as a
router between two networks. I have an internet connection through a
hardware router, which I have no access to. This router uses NAT, and
has an interface on 192.168.1.1. So far I've had my LAN on
192.168.1.0/24, with no problems, but would like to split it into two
LANs, one on 192.168.1.0/24, having the hardware router and some hosts,
and another one on 192.168.2.0/24, acting as an "internal" LAN.

I'd then like to connect these two LANs with a linux box running
iptables, so the both LANs have access to the internet through the
hardware router.

I sat up the iptables machine (which have two NICs) to the IPs
192.168.1.100 and 192.168.2.100, one on each interface. How should I set
up iptables, so the 192.168.2.0/24 range have access through iptables,
and further through the hardware router onto the internet? Only outbound
connections will be made. (Inbound connections are mapped in the
hardware router to 192.168.1.x to specific hosts, no problem there).

The computers on the 192.168.2.0/24 range should be able to make
connections to the 192.168.1.0/24 range, but not the other way around.

Any help is appreciated.

--
Kean Pedersen

