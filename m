From: Optimus Prime <optimusprime@o2.pl>
Subject: routing by tos
Date: Sat, 26 Apr 2003 00:00:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA9AFF8.5000302@o2.pl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi

I have to routers and with two Internet connections on them and I wanted 
to set up routing by TOS.

I tryed diffrent configurations of IPtables tos marking and iproute tos 
routing and everything failed.

Can you give me a working example or help?

this is what I did on the box with is a default router:

   iptables -t mangle -I PREROUTING -i eth0 -s 192.168.0.10 -j TOS 
--set-tos Minimize-Cost

   ip route add tos 2 via 192.168.0.2

eth0 is the internat netword interface
192.168.0.2 is the internal network router_2 address

Optek


