From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: avoid NAT for one address?
Date: Sat, 24 Jul 2004 18:24:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241824.43799.Antony@Soft-Solutions.co.uk>
References: <1090688447.17721.24.camel@les-home.futuresource.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090688447.17721.24.camel@les-home.futuresource.com>
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

On Saturday 24 July 2004 6:00 pm, Les Mikesell wrote:

> So, the long story comes down to this question: is there a simple
> statement I can add to force all packets to a certain destination
> to skip over all the other special cases and go directly out the
> right interface with no nat or other changes?  I'd like to keep the
> changes to a minimum since everything else works.

iptables -I POSTROUTING -t nat -d a.b.c.d -j ACCEPT

where a.b.c.d is the destination address for packets you don't want anything 
changed on.

The "-I" will insert this rule at the top of the POSTROUTING chain, and "-j 
ACCEPT" will skip all the other rules in the chain.

If you want to do this for a block of addresses, you can use a.b.c.d/x, or if 
you want to do it for multiple unrelated addresses, just repeat the rule for 
each address.

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


