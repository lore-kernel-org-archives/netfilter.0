From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Out of window filter catches too much
Date: Sat, 26 Feb 2005 01:01:41 +0100
Message-ID: <421FBC65.40202@drzeus.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm having problem with the out of window filter throwing a way packets 
in otherwise perfectly good connections. The problem appears when doing 
a rather large rsync between two linux machines on the network here.

The rsync server is running 2.6.9, the client 2.6.10 and the router 2.6.10.

Since there is only linux machines involved here this must be a kernel 
bug. Either in the TCP layer or in netfilters detection. Here is a dump 
from the router when it starts throwing away packets:

ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver) 
IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 
ID=10234 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763580423 ACK=299956256 
WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver) 
IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 
ID=10236 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763581871 ACK=299956256 
WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver) 
IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 
ID=10238 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763583319 ACK=299956256 
WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver) 
IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 
ID=10240 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763584767 ACK=299956256 
WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver) 
IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 
ID=10242 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763586215 ACK=299956256 
WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=52 TOS=0x00 PREC=0x00 TTL=64 
ID=23961 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956256 ACK=2763580423 
WINDOW=0 RES=0x00 ACK URGP=0 OPT (0101080A7E1D58E9C4C2FDE7)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=432 TOS=0x00 PREC=0x00 TTL=64 
ID=23963 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956256 ACK=2763580423 
WINDOW=0 RES=0x00 ACK PSH URGP=0 OPT (0101080A7E1D5927C4C2FDE7)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=52 TOS=0x00 PREC=0x00 TTL=64 
ID=23965 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956636 ACK=2763580423 
WINDOW=1718 RES=0x00 ACK URGP=0 OPT (0101080A7E1D5952C4C2FDE7)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=52 TOS=0x00 PREC=0x00 TTL=64 
ID=23967 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956636 ACK=2763580423 
WINDOW=3788 RES=0x00 ACK URGP=0 OPT (0101080A7E1D599DC4C2FDE7)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=64 TOS=0x00 PREC=0x00 TTL=64 
ID=23969 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956636 ACK=2763580423 
WINDOW=3788 RES=0x00 ACK URGP=0 OPT 
(0101080A7E1D59B1C4C2FED70101050AA4B8DE5FA4B8E407)
printk: 7 messages suppressed.
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=432 TOS=0x00 PREC=0x00 TTL=64 
ID=23985 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956256 ACK=2763580423 
WINDOW=5792 RES=0x00 ACK PSH URGP=0 OPT (0101080A7E1D73CBC4C30BF7)
printk: 1 messages suppressed.
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=432 TOS=0x00 PREC=0x00 TTL=64 
ID=23989 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956256 ACK=2763580423 
WINDOW=5792 RES=0x00 ACK PSH URGP=0 OPT (0101080A7E1D8F4BC4C31AF7)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=64 TOS=0x00 PREC=0x00 TTL=64 
ID=23991 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956636 ACK=2763580423 
WINDOW=5792 RES=0x00 ACK URGP=0 OPT 
(0101080A7E1D93D0C4C338F70101050AA4B8DE5FA4B8E407)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=432 TOS=0x00 PREC=0x00 TTL=64 
ID=23993 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956256 ACK=2763580423 
WINDOW=5792 RES=0x00 ACK PSH URGP=0 OPT (0101080A7E1DC64BC4C338F7)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=64 TOS=0x00 PREC=0x00 TTL=64 
ID=23995 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956636 ACK=2763580423 
WINDOW=5792 RES=0x00 ACK URGP=0 OPT 
(0101080A7E1DCFCFC4C374F70101050AA4B8DE5FA4B8E407)
ip_ct_tcp: ACK is over the upper bound (ACKed data has never seen yet) 
IN= OUT= SRC=10.8.5.10 DST=10.8.0.24 LEN=432 TOS=0x00 PREC=0x00 TTL=64 
ID=23997 DF PROTO=TCP SPT=873 DPT=3851 SEQ=299956256 ACK=2763580423 
WINDOW=5792 RES=0x00 ACK PSH URGP=0 OPT (0101080A7E1E344BC4C374F7)
ip_ct_tcp: invalid RST (ignored) IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 
LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=10258 DF PROTO=TCP SPT=3851 DPT=873 
SEQ=2763587663 ACK=299956256 WINDOW=724 RES=0x00 ACK RST URGP=0 OPT 
(0101080AC4C3E8BE7E1D58C1)

The connection recovered from the first couple of these, but the later 
ones causes the connection to die.

This is very annoying so I hope someone has the time to help me fix this 
  as soon as possible.

Rgds
Pierre

