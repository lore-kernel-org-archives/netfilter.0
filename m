From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: default policy
Date: Sun, 3 Nov 2002 11:51:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211031152.gA3Bq0e16396@vulcan.rissington.net>
References: <Pine.LNX.4.44.0211030420260.14561-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0211030420260.14561-100000@dell>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Sunday 03 November 2002 9:23 am, Robert P. J. Day wrote:

> On Sat, 2 Nov 2002, Rob wrote:
> > > > You should never set any default policy other than ACCEPT on
> > > > a nat or mangle table.
> > > >
> > > > I sometimes think it was a bad idea even to make it possible.
> > >
> > > No, I don't think so. It's hard for beginners, yes. But once
> > > >you understand
> > > what iptables is capable of (compared to other commercial products)
> > > you actually are glad that there is a product giving you control over
> > > everything.
> > > Defining the policies for every chain is such a freedom.
> > >
> > Can you think of a situation where it would be a good idea to set
> > a default
> > policy other than ACCEPT for a nat or mangle table ?
> > 
> > Antony.
>
> perhaps i missed an earlier response to this, but what is the
> effect of setting a DROP policy on a nat or mangle chain?
> does this mean that any packet that matches a mangle or nat rule
> will be, not mangle'd or nat'ed, but dropped?

No, but you're close.   It means that any packet which does *not* match a 
mangle or nat rule will be dropped.   The ones which do match a rule will do 
whatever that rule says.

> sorry if this question has an obvious answer, but assigning a
> default policy to anything but the filter table is woefully
> under-documented.

IMHO the only documentation it needs is "don't".   :-)

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

