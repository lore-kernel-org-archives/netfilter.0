From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: 14 Jan 2003 16:49:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042559354.464.770.camel@xbox>
References: <20030114093711.GC9940@westend.com>
	<20030114121232.GA3362@westend.com> <1042551825.465.143.camel@xbox> 
	<20030114150641.GB23431@westend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114150641.GB23431@westend.com>
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
To: Christian Hammers <ch@westend.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-01-14 at 16:06, Christian Hammers wrote:
> 
> On Tue, Jan 14, 2003 at 02:43:45PM +0100, Filip Sneppe wrote: 
> > About the high nuber of tracked connections, are you
> > talking about /proc/net/ip_conntrack ?
> Yes. As wrote in my previous mail (should have written it here, too),

Ah - that mail - I already deleted it from my mailbox.

> this router does asymetric routing, i.e. the packets for a connection
> come in over it but the answer packets go out via another router. 
> So it will almost never see a real 3way tcp handshake or the like.
> 

Wel, connection tracking was not really designed to handle asymetric
routing setups, so you're basically screwed. No stateful
packet filtering firewall will handle this decently, I guess.

On thing you can do, is apply the 'raw' patch from patch-o-matic
(written by Jozsef Kadlecsik), this allows you not to track
particular traffic. In your case, you will need to specify
rules for all (asymetric) traffic that should not be tracked by 
your firewall. If *all* your traffic is essentially asymetric in
nature, you'de be better off not using ip_conntrack at all...

Hope this helps...

Regards,
Filip


