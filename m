From: Jochen Vogel <jvogel@it-sec.de>
Subject: state NEW
Date: Fri, 19 Nov 2004 10:31:46 +0100
Message-ID: <D3DD55FDB74AD511BA5100500416368053EB16@ORION>
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
To: netfilter@lists.netfilter.org

hi,

i have the following forwarding rule

$IPT -A FORWARD -i $INT -o $EXT -m state --state NEW,ESTABLISHED,RELATED -j
QUEUE
$IPT -A FORWARD -i $EXT -o $INT -m state --state ESTABLISHED,RELATED     -j
ACCEPT

if i send an ACK with hping from INT to EXT it reaches the target system

if i do

$IPT -A FORWARD -i $INT -o $EXT -m state --state NEW -j ACCEPTLOG
$IPT -A FORWARD -i $EXT -o $INT -m state --state ESTABLISHED,RELATED-j
ACCEPT

i can see the following

Nov 19 12:05:20 snolin kernel: ACPT IN=eth0 OUT=ppp0 SRC=1.1.1.1 DST=2.2.2.2
LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=12368 PROTO=TCP SPT=2618 DPT=63
WINDOW=512 RES=0x00 ACK URGP=0

did i have a false understanding from NEW or whats wrong

thx for help
jo


