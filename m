From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: setting fwmark in output chain for policy routing
Date: Wed, 12 Jun 2002 10:55:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020612145516.GG21405@cannon.eng.us.uu.net>
References: <NJEFLNJDIFFNMHDEBKMJKEGLDOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJKEGLDOAA.jpatterson@asgardgroup.com>
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
To: Joe Patterson <jpatterson@asgardgroup.com>, "Matthew G. Marsh" <mgm@paktronix.com>
Cc: netfilter@lists.samba.org

Good question. It gets even worse: when I add a set
of "equalize" routes towards a certain destination,
it only round-robins for the transit packets but the
locally generated packets keep going out through the
same interface all the time, even if the src is set
to a loopback (dummy) address.

Here is Matthew Marsh the man!!
Matthew, can you shed some light on these issues?

Ramin


On Tue, Jun 11, 2002 at 05:51:00PM -0400, Joe Patterson wrote:

> I've got a kind of an odd setup, and am curious about something.
> 
> I've seen some references that say that one should be able to set an fwmark
> on a packet in the mangle/OUTPUT chain, and then have the linux policy
> routing database determine the route to use based on that fwmark.  I'm a
> little confused as to the order in which this happens.  I would think that
> in order to be able to hand a packet to netfilter, it'd have to be a pretty
> complete packet, including things like the source IP address.  However, the
> source address of a localy generated packet is determined by which route it
> matches.  But you can't know which route it matches unless you have all of
> the information, such as the fwmarks.
> 
> It seems to me to be a bit of a chicken-and-egg thing.  Or is the source
> address determined first, based on the route that the packet will *probably*
> take, then it's shipped through mangle/OUTPUT, then the real routing
> decision is made?
> 
> This is kind of halfway between netfilter and lartc, but I figured someone
> here might know better than I.
> 
> Thanks,
> 
> -Joe Patterson, CCNP, CISSP
> Senior Security Engineer
> The Asgard Group
> (954)343-4370 x102
> jpatterson@asgardgroup.com
> 
> 

