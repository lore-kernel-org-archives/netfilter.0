From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: ESTABILISHED connections are not that estabilished
Date: Wed, 27 Jul 2005 18:10:15 +0200
Message-ID: <dc8blc$p5s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
To: netfilter@lists.netfilter.org

In my logs I often find reports of dropped input packets from my DNS:53 or
dropped output packets generated from localhost:25 to other mail servers.

They look like these:
  iptables INPUT DROP IN=eth0 OUT= SRC=69.93.28.254 DST=myIP LEN=70 TOS=0x00
PREC=0x00 TTL=54 ID=0 DF PROTO=UDP SPT=53 DPT=4156 LEN=50

  iptables OUTPUT DROP IN= OUT=eth0 SRC=myIP DST=219.136.64.239 LEN=87
TOS=0x00 PREC=0x00 TTL=64 ID=44757 DF PROTO=TCP SPT=25 DPT=3062 WINDOW=5840
RES=0x00 ACK PSH FIN URGP=0

I thought these connections should be handled by

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

and not dropped by the default policy. The logs show that this is not true.
Why are these packets dropped?

-- 
Gioele <dev@gioelebarabucci.com>


