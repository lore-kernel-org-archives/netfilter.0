From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: clearing dont-fragment bit
Date: Thu, 9 Oct 2003 11:49:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009154906.GC14078@cannon.eng.us.uu.net>
References: <20031009134311.GA25685@oasis.frogfoot.net> <Pine.LNX.4.51.0310091554380.26697@dns.toxicfilms.tv> <20031009140819.GA25984@oasis.frogfoot.net> <20031009144334.GB14078@cannon.eng.us.uu.net> <20031009145248.GA26549@oasis.frogfoot.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031009145248.GA26549@oasis.frogfoot.net>
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
Content-Transfer-Encoding: 7bit
To: Netfilter Discussions <netfilter@lists.netfilter.org>

On Thu, Oct 09, 2003 at 04:52:48PM +0200, Abraham van der Merwe wrote:

> Ideally one would want to leave DF untouched unless a packet with DF=1 is
> resent in which case you clear it - that way you solve PMTU probes, but I
> suspect this would be overly complicated / resource intensive.
> 
> Even better would be if there was a tunnelling protocol that would just take
> packets on side A (incl ip headers, galore), chop it up, and reassemble it
> on the other side. Unfortunately there is no such thing :P

Use conntrack on both sides at the entrance. It'll ensure the reassembly of
the fragments...

> 
> > Can you come up with a list of the non-TCP-based application protocols that
> > would use the PMTU (DF bit)?
> 
> Basically any UDP application that sends packets bigger than the maximum
> allowed mtu. I would assume TFTP, SNMP, etc. would all get into trouble. I
> know that some protocols such as DNS try to stay below 512 bytes payload,
> but there is probably a gazillion protocols out there that don't.

Neither TFTP nor SNMP set the DF bit and as you said DNS enforces the
packet size itself. NFS might do that though (not sure) but one would
think that NFS should not span over the Internet. So, what other UDP-based
applications use the DF bit?

Ramin

