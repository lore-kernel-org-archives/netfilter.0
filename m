From: Jason Sigurdur <jason.sigurdur@ASPENVIEW.ORG>
Subject: -m state question
Date: Tue, 12 Apr 2005 09:35:54 -0600
Message-ID: <08D2636915B90D4FADE116B548E5A516D6C4D4@s142-179-184-97.ab.hsia.telus.net>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>



Hi with the below rules I keep seeing (intermittently) packets that are
dropped in the 'FORWARD_' chain such as

FORWARD_DROPPED: IN=eth1 OUT=eth0 SRC=172.16.x.x DST=209.204.233.88 LEN=40
TOS=0x00 PREC=0x00 TTL=127 ID=53086 DF PROTO=TCP SPT=1595 DPT=80 WINDOW=0
RES=0x00 RST URGP=0

That are going in this direction:
 Eth0[ext]---Eth1[internal] <---


Should'nt  the 3rd FORWARD_ rule allow any new forwarding entries in from
any where except eth0?



############################################################################
####################

Iptables -N FORWARD_
iptables -A FORWARD_ -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD_  -i  ! eth0 -m state --state NEW -j ACCEPT
iptables -A FORWARD_ -j LOG --log-level info --log-prefix "FORWARD_DROPPED:
"
iptables -A FORWARD_ -j DROP

iptables -t nat -A POSTROUTING -o eth0 -s 172.16.x.x/22 -j SNAT --to-source
x.x.x.x [eth0 ip]


iptables -A INPUT -j IN
iptables -A FORWARD -j FORWARD_



############################################################################
########################

Thank you,

Jason Sigurdur
Technical Services
Aspen View Regional Division #19

This email may contain confidential and/or privileged information for the
sole use of the intended recipient. Any review, copy or distribution is
strictly prohibited. If you have received this email in error, please
contact the sender and delete all copies.  

