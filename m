From: Michael Gale <michael.gale@utilitran.com>
Subject: blocking Multicast packets
Date: Wed, 18 Aug 2004 05:43:03 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040818054303.1ec43592@mgalepc.utilitran.com>
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

Hello,

	We seem to have a problem with multi-cast packets, our develop team was testing some kind of load balancer which is
causing about 100 packets a second to be sent out continuously:


05:35:44.864029 IP X.X.X.9128 > 230.0.0.1.9128: UDP, length: 1000

So this drives up the network card IRQ request I believe using anywhere from 10%-80% of the CPU:

    4 root      19  19     0    0     0 SWN  17.1  0.0 225:28   1 ksoftirqd_CPU1
    3 root      19  19     0    0     0 SWN  14.5  0.0 228:31   0 ksoftirqd_CPU0

So I thought about adding in a iptables rule to block all the traffic but it is not working. I have added the following
rules with out effect:

iptables -I INPUT -i eth1 -s X.X.X.X -j DROP
iptables -I FORWARD -i eth1 -s X.X.X.X -j DROP

I never see the byte counters increment at all .. they are staying at zero ??

-- 
Michael Gale

