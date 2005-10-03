From: David Leangen <dleangen@canada.com>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Mon, 03 Oct 2005 13:51:41 +0900
Message-ID: <4340B8DD.4070601@canada.com>
References: <NEBBKBPLMLNABNADCIPAIEDLBHAB.dleangen@canada.com>	<4338A962.6000104@canada.com>
	<433B70D6.6030201@canada.com> <433BDBE3.5010605@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433BDBE3.5010605@mnemon.de>
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


Hello!

 >>    +---------------+
 >>    |     modem     |
 >>    | (192.168.1.1) |
 >>    +---------------+
 >>            |
 >>   +-----------------+
 >>   |       ppp0      |
 >>   |        |        |
 >>   |  ...1.2 (eth0)  |
 >>   |        |        |eth1
 >>   |           ...2.1|-----192.168.2.0/24
 >>   |     Firewall    |
 >>   +-----------------+
 >
 > [SNIP]
 >
 >
 >>Destination Gateway    Genmask      Iface
 >>192.168.1.0    *    255.255.255.0   eth0
 >>192.168.2.0    *    255.255.255.0   eth1
 >>default       xxx   0.0.0.0         ppp0
 >
 >
 > [Rest snipped - probably not relevant]
 >
 > The only thing I can think of, is that pppd causes the problem.
 > I think the following happens:
 >
 > 2.2 sends to 1.1
 > Firewall receives on 2.1
 > According to routing table firewall tries to send out on eth0
 > But eth0 is now owned by pppd
 > And pppd doesn't know about 1.1, he only knows about default
 > gateway xxx
 >
 > As already said - this may be totally wrong (someone correct
 > me please).
 >
 > I bet if you stop pppd, 2.2 can connect to 1.1 without any firewall
 > rules (as long as the policies are ACCEPT and default gateway on 2.2
 > points to 2.1). If this is true, the question is how to persuade
 > pppd to deliver to 1.1. Sorry, I can't help you - may be
 > somebody can jump in.

Hmmm... unfortunately, this does not seem to be the case...

I say this for two reasons:

  1. I can still connect to 192.168.1.1 from 192.168.2.1
  2. Even when I bring down ppp0, I still can't reach
     192.168.1.1 from anywhere other than the machine
     I mention in (1)

Unless, I didn't do the right thing. I simply did:

  # ifconfig ppp0 down

Is this sufficient?


Thanks again!!

Dave


