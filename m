From: Evgeni Vachkov <evgeni.vachkov@investis.com>
Subject: ip_conntrack_tcp Errors
Date: 28 Jun 2004 12:47:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088423237.13933.127.camel@spudgun.dhcp.internal>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

When I load test one of our firewalls, when the concurrent connections
reach arround 230, I am getting a lot of error messages as shown below.
Mostly indicating that the server has sent an invalid SYN.  This is a
heavy load firewall. I thought that increasing    
ip_conntrack_max and ip_conntrack_buckets would help, but this wasnt the
case. 

The ip_conntrack version is 2.1.  kernel is v 2.4.26

Is that a problem with conntrack and its tunning or I am missing some
patch? ...Or perhaps it is some other problem with other parts of the
kernel? 

Your quick help is greatly appreciated. 

Regards,
Evgeni Vachkov


Jun 25 16:38:51 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.30.4.200 DST=192.168.30.3 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=43226 SEQ=461046254 ACK=654564425
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D5584DD106BFE1501030300)
Jun 25 16:38:55 myserver kernel: NET: 171 messages suppressed.
Jun 25 16:38:55 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.300.40.20 DST=192.168.130.30 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=39098 SEQ=449809028 ACK=643180415
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D558695106BFD6F01030300)
Jun 25 16:39:02 myserver kernel: NET: 314 messages suppressed.
Jun 25 16:39:02 myserver kernel: ip_conntrack_tcp: IGNORED: Out of
window data; SEQ is under the lower bound (retransmitted already ACKed
data)
Jun 25 16:39:02 myserver kernel: SRC=172.300.40.20 DST=192.168.130.30
LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=32438 DF PROTO=TCP SPT=80 DPT=42539
SEQ=4211842796 ACK=108452331 WINDOW=5792 RES=0x00 ACK FIN URGP=0 OPT
(0101080A2D558930106B4C75)
Jun 25 16:39:05 myserver kernel: NET: 421 messages suppressed.
Jun 25 16:39:05 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.300.40.20 DST=192.168.130.30 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=44563 SEQ=471823482 ACK=665607863
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D558A7D106C033A01030300)
Jun 25 16:39:10 myserver kernel: NET: 249 messages suppressed.
Jun 25 16:39:10 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.300.40.20 DST=192.168.130.30 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=45696 SEQ=469531976 ACK=675466444
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D558C71106C051B01030300)
Jun 25 16:39:17 myserver kernel: NET: 86 messages suppressed.
Jun 25 16:39:17 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.130.40.20 DST=192.168.130.30 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=44525 SEQ=459293358 ACK=669647335
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D558EF1106C061A01030300)
Jun 25 16:39:21 myserver kernel: NET: 244 messages suppressed.
Jun 25 16:39:21 myserver kernel: ip_conntrack_tcp: IGNORED: Out of
window data; SEQ is under the lower bound (retransmitted already ACKed
data)
Jun 25 16:39:21 myserver kernel: SRC=172.130.40.20 DST=192.168.130.30
LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=13539 DF PROTO=TCP SPT=80 DPT=46472
SEQ=4233682626 ACK=136266752 WINDOW=5792 RES=0x00 ACK FIN URGP=0 OPT
(0101080A2D559068106B55F1)
Jun 25 16:39:28 myserver kernel: NET: 196 messages suppressed.
Jun 25 16:39:28 myserver kernel: ip_conntrack_tcp: IGNORED: Out of
window data; SEQ is under the lower bound (retransmitted already ACKed
data)
Jun 25 16:39:28 myserver kernel: SRC=172.130.40.20 DST=192.168.130.30
LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=6361 DF PROTO=TCP SPT=80 DPT=42381
SEQ=4200515268 ACK=98652606 WINDOW=5792 RES=0x00 ACK FIN URGP=0 OPT
(0101080A2D55934B106B4A1D)
Jun 25 16:39:34 myserver kernel: NET: 23 messages suppressed.
Jun 25 16:39:34 myserver kernel: ip_conntrack_tcp: IGNORED: Out of
window data; SEQ is under the lower bound (retransmitted already ACKed
data)
Jun 25 16:39:34 myserver kernel: SRC=172.130.40.20 DST=192.168.130.30
LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=63653 DF PROTO=TCP SPT=80 DPT=46497
SEQ=4227142309 ACK=128387976 WINDOW=5792 RES=0x00 ACK FIN URGP=0 OPT
(0101080A2D55957C106B55F1)
Jun 25 16:39:41 myserver kernel: NET: 9 messages suppressed.
Jun 25 16:39:41 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.130.40.20 DST=192.168.130.30 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=44443 SEQ=464964164 ACK=658995371
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D559865106C0BDA01030300)
Jun 25 16:39:41 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
(ignored) SRC=172.130.40.20 DST=192.168.130.30 LEN=60 TOS=0x00 PREC=0x00
TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=44491 SEQ=461162821 ACK=673035892
WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
(020405B40402080A2D559865106C0BDA01030300)






