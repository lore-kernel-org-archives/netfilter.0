From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: AW: default policy
Date: Sun, 3 Nov 2002 07:12:05 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211030706350.29084-100000@dell>
References: <200211031152.gA3Bq0e16396@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211031152.gA3Bq0e16396@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Sun, 3 Nov 2002, Antony Stone wrote:

> On Sunday 03 November 2002 9:23 am, Robert P. J. Day wrote:

> > perhaps i missed an earlier response to this, but what is the
> > effect of setting a DROP policy on a nat or mangle chain?
> > does this mean that any packet that matches a mangle or nat rule
> > will be, not mangle'd or nat'ed, but dropped?
> 
> No, but you're close.   It means that any packet which does *not* match a 
> mangle or nat rule will be dropped.   The ones which do match a rule will do 
> whatever that rule says.

ok, i guess that makes sense.
> 
> > sorry if this question has an obvious answer, but assigning a
> > default policy to anything but the filter table is woefully
> > under-documented.
> 
> IMHO the only documentation it needs is "don't".   :-)

now that i understand what it means, i can vaguely see how someone
might use it -- if you expect all of the packets passing through
some point in the packet traversal path to need to be nat'ed or
mangle'd in some way, and for some (unforeseen) reason, a packet
does not have the appropriate matching properties, your conclusion
should normally be that you have no idea what this packet is doing
here and you're not sure what to do with it.  in that case, DROPping
it might make sense.

but i would *much* rather deal with cases like that in the filter
table.  i tend to agree with antony -- this is a feature that just
begs to make life more confusing since it just adds to the possible
places where packets might be discarded.

rday


