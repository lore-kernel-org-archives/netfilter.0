From: "Jimmy" <squid@oranged.to>
Subject: Strange Entry
Date: Sat, 11 Jun 2005 13:35:10 +0100 (BST)
Message-ID: <39745.82.152.178.234.1118493310.squirrel@webmail.*>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from 82.152.178.234
	(SquirrelMail authenticated user squid@oranged.to)
	by webmail.* with HTTP; Sat, 11 Jun 2005 13:35:10 +0100 (BST)
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

Hello,

I have recently enabled logging on my iptables firewall rulesets. One of
the things that I have noticed and have not really been able to grasp
properly are the following entries.

Jun 11 12:25:40 bogus kernel: Dropped Out Rule: IN= OUT=eth0
SRC=212.100.249.100 DST=137.149.3.22 LEN=75 TOS=0x00 PREC=0x00 TTL=64
ID=27797 DF PROTO=TCP SPT=25 DPT=34934 WINDOW=1448 RES=0x00 ACK PSH FIN
URGP=0
Jun 11 12:26:20 bogus kernel: Dropped Out Rule: IN= OUT=eth0
SRC=212.100.249.100 DST=137.149.3.22 LEN=75 TOS=0x00 PREC=0x00 TTL=64
ID=27799 DF PROTO=TCP SPT=25 DPT=34934 WINDOW=1448 RES=0x00 ACK PSH FIN
URGP=0
Jun 11 12:57:35 bogus kernel: Dropped Out Rule: IN= OUT=eth0
SRC=212.100.249.100 DST=70.84.118.130 LEN=75 TOS=0x00 PREC=0x00 TTL=64
ID=51446 DF PROTO=TCP SPT=25 DPT=48117 WINDOW=1448 RES=0x00 ACK PSH FIN
URGP=0

I am not sure what should be going out with a source port of 25 and a
destination port that is so high. I thought that an outgoing connection
from the server should be established with a high source port and a low
(service) destination port?.

I am trying to work out if that rule would be resulting in a drop in
email. Im not seeing any OUTBOUND email in the queue.. So I am wondering
what exactly the root cause, or what applications could cause traffic like
that to occur?.

Any ideas would be greatly appreciated.




