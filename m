From: Raido Kurel <raido@elin.ttu.ee>
Subject: Re: dnat problem in transparent firewall
Date: Wed, 4 Aug 2004 15:05:00 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408041505.00078.raido@elin.ttu.ee>
References: <200408041010.32442.raido@elin.ttu.ee> <200408041414.51486.raido@elin.ttu.ee> <200408041230.03828.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408041230.03828.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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


> What do your LOGging rules say?   Is it possible that you are trying to LOG
> packets addressed to aaa.aaa.aaa.12, and therefore the rules no longer see
> the packets once the address has been changed to aaa.aaa.aaa.13?

That's a good point. I checket it also over several times.
Thats why I also tested and wrote, that I see packets if I try to connect to 
aaa.aaa.aaa.13

I added 2 logging rules for every logging point from a) to d).
For example exact logging rules for a) are :
iptables -t nat -A PREROUTING -s nnn.nnn.nnn.nnn -d aaa.aaa.aaa.12 -j LOG 
--log-prefix " ipt nat pre "
iptables -t nat -A PREROUTING -s nnn.nnn.nnn.nnn -d aaa.aaa.aaa.13 -j LOG 
--log-prefix " ipt nat pre "

where nnn.nnn.nnn.nnn is a computer from where I connect behind other ISP.

It should not be relevant, but the port I try to connect for testing right now 
is ssh. I try to connect with telnet aaa.aaa.aaa.12 22.
both .12 and .13 have ssh servers up and running.

Raido



