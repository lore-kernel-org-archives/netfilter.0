From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Reasons for INVALID packets ?
Date: Sun, 27 Feb 2005 14:32:00 +0300
Message-ID: <200502271432.00952.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Hello everybody,

My iptables script drops (and logs) INVALID packets in
INPUT, OUTPUT, and FORWARD chains.  
Sometimes a router that is running the script generates ICMP
packets of type 11 that it considers INVALID.   (In other words, it
generates packets that by itself considers to be INVALID.)  The
problem is that I cannot figure out what makes the router generate
invalid packets.

Typical records of this kind look this way:

IN= OUT=eth0 SRC=ROUTER DST=193.108.155.115 LEN=68 TOS=0x00 PREC=0xC0 TTL=64 
ID=22467 PROTO=ICMP TYPE=11 CODE=0 [SRC=193.108.155.115 DST=A.LAN.HOST LEN=40 
TOS=0x00 PREC=0x00 TTL=1 ID=40760 PROTO=ICMP TYPE=8 CODE=0 ID=20244 
SEQ=45126 ] 

or:

IN= OUT=eth0 SRC=ROUTER DST=66.150.8.26 LEN=60 TOS=0x00 PREC=0xC0 TTL=64 
ID=30495 PROTO=ICMP TYPE=11 CODE=0 [SRC=66.150.8.26 DST=A.LAN.HOST LEN=32 
TOS=0x00 PREC=0x20 TTL=1 ID=1294 PROTO=UDP SPT=12895 DPT=33440 LEN=12 ] 

It seems that they appear in situations when an exterior host either pings or
"traceroutes" a host in the LAN.  Both pings and "traceroutes" are normally
logged and dropped.  In these cases, none of these types of packets were
registered _before_ invalid packets but a few seconds _later_.  No connection
breakdowns were logged either.  My question is: what can make a router
generate INVALID packets and how dangerous can this be in the sense of
security of the router and the LAN?


Thanks in advance,
Mikhail

