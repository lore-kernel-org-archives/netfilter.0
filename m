From: Fabian Wolter <netfilter-ml@fabian-wolter.de>
Subject: How to masquerade when using ROUTE
Date: Sun, 08 May 2005 01:44:58 +0200
Message-ID: <427D52FA.8020805@fabian-wolter.de>
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

I want to route all outgoing port-25-traffic produced by the clients
over ppp1. The rest schould take the default route over ppp0.

I used the following command:

iptables -A PREROUTING -p tcp --dport 25 -t mangle -i eth0 -j ROUTE
--oif ppp1

But the source addresses of the packets are wrong as "tcpdump -ni ppp1"
shows:

01:20:24.422756 IP 192.168.0.4.32825 > 160.45.10.13.25: S
2020082843:2020082843(0) win 5840 <mss 1460,sackOK,timestamp 266850[|tcp]>

192.168.0.4 is the IP adress of the client which tried to connect to the
mailserver 160.45.10.13.25.

Masquarding is done to 192.168.0.0/24:

# iptables -t nat -L POSTROUTING
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  192.168.0.0/24       anywhere

My default route is set to ppp0.

So, how can I replace/masquerade the 192.168.0.4 by the official IP
address of ppp1?

Regards,
Fabian


