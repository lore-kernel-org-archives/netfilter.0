From: "Stephan Viljoen" <steph@gabswave.net>
Subject: Linux router/gw box.
Date: Thu, 6 Nov 2003 19:10:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008201c3a488$ddf4a090$0200010a@Tinkerbell>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi there,

I've build a router for my wireless users which is about 50 customers.
Now each user has it's own subnet which I all added onto one network
card. How good idea is it to do something like this and is there a
better way off doing this. I'm somewhat new to this whole netfiler / ip
routing thing. This is what my routing table looks like at the moment.

I've basically added virtual interfaces for each subnet on one network
card.
Example : eth1:0 , eth1:1, eth1:2

Kind Regards
Stephan

10.0.1.168      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.172      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.160      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.164      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.184      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.188      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.176      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.180      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.136      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.140      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.128      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.132      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.152      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.156      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.148      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.232      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.236      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.224      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.228      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.248      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.252      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.240      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.244      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.200      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.204      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.192      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.196      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.216      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.208      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.212      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.44       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.40       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.36       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.32       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.60       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.56       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.52       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.48       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.12       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.8        0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.4        0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.0        0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.28       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.24       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.20       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.16       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.108      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.104      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.96       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.124      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.120      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.116      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.112      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.76       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.72       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.68       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.64       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.92       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.88       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.84       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.1.80       0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.2.240      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.2.244      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.2.248      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.2.228      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.2.232      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.2.236      0.0.0.0         255.255.255.252 U     0      0        0
eth1
10.0.5.0        0.0.0.0         255.255.255.248 U     0      0        0
eth1
10.0.5.24       10.0.1.26       255.255.255.248 UG    0      0        0
eth1
10.0.5.16       0.0.0.0         255.255.255.248 U     0      0        0
eth1
10.0.5.40       0.0.0.0         255.255.255.248 U     0      0        0
eth1
10.0.5.56       0.0.0.0         255.255.255.248 U     0      0        0
eth1
10.0.0.0        0.0.0.0         255.255.255.240 U     0      0        0
eth1
10.1.0.0        0.0.0.0         255.255.255.224 U     0      0        0
eth1
10.2.0.0        0.0.0.0         255.255.0.0     U     0      0        0
eth1
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0
eth2
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0
lo
0.0.0.0         217.10.176.149  0.0.0.0         UG    0      0        0
eth0


