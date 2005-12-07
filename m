From: "Sven Geschke" <hellion@gmx.net>
Subject: NAT through transfer-Lan
Date: Wed, 7 Dec 2005 15:24:05 +0100 (MET)
Message-ID: <23477.1133965445@www59.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.netfilter.org

Hi

It seems iv pasted an incomplete routing table into my last posting, so
here's the right one:

Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
213.30.216.40   0.0.0.0         255.255.255.248 U     0      0        0 eth1
10.49.0.0       0.0.0.0         255.255.255.0   U     0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth1
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         213.30.216.41   0.0.0.0         UG    0      0        0 eth1

We apologize for the inconvenience...

Rgds
Sven

-- 
GMX DSL-Flatrate 1 Jahr kostenlos* + WLAN-Router ab 0,- Euro*
Bis 31.12.2005 einsteigen! Infos unter: http://www.gmx.net/de/go/dsl

