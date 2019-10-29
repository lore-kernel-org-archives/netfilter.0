From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Named sets with timeout
Date: Tue, 29 Oct 2019 12:35:53 +1100
Message-ID: <20191029013553.GA1938@dimstar.local.net>
References: <cd3973f01a86ebc50a7fae9da40f29ce@mailtower.de>
 <87wocowgab.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87wocowgab.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: matt-nft@mailtower.de, trentbuck@gmail.com

On Tue, Oct 29, 2019 at 11:23:40AM +1100, Trent W. Buck wrote:
> Matt <matt-nft@mailtower.de> writes:
>
> > Then i add the following sample element to it:
> >   /usr/sbin/nft add set ip filter_v4 my_drop \{type ipv4_addr \; flags
> > timeout \; elements=\{a.b.c.d timeout 600s  \} \;\}
> >
> > All good so far, a.b.c.d is counting down as expected,
> > beginning with 10min.
> > But when I wait - say 1 minute and repeat the 'nft add set ... 600s'
> > command from above then the timer remains unchanged (?)
> > It looks as the timer cannot get changed anymore once it has been
> > initialized.
>
> I think you are right, but see this recent commit (in 0.9.2+):
>
>     24f33c7 2019-06-17 18:15 +0200 LGL
>     src: enable set expiration date for set elements
>
>     https://git.netfilter.org/nftables/commit/?id=24f33c7
>
> ...which sounds like there is a new (as-yet-undocumented?) keyword for
> changing (as opposed to initializing) the timeout of a set element.
>
It's "update"

I.e. use update instead of add got get timeout to reset.

Needs kernel 5.3 IIRC

Cheers ... Duncan.
