From: "Remus" <rmocius@auste.elnet.lt>
Subject: router protection with iptables
Date: Mon, 25 Nov 2002 10:45:28 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01bd01c2946f$c8498fa0$6e69690a@rimas>
References: <B5D7C6B6D020D511838A0060082D4CC90299BBF7@kheops.sigma.fr>
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

Hi folks,

I have small router on Linux box.
It has two NICs and I use it to route real IP addresses (basicly I use it to
replace CISCO router, it is cheaper :-) )
I have a command echo 1 > /proc/sys/net/ipv4/ip_forward and everything works
just fine.

I'm wondering about iptables rules which I can use to protect my router from
hackers.
I want all IP/UDP/ICMP packets to go trought my router in both ways, just to
protect my router.
Behind the router I have Firewalls and they do a protection job for my www,
mail and local network.

What you can recomend for me?

Thank you

Remus



