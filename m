From: Rowan Reid <rreid@studio3arc.com>
Subject: Establish new connection.
Date: Mon, 16 Oct 2000 13:14:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c037ad$a4675840$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: 'iptables-list' <netfilter@lists.samba.org>





I'm writing a small script to parse through my logs and filter nodes
trying to establish new connections to filtered ports.  Below is a
typical entry what part of that log entry tells me that this person is
trying to establish a new connection.


Oct 16 05:42:57 s3a-www kernel: IN=eth1 OUT=
MAC=00:04:75:b1:3d:6c:00:60:49:01:5a:de:08:00 SRC=216.99.233.253
DST=**.**.76.66 LEN=72 TOS=0x00 PREC=0x00 TTL=241 ID=8598 DF PROTO=UDP
SPT=53 DPT=1592 L
EN=52
 
Rowan Reid
Job Captain, 
Systems Administrator
STUDIO 3 ARCHITECTS
909  982  1717


