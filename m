From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Wed, 30 Jun 2004 15:19:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406301519.04295.Antony@Soft-Solutions.co.uk>
References: <B732FD42D68974438C1451C73C1D030FD1EE0E@FR92EX02.eu.abxlogistics.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B732FD42D68974438C1451C73C1D030FD1EE0E@FR92EX02.eu.abxlogistics.com>
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

On Wednesday 30 June 2004 2:33 pm, IZEM Farid wrote:

> Hi all,
>
> I'm trying to customize my iptables rules.
> Let us imagine we have three hosts which users have to access:
> 	HOST1
> 	HOST2
> 	HOST3
>
> Is this configuration correct?
> 	Iptables -N HOST1_RULESETS
> 	Iptables -N HOST2_RULESETS
> 	Iptables -N HOST3_RULESETS
>
> In each new chain, I will add rules to accept connections to some services
> like telnet, ssh, IBM Client Access. And after, I will do this thing:
> 	Iptables -A FORWARD -i eth0 -o eth1 -j HOST1_RULESETS
> 	Iptables -A FORWARD -i eth0 -o eth1 -j HOST2_RULESETS
> 	Iptables -A FORWARD -i eth0  -o eth1 -j HOST3_RULESETS
>
> In fact, what I'm looking for is that I can organized my rules by hosts
> instead of adding all rules to all hosts in FORWARD chain ?
>
> With the configuration, I describe, will all rules in the HOSTX_RULESETS
> being check ?
>
> I think, it's correct but I'm not totally sure.

Yes, that looks fine to me - the only thing you need to remember is that the 
first rule which matches, with an ACCEPT, DROP or REJECT target, will 
determine the fate of the packet.

Organising rules into user-defined chains like this is fine with netfilter, if 
it makes it easier for you to work with.

The only thing I would suggest changing about what you've written above is 
that if the chain HOST1_RULESETS is supposed to be for packets going only to 
HOST1, then your FORWARD rule jumping to that chain should only do so for 
packets going to HOST1 (similarly for HOST2, HOST3 etc).

iptables -A FORWARD -i eth0 -o eth1 -d $HOST1 -j HOST1_RULESETS

That ensures that packets for HOST2, which cannot possibly match any of the 
rules in HOST1_RULESETS, don't have to traverse all the way through the rules 
before then getting a chance at HOST2_RULESETS.

PS: Don't forget a general rule allowing for the reply packets :)

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


