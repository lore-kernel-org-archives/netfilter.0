From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables questions
Date: Mon, 17 Nov 2003 14:18:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171418.hAHEIAj22127@agate.rockstone.co.uk>
References: <003601c3ab66$7396c360$2178df50@lanzor2k.com> <3FB8D61F.7050005@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FB8D61F.7050005@Loudoun-Fairfax.com>
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

On Monday 17 November 2003 2:07 pm, Jeffrey Laramie wrote:

> Antti Korpela wrote:
> >
> > 1. What difference and which is better between: iptables -t nat -j
> > MASQUERADE or SNAT --to IP if im using it for internet gateway
> > NAT-machine in big LAN-parties, over 300 IP:s.
>
> According to Oskar's tutorial SNAT is preferable for static IPs:

My understanding is that SNAT is marginally more efficient than MASQUERADE 
because the address to be susbstituted is fixed in the SNAT rule, whereas 
with MASQUERADE the rule needs to look up the address of the interface before 
it knows what to replace into the packet.

Whether you could measure the difference in efficiency between the two rules 
is another matter entirely, however.   My recommendation would be to go for 
maximum readability of your rules.

Regards,

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.

