From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Apache:access_log - 408
Date: Mon, 26 Jan 2004 21:34:53 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401270534.i0R5YsmK022776@server5.bandwidthco.com>
References: <20040126090010.1242A33DBF@smtp.263.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040126090010.1242A33DBF@smtp.263.net>
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
To: 'ccddtt' <ccddtt@263.net>, netfilter@lists.netfilter.org

What makes you think you are being attacked?  There is not enough
information here to make that determination. "408" is a "request Time-out
error" and does not mean you are being attacked.  This appears to be an ACK
scan with spoofed IP addresses. Look at the IPID's and TTL values. They tell
me they are coming from the same machine. If you want to drop these packets,
create stateful rules for inbound connections to port 80, and they will be
dropped:

$IPT -t filter -A PORTSCAN_RULES --destination-port 80 -p tcp --tcp-flags
ALL ACK -m state --state NEW -j LOG --log-level $LOG_LEVEL --log-prefix
"PORTSCAN: ACK ON NEW: "

$IPT -t filter -A PORTSCAN_RULES --destination-port 80 -p tcp --tcp-flags
ALL ACK -m state --state NEW -j REJECT --reject-with icmp-host-unreachable

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of ccddtt
Sent: Monday, January 26, 2004 1:00 AM
To: netfilter@lists.netfilter.org
Subject: Apache:access_log - 408

hi,all

please help me.
my linux server installed redhat 9 + apache 1.3.29. passing through some
attack.
in apache acc_log,like :
221.233.227.230 - - [17/Jan/2004:17:26:32 +0800] "-" 408 - 221.233.227.230 -
- [17/Jan/2004:17:26:32 +0800] "-" 408 - 221.233.227.230 - -
[17/Jan/2004:17:26:32 +0800] "-" 408 - 61.145.188.110 - -
[17/Jan/2004:17:26:32 +0800] "-" 408 -
210.38.179.145 - - [17/Jan/2004:17:26:32 +0800] "-" 408 - 221.233.227.230 -
- [17/Jan/2004:17:26:32 +0800] "-" 408 - but no err_log.

some packge like :
Jan 18 19:35:53 linux-sv1 kernel: IN=eth0 OUT=
MAC=00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00 SRC=220.173.8.56
DST=61.135.xx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=114 ID=42497 DF PROTO=TCP
SPT=60177 DPT=80 WINDOW=8280 RES=0x00 ACK URGP=0 Jan 18 19:35:53 linux-sv1
kernel: IN=eth0 OUT= MAC=00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00
SRC=220.173.8.56 DST=61.135.xx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=114 ID=42753
DF PROTO=TCP SPT=60177 DPT=80 WINDOW=8280 RES=0x00 ACK URGP=0 Jan 18
19:35:53 linux-sv1 kernel: IN=eth0 OUT=
MAC=00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00 SRC=61.173.25.88
DST=61.135.xx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=115 ID=53402 DF PROTO=TCP
SPT=63601 DPT=80 WINDOW=16560 RES=0x00 ACK URGP=0 Jan 18 19:35:53 linux-sv1
kernel: IN=eth0 OUT= MAC=00:07:e9:6c:4c:49:00:02:b3:03:e3:67:08:00
SRC=220.173.8.56 DST=61.135.xx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=114 ID=43265
DF PROTO=TCP SPT=60182 DPT=80 WINDOW=8280 RES=0x00 ACK URGP=0 

how to set this iptables rules?

what's this attack?
thanks your any help!







