From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: How to prevent smurf atacks?
Date: Wed, 5 Jun 2002 10:33:53 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605143353.GG29214@cannon.eng.us.uu.net>
References: <LAW2-F126qZNn1NCpEq000166b1@hotmail.com> <20020605135303.GF29214@cannon.eng.us.uu.net> <20020605140533.GA5546@alcove.wittsend.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020605140533.GA5546@alcove.wittsend.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francisco Alfonso Martinez Lopez <pijoman@hotmail.com>, netfilter@lists.samba.org

On Wed, Jun 05, 2002 at 10:05:33AM -0400, Michael H. Warfield wrote:

> On Wed, Jun 05, 2002 at 09:53:03AM -0400, Ramin Alidousti wrote:
> > On Wed, Jun 05, 2002 at 01:27:41PM +0000, Francisco Alfonso Martinez Lopez wrote:
> 
> 
> > > Hi everybody,how I can denied smurf atacks over my host,it's a single 
> > > connection to Internet,any possibilitie of denied smurf atack on the 
> > > firewall?(my host execute dual boot:suse linux&windows)
> 
> > What exactly do you mean by "smurf attack"? Let us know and
> > the rules will follow...
> 
> 	A smurf attack is a spoofed ICMP packet (or possibly UDP packet,
> but ICMP ECHO is the classic form) directed to a network broadcast address
> and spoofed to be from the target.  The result is a flood of packets
> from all the responding hosts hitting the target and potentially overwhelming
> his bandwidth.  This is often referred to as smurf amplification and the
> exploitable network referred to as a smurf amplifier.
> 
> 	The prevention is to block directed (that is routed over a router)
> broadcasts.  If he only has a single host with a single IP address, I don't
> see how smurf affects him.  He could refuse to respond to any incoming
> requests which are addressed to the broadcast address of the network

or originating from a broadcast source which make you participate
in the attack (where you become the bad guy)...

> to which he's connected.  That would be a valid action on, say, a cable
> modem where you are a member of a network.  But it only eliminates that
> one IP address from participating.  I don't think it would be meaningful
> if it were a dialup to an ISP where you just have a point to point
> connection, though.

See above.

> 
> 	The correct solution needs to be applied at the final (local)
> router, though.  That is the device which should block any incoming
> packets directed at the local broadcast address from outside of the
> network.  Outside of that router, you can't reliably determine what
> constitutes the local broadcast address and it's the single point where
> external attacks can be stopped for the entire network.

Excellent. By this definition, I think it's doable to come up with
rules to minimize the affects of this kind of attack.

BTW, the reason I asked the original poster for his definition of this
term was that I had the feeling that he'd heard the term but didn't know
what it was and was only looking for a off-the-shelf rule set. It sounded
like "how can I set up a firewall" or "how can I protect my network from
bad guys". If I was wrong about this assumption, my apologies to the
original poster :-)

Ramin

> > > Thanks in advance,folks!!(...and sorry for my english)
> > > 
> > > 
> > > 
> > > _________________________________________________________________
> > > Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp.
> > > 
> 
> -- 
>  Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
>   /\/\|=mhw=|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/mhw/
>   NIC whois:  MHW9      |  An optimist believes we live in the best of all
>  PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

