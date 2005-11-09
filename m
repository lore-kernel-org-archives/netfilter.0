From: marcel lilienthal <ml@northernmaniacs.com>
Subject: initiate a broadcast with dnat
Date: Wed, 09 Nov 2005 21:22:27 +0100
Message-ID: <1131567747.9985.22.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hello,

i want to initiate a broadcast if a udp packet with destination port
9999 reaches my router.
i have two devices: ppp0 (wan), eth0 (lan). broadcast of eth0 is
192.168.0.255.

when i use
iptables -t nat -A PREROUTING -i ppp0 -p upd --dport 9999 -j DNAT
--to-destination 192.168.0.255:9

the packet gets into the INPUT chain of ppp0 instead of the FORWARD
chain. if i use a non broadcast destination ip, the packet gets into
FORWARD chain.

is there a way to initiate a broadcast with iptables?

regards, marcel


