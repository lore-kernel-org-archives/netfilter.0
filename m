From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: ipt_tos.ko vs ipt_TOS.ko
Date: Thu, 29 Apr 2004 17:31:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D3DD55FDB74AD511BA5100500416368053E88F@ORION>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Received: **stripped**
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
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi,

I doesnt load ipt_TOS.ko in the script but if i do lsmod i can see
ip_tables 15096 11 [iptable_mangle ipt_TOS ipt_tos ipt_ULOG ipt_MASQUERADE
ipt_state ipt_LOG iptable_nat iptable_filter]

Did the module load himself?


In the script i do
$IPT -A PREROUTING -t mangle -p TCP --sport 80  -j TOS --set-tos 16
$IPT -A PREROUTING -t mangle -p TCP --dport 80  -j TOS --set-tos 16


In the log i can see
IN=eth1 OUT=ppp0 SRC=192.168.63.4 DST=212.185.47.48 LEN=40 TOS=0x08
PREC=0x00 TTL=127 ID=62141 DF PROTO=TCP SPT=2531 DPT=80 WINDOW=64952
RES=0x00 ACK URGP=0

If fill up the bandwidth with an ftp download i doesnt feel an priorizing of
http traffic.
Any idea whats wrong? 

