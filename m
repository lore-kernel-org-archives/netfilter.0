From: Jordan Russell <jr-list-2007@quo.to>
Subject: ICMP packets associated with NAT connections sent out wrong
	interface?
Date: Sat, 16 Jun 2007 11:43:06 -0500
Message-ID: <f513uq$kvi$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

My machine is functioning as a NAT box. It has two NICs:
- eth0, connected to the LAN, IP address 192.168.0.1
- eth1, connected to the Internet, IP address 123.23.23.23

In the OUTPUT chain, I accept packets sent out eth0 with a destination
address of 192.168.0.x. Any packets sent out other interfaces with a
destination address of 192.168.0.x are logged and dropped:

-A OUTPUT -d 192.168.0.0/24 -o eth0 -j ACCEPT
-A OUTPUT -d 192.168.0.0/24 -j LOG '[outdrop] '
-A OUTPUT -d 192.168.0.0/24 -j DROP

In kernel 2.6.19 and earlier, the LOG & DROP rules never matched
anything, just as expected.

With 2.6.20.12 and 2.6.21.5, however, they occasionally catch "ICMP
TYPE=3 CODE=3" packets going out eth1. Example:

[outdrop] IN= OUT=eth1 SRC=123.23.23.23 DST=192.168.0.4 LEN=68 TOS=0x00
PREC=0xC0 TTL=64 ID=61136 PROTO=ICMP TYPE=3 CODE=3 [SRC=192.168.0.4
DST=123.23.23.23 LEN=40 TOS=0x00 PREC=0x20 TTL=53 ID=16088 PROTO=TCP
SPT=1229 DPT=44851 WINDOW=0 RES=0x00 ACK RST FIN URGP=0 ]

What the logged packets have in common:

1. The second SRC= is always a machine on the LAN (192.168.0.x).
   (Note: The machines aren't doing anything 'weird', just normal web
   browsing.)
2. The second DST= is always the address of the Internet interface
   (123.23.23.23). (This doesn't seem right as no machines on the LAN
   ever connect to that address directly?)
3. DPT is always within the range of ports I have allocated for NAT use
   (I use "-p tcp --to-ports 41800-59999" in my MASQUERADE rule).

Any ideas as to what's causing packets destined for the LAN to be sent
out the Internet interface, and only in 2.6.20+? Does the
"DST=123.23.23.23" indicate a failure to perform address translation?
(Could a conntrack entry be expiring prematurely?)

Thanks.
-- 
Jordan Russell


