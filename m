From: "dravya" <dravya@magma.ca>
Subject: packets going over wrong link: ROUTE target not doing its job !!!!
Date: Thu, 26 Aug 2004 12:11:46 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408261611.i7QGBkwG000996@webmail2.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>


Hi all,

I patched my kernel with the ROUTE target in order to force all icmp packets over one
interface. The following are the rules I added:

iptables -A POSTROUTING -t mangle -p icmp -j LOG --log-prefix "Mangle POST: "
iptables -A POSTROUTING -t mangle -p icmp -j ROUTE --oif ppp0

The following is my routing table:

206.47.201.1 dev ppp0  proto kernel  scope link  src 69.158.206.247
192.168.1.0/24 dev eth0  scope link
169.254.0.0/16 dev eth0  scope link
127.0.0.0/8 dev lo  scope link
default equalize
      nexthop via 206.47.201.1  dev ppp0 weight 1
      nexthop via 204.101.237.225  dev ppp1 weight 1 
                                                         |  
                                                         |  
                                                         v
Aug 26 11:56:29 localhost kernel: Mangle POST: IN= OUT=eth0 SRC=192.168.1.96
DST=192.168.1.229 LEN=106 TOS=0x00 PREC=0xC0 TTL=64 ID=55919 PROTO=ICMP TYPE=3 CODE=3
[SRC=192.168.1.229 DST=192.168.1.96 LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=25106 PROTO=UDP
SPT=64696 DPT=137 LEN=58 ]

According to the rule, shouldn't this be ppp0 ??? Using ethereal, I captured on ppp0 and
the following is what I get:
                                 |  
                                 |  
                                 v
2004-08-26 10:31:28.721245 192.168.1.96 -> 192.168.1.229 ICMP Destination unreachable
2004-08-26 10:31:28.721245 192.168.1.96 -> 192.168.1.229 ICMP Destination unreachable

This means that from ppp0 there was a packet that had a src address of eth0. Hence, I get
a change of ip address and I lose that connection. 

NOTE: I have tried MASQUERADING and it give me the same problem of packets going over the
wrong link.

I have been told to use MARK and CONNMARK, but I am not sure how to use it. 

Any help???? any rules that you guys can specify???

I am using the two ppp liks to access the internet, I want to eventually load balance the
connections and have packets going over the correct link (ie. src add of packet is ip add
of link)

Thank you very much

Dravya



