From: Paulo Andre <pandre@darkstar.nom.za>
Subject: iptables dropped packets
Date: Wed, 21 Sep 2005 13:28:36 +0200
Message-ID: <433143E4.60304@darkstar.nom.za>
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
To: netfilter <netfilter@lists.netfilter.org>

Just looking at some logs and I see that packets returning from an
internal web server are being dropped, according to entries in the
ip_conntrack the sport of the client,165.146.5.229 differ. Is that
mornal behaviour anyone willing to explain.

Thanks
Paulo

This is my dropped packet:
Sep 21 13:05:20 guardian ---FWD--- IN=eth0 OUT=eth1
MAC=00:04:23:b0:74:64:00:05:5d:e6:0b:0d:08:00  SRC=172.x.x.x
DST=165.146.5.229 LEN=52 TOS=00 PREC=0x00 TTL=126 ID=62173 CE DF
PROTO=TCP SPT=80 DPT=1519 SEQ=3763155963 ACK=962750687 WINDOW=65535 ACK
URGP=0

This appears in my ip_conntrack:
tcp      6 9 SYN_RECV src=165.146.5.229 dst=196.25.31.195 sport=1518
dport=8080 packets=1 bytes=60 src=172.x.x.x dst=165.146.5.229 sport=80
dport=1518 packets=1 bytes=60 use=1


