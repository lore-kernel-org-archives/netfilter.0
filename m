From: James Casbon <james.casbon@a4internet.com>
Subject: why does this packet not match these rules?
Date: Mon, 30 Aug 2004 15:12:39 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408301512.43189.james.casbon@a4internet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,

I have these rules in my iptables script (iptables -L -v -n):

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination

16955 5070K ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0

35895  278M out_lan    all  --  *      eth0    0.0.0.0/0            0.0.0.0/0

  16M 3830M out_internet  all  --  *      ppp0    x.x.x.x       0.0.0.0/0

    0     0 ACCEPT     all  --  *      *       0.0.0.0/0           0.0.0.0/0
     state RELATED

26649 1534K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0 
0 level 4 prefix `OUT-unknown:' 

 28209 1621K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0


(where x.x.x.x is my ip), and yet these packets are being logged:

... OUT-unknown:IN= OUT=ppp0 SRC=x.x.x.x DST=y.y.y.y LEN=60 TOS=0x00 PREC=0x00 
TTL=64 ID=45650 DF PROTO=TCP SPT=43257 DPT=4662 WINDOW=4383 RES=0x00 SYN 
URGP=0

surely this should match rule 3 (src=x.x.x.x, out=ppp0) and be handled by 
out_internet?

thanks,
James

