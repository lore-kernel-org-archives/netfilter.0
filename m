From: RD <bitoy@lawin.pinoy.org>
Subject: Passive FTP Problem
Date: Sat, 30 Jul 2005 17:35:17 +1000
Message-ID: <42EB2DB5.5010300@lawin.pinoy.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello All,

I have both ip_conntrack_ftp and ip_nat_ftp loaded in my iptables script 
but still having trouble getting passive ftp from...below's the firewall 
log.

Jul 30 17:44:14 alab kernel: IN=eth1 OUT=eth0 SRC=192.168.0.254 
DST=65.208.228.223 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=22214 DF 
PROTO=TCP SPT=2019 DPT=32895 WINDOW=65535 RES=0x00 SYN URGP=0
Jul 30 17:44:15 alab kernel: IN=eth1 OUT=eth0 SRC=192.168.0.254 
DST=65.208.228.223 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=22315 DF 
PROTO=TCP SPT=2020 DPT=32896 WINDOW=65535 RES=0x00 SYN URGP=0
Jul 30 17:44:18 alab kernel: IN=eth1 OUT=eth0 SRC=192.168.0.254 
DST=65.208.228.223 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=22404 DF 
PROTO=TCP SPT=2020 DPT=32896 WINDOW=65535 RES=0x00 SYN URGP=0
Jul 30 17:44:24 alab kernel: IN=eth1 OUT=eth0 SRC=192.168.0.254 
DST=65.208.228.223 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=22420 DF 
PROTO=TCP SPT=2020 DPT=32896 WINDOW=65535 RES=0x00 SYN URGP=0

Any advise would be appreciated.

Thanks,
RD

