From: Jon Colverson <netfilter@vcxz.co.uk>
Subject: Problem with two subnets NATed onto a third subnet on one box.
Date: Thu, 29 Apr 2004 03:00:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409061D9.6040000@vcxz.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello. Apologies in advance for the length of this mail.

I'm attempting to set up an environment which I can use to test some 
NAT-traversal software on one machine. I'm using Linux 2.6.5 and 
iptables 1.2.9.

I start by adding four addresses to an Ethernet device:

  ip addr add 10.0.1.1/24 dev eth0
  ip addr add 10.0.2.1/24 dev eth0
  ip addr add 10.0.3.1/24 dev eth0
  ip addr add 10.0.3.2/24 dev eth0

10.0.1.0/24 and 10.0.2.0/24 are the pretend private networks. 
10.0.3.0/24 is the pretend public Internet and 10.0.3.1 and 10.0.3.2 are 
the addresses of the NATs for 10.0.1.0 and 10.0.2.0 respectively.

I then set up the NAT as follows:

  iptables -t nat -A POSTROUTING -s 10.0.1.0/24 -d 10.0.1.0/24 -j ACCEPT
  iptables -t nat -A POSTROUTING -s 10.0.1.0/24 -j SNAT --to 10.0.3.1

  iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -d 10.0.2.0/24 -j ACCEPT
  iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -j SNAT --to 10.0.3.2

This seems to work as expected. I can run a server with:

  ip addr add 10.0.3.5/24 dev eth0
  nc -u -l -s 10.0.3.5 -p 2345

and connect to it with:

  nc -u -s 10.0.1.1 10.0.3.5 2345

and the packets are NATed through 10.0.3.1. Now, what I'm really trying 
to do is to establish UDP communications between the hosts 10.0.1.1 and 
10.0.2.1 using the "UDP hole punching" technique that's described in 
section 3.3 of the following Internet Draft:

  http://midcom-p2p.sourceforge.net/draft-ford-midcom-p2p-01.txt

I use the following to try to send the packets between the two:

  echo | nc -u -s 10.0.1.1 -p 2345 10.0.3.2 2345
  echo | nc -u -s 10.0.2.1 -p 2345 10.0.3.1 2345

This produces the following entries in /proc/net/ip_conntrack (Sometimes 
the source ports are translated, but on this occasion they were not):

  udp      17 2 src=10.0.1.1 dst=10.0.3.2 sport=2345 dport=2345 
[UNREPLIED] src=10.0.3.2 dst=10.0.3.1 sport=2345 dport=2345 use=1
  udp      17 1 src=10.0.2.1 dst=10.0.3.1 sport=2345 dport=2345 
[UNREPLIED] src=10.0.3.1 dst=10.0.3.2 sport=2345 dport=2345 use=1

and the following traffic is observed by tcpdump -i lo:

  20:29:16.588121 10.0.3.2.2345 > 10.0.3.1.2345: udp 1 (DF)
  20:29:16.588169 10.0.3.1 > 10.0.3.2: icmp: 10.0.3.1 udp port 2345 
unreachable [tos 0xc0]
  20:29:18.484435 10.0.3.1.2345 > 10.0.3.2.2345: udp 1 (DF)
  20:29:18.484482 10.0.3.2 > 10.0.3.1: icmp: 10.0.3.2 udp port 2345 
unreachable [tos 0xc0]

The first UDP packet creates the second entry in the connection-tracking 
table. The second UDP packet seems to match the expectations of the 
connection but it remains UNREPLIED. The second UDP packet doesn't make 
it to its intended destination (as you can tell by the second icmp port 
unreachable packet).

Thanks for any help.

-- 
Jon


