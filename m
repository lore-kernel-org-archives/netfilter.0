From: Marek Nawa <mnawa@sst.pl>
Subject: how to see marker value in syslog
Date: Wed, 29 Mar 2006 08:29:18 +0200
Message-ID: <442A293E.6080803@sst.pl>
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

I'm using on my server Debian stable with iptables. I've configure 
traffic control (command tc from iproute2) based on filter fw (marked 
packages from iptables). I have advanced router with failover and 4 
network interfaces and I had to define more than one marking rule.
e.g.
iptables -A PREROUTING -t mangle -i eth0 -j MARK --set-mark 10

I've defined too rule for loggin results:
iptables -t mangle -A PREROUTING -i eth0 -m limit --limit 1/s -j LOG 
--log-prefix "mark testMN prerouting 10 " --log-level debug 
--log-ip-options --log-tcp-options

and I've found in syslog

Mar 28 14:50:11 routerUbuntu kernel: mark testMN prerouting 10 IN=eth0 
OUT= MAC=00:0e:0c:7f:2a:7f:00:c0:7b:a2:e7:06:08:00 SRC
=213.218.117.68 DST=217.8.184.66 LEN=60 TOS=0x10 PREC=0x00 TTL=53 
ID=23913 DF PROTO=UDP SPT=14026 DPT=16384 LEN=40
Mar 28 14:50:12 routerUbuntu kernel: mark testMN prerouting 10 IN=eth0 
OUT= MAC=00:0e:0c:7f:2a:7f:00:c0:7b:a2:e7:06:08:00 SRC
=213.218.117.68 DST=217.8.184.66 LEN=60 TOS=0x10 PREC=0x00 TTL=53 
ID=23963 DF PROTO=UDP SPT=14026 DPT=16384 LEN=40
Mar 28 14:50:13 routerUbuntu kernel: mark testMN prerouting 10 IN=eth0 
OUT= MAC=00:0e:0c:7f:2a:7f:00:c0:7b:a2:e7:06:08:00 SRC
=64.236.34.4 DST=217.8.184.84 LEN=1448 TOS=0x00 PREC=0x00 TTL=42 
ID=30688 PROTO=TCP SPT=80 DPT=3714 WINDOW=4096 RES=0x00 ACK
URGP=0

but I can't find iformation about my marker value 10.
Please give me a solution, how can I investigate in log files packages 
with their marker-value.

-- 
Regards,

Marek 




