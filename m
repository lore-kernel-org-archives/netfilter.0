From: Brent Clark <bclark@eccotours.co.za>
Subject: cant route out
Date: Sat, 18 Feb 2006 21:45:44 +0200
Message-ID: <43F77968.4050609@eccotours.co.za>
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

Hi all I seem to have a very weird problem.

I have a gateway that allows me to route into the LAN etc, but for some reason I cant get traffic out.

I have apprended a route like below to help me if its getting that far, and it defiantly is.

$IPT -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/24 -j LOG --log-prefix "POST ROUTE: "
--log-tcp-options --log-ip-options

Feb 18 19:14:16 ukgate kernel: POST ROUTE: IN= OUT=eth0 SRC=10.0.0.74 DST=140.135.10.98 LEN=48
TOS=0x00 PREC=0x00 TTL=127 ID=52278 DF PROTO=TCP SPT=1336 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0
OPT (020405B401010402)
Feb 18 19:14:16 ukgate kernel: POST ROUTE: IN= OUT=eth0 SRC=10.0.0.74 DST=219.159.9.103 LEN=48
TOS=0x00 PREC=0x00 TTL=127 ID=52279 DF PROTO=TCP SPT=1337 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0
OPT (020405B401010402)
Feb 18 19:14:16 ukgate kernel: POST ROUTE: IN= OUT=eth0 SRC=10.0.0.74 DST=219.117.8.205 LEN=48
TOS=0x00 PREC=0x00 TTL=127 ID=52280 DF PROTO=TCP SPT=1338 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0
OPT (020405B401010402)


ukgate:~# ip route show
217.206.34.80/28 dev eth0  proto kernel  scope link  src 217.206.34.82
10.0.0.0/24 dev eth1  proto kernel  scope link  src 10.0.0.4
default via 217.206.34.81 dev eth0
ukgate:~#

And the weird thing is, is that tcpdump shows the client trying to connect

ukgate:~# tcpdump -nn port 80
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
19:21:59.735233 IP 10.0.0.4.1900 > 219.54.8.100.80: S 340139438:340139438(0) win 65535 <mss
1460,nop,nop,sackOK>
19:21:59.735396 IP 10.0.0.4.1901 > 213.73.201.11.80: S 340204029:340204029(0) win 65535 <mss
1460,nop,nop,sackOK>
19:22:01.734139 IP 10.0.0.4.1904 > 218.212.34.220.80: S 340860984:340860984(0) win 65535 <mss
1460,nop,nop,sackOK>
19:22:02.706327 IP 10.0.0.4.1900 > 219.54.8.100.80: S 340139438:340139438(0) win 65535 <mss
1460,nop,nop,sackOK>
19:22:02.706347 IP 10.0.0.4.1901 > 213.73.201.11.80: S 340204029:340204029(0) win 65535 <mss
1460,nop,nop,sackOK>
19:22:04.717925 IP 10.0.0.4.1904 > 218.212.34.220.80: S 340860984:340860984(0) win 65535 <mss
1460,nop,nop,sackOK>


If anyone could assist, I would be most grateful.

Kind Regards
Brent Clark

P.s.

I have echo 1 > /proc/sys/net/ipv4/ip_forward in my ruleset.



