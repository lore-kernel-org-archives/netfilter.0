From: "Tim Evans" <tkevans@tkevans.com>
Subject: Log Entries with multiple PROTO fields?
Date: Wed, 17 Mar 2004 10:10:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040317141056.M19130@tkevans.com>
Reply-To: tkevans@tkevans.com
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

What do these kind of log message mean?  Note there are two PROTO fields:

Mar  8 08:19:43 kernel: IPT OUT_ICMP: IN= OUT=eth1 SRC=x.x.x.xDST=x.x.x.
.x LEN=76 TOS=0x00 PREC=0xC0 TTL=64 ID=54844 PROTO=ICMP TYPE=11 CODE=0
[SRC=x.x.x.x DST=x.x.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=1 ID=0 DF PROTO=TCP
SPT=110 DPT=4312 WINDOW=5840 RES=0x00 ACK SYN URGP=0 ]

Mar  8 09:24:14 kernel: IPT OUT_ICMP: IN= OUT=eth1 SRC=x.x.x.xDST=x.x.x.x
  LEN=80 TOS=0x00 PREC=0xC0 TTL=64 ID=24045 PROTO=ICMP TYPE=11 CODE=0
[SRC=x.x.x.x DST=x.x.x.x LEN=52 TOS=0x00 PREC=0x00 TTL=1 ID=27964 DF PROTO=TCP
SPT=80 DPT=60884 WINDOW=57920 RES=0x00 ACK FIN URGP=0 ]



--
Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
tkevans@tkevans.com             |    Owings Mills, MD 21117
http://www.tkevans.com/         |    443-394-3864
http://www.come-here.com/News/  |    

