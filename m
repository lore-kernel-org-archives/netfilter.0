From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can reach some websites, can't reach others
Date: Sat, 22 May 2004 14:52:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221452.41022.Antony@Soft-Solutions.co.uk>
References: <20040522115927.GA18767@localnet> <200405221328.33189.Antony@Soft-Solutions.co.uk> <1085232725.15548.1.camel@localhost>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1085232725.15548.1.camel@localhost>
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

On Saturday 22 May 2004 2:32 pm, John A. Sullivan III wrote:

> On Sat, 2004-05-22 at 08:28, Antony Stone wrote:
> > On Saturday 22 May 2004 12:59 pm, Sven Riedel wrote:
> > > Hi,
> > > I'm using a Linux 2.6.6 box as a masquerading firewall via dialup for a
> > > local network. From the internal network I can reach some websites
> > > (e.g. www.debian.org) but can't reach others (e.g. www.freshmeat.net).
> > > The unreachable sites _can_ be reached from the firewall-box itself
> > > though.
> >
> > This sounds like an MSS / MTU mismatch poblem.   Try doing a Google
> > search for "clamp MSS to MTU" - that should give you some pointers.
> >
> > Can't offer specific advice myself since I've never experienced the
> > problem, but I've seen it here from others several times before.
>
> Antony's diagnosis is the more likely problem but,  if there is an old
> proxy somewhere in the path, it can produce similar results.  If the
> page uses some call that the proxy does not understand, some pages may
> be blocked.

I agree that this is a possible cause of some web pages being inaccessible, 
however I don't think it would manifest itself as described, for clients 
forwarded through the firewall, but not when the firewall itself is the 
client, (any intermediate proxy would be present in both cases) nor do I 
think (hope) that such a thing is likely with a high-traffic site such as 
freshmeat - either the site or the proxy would have been changed some time 
ago...

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


