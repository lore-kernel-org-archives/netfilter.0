From: =?ISO-8859-15?Q?Bj=F6rn_Schmidt?= <bj-schmidt@uni-paderborn.de>
Subject: state: INVALID
Date: Fri, 19 Nov 2004 23:37:37 +0100
Message-ID: <419E75B1.3030406@uni-paderborn.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

the ulogd logfile of my server shows many "INVALID state" packets. What could
be the reason for that?

The server has one cardbus nic (eth0), one dsl-interface (ppp0) and, of course
lo. The client has only eth0 and lo. The kernel version of both computers is
2.6.10-rc2

syslogemu.log:Nov 19 20:31:52 kilobyte INPUT_INVALID IN=eth0 OUT= 
MAC=00:d0:b7:01:ce:2a:00:04:e2:7f:90:41:08:00  SRC=192.168.0.2 DST=192.168.0.1 
LEN=52 TOS=00 PREC=0x00 TTL=64 ID=1680 DF PROTO=TCP SPT=32899 DPT=3130 
SEQ=4260699581 ACK=510793293 WINDOW=5080 ACK FIN URGP=0
syslogemu.log:Nov 19 20:31:52 kilobyte OUTPUT_INVALID IN= OUT=eth0 MAC= 
SRC=192.168.0.1 DST=192.168.0.2 LEN=80 TOS=00 PREC=0x00 TTL=255 ID=29481 
PROTO=ICMP TYPE=3 CODE=3
syslogemu.log:Nov 19 20:31:52 kilobyte INPUT_INVALID IN=eth0 OUT= 
MAC=00:d0:b7:01:ce:2a:00:04:e2:7f:90:41:08:00  SRC=192.168.0.2 DST=192.168.0.1 
LEN=52 TOS=00 PREC=0x00 TTL=64 ID=13326 DF PROTO=TCP SPT=32845 DPT=993 
SEQ=3094163529 ACK=3641510831 WINDOW=2908 ACK FIN URGP=0

Please CC... ;)

-- 
Greetings
Bjoern Schmidt


