From: Jihoon Chung <difro@sexycoder.com>
Subject: udp connection(snmp) not being tracked. probable bug?
Date: Thu, 27 Mar 2003 17:17:59 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030327081759.GA2811@morpheus>
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

Using kernel 2.4.20.

I have a netfilter gateway with 2 external ip
eth0: 1.1.1.1 (gw: 1.1.1.254)
eth1: 2.2.2.2 (gw: 2.2.2.254)

It has default route like this

default
	nexthop via 1.1.1.254  dev eth0 weight 1
	nexthop via 2.2.2.254  dev eth1 weight 200

SNMPd is running on the gateway (ucd-snmp).

When I snmp-get to ip 1.1.1.1 (from outside the netfilter gateway, say
3.3.3.3), the reply comes back though eth1 with ip 2.2.2.2

As you can see from what I captured of /proc/net/ip_conntrack, I think
udp packets are not being tracked properly.
(I've modified the ip address accordingly)

-----------------
udp      17 29 src=2.2.2.2 dst=3.3.3.3 sport=161 dport=1914 [UNREPLIED] src=3.3.3.3 dst=2.2.2.2 sport=1914 dport=161 use=1 mark=0 
udp      17 28 src=2.2.2.2 dst=3.3.3.3 sport=161 dport=1913 [UNREPLIED] src=3.3.3.3 dst=2.2.2.2 sport=1913 dport=161 use=1 mark=0 
udp      17 27 src=2.2.2.2 dst=3.3.3.3 sport=161 dport=1912 [UNREPLIED] src=3.3.3.3 dst=2.2.2.2 sport=1912 dport=161 use=1 mark=0 
udp      17 27 src=3.3.3.3 dst=1.1.1.1 sport=1912 dport=161 [UNREPLIED] src=1.1.1.1 dst=3.3.3.3 sport=161 dport=1912 use=1 mark=0 
udp      17 28 src=3.3.3.3 dst=1.1.1.1 sport=1913 dport=161 [UNREPLIED] src=1.1.1.1 dst=3.3.3.3 sport=161 dport=1913 use=1 mark=0 
udp      17 29 src=3.3.3.3 dst=1.1.1.1 sport=1914 dport=161 [UNREPLIED] src=1.1.1.1 dst=3.3.3.3 sport=161 dport=1914 use=1 mark=0 
----------------

I write a small UDP echo server/client and tested it on the gateway.
The result was same:  reply comes out from the wrong interface with
wrong ip.

Is this a known bug?

