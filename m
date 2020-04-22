From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nfnetlink: This library is not meant as a public API for
 application developers.
Date: Wed, 22 Apr 2020 11:37:46 +1000
Message-ID: <20200422013746.GC30155@dimstar.local.net>
References: <bcff17cd-1457-7454-e00f-22d798afd7e5@tana.it>
 <20200412082153.GG13869@dimstar.local.net>
 <5f066999-b830-07ba-c0f6-6ceba39c580e@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5f066999-b830-07ba-c0f6-6ceba39c580e@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: Netfilter <netfilter@vger.kernel.org>, Netfilter Development <netfilter-devel@vger.kernel.org>

Hi Ale,

You raise some interesting points. I'm taking this discussion onto the
netfilter-devel list which I think is more appropriate.

On Mon, Apr 13, 2020 at 08:46:59PM +0200, Alessandro Vesely wrote: [...]
> On Sun 12/Apr/2020 10:21:53 +0200 Duncan Roe wrote:
> > On Thu, Feb 13, 2020 at 12:27:41PM +0100, Alessandro Vesely wrote:
> > > Has that disclaimer always been in libnfnetlink home page[*]?
> > >
> > > It is the first time I see it.
> > >
> > > I have a userspace filter[???] working with it,
> > > and it currently works well.
> > >
> > > If I remove -lnfnetlink from the link command, I get just one undefined
> > > reference to symbol 'nfnl_rcvbufsiz'.
> > > It is used only if there is a command line option
> > > to set the buffer size to a given size, to avoid enobufs.
> > > For the rest, the daemon uses libnetfilter_queue.

This is loader trickery.

You have written your userspace filter using the deprecated interface, which
uses libnfnetlink under the covers.

That's fine - the Library Setup module documents how to use the deprecated
interface. The current functions use libmnl, but documentation for these is
still under development.
> > >
> > > Should I rewrite that?  How?
> > >
> >
> > Yes you can code to avoid using nfnl_rcvbufsiz() from libnfnetlink.
> >
> > Thre is no libmnl or libnetfilter_queue function to do it at present, but
> > libmnl/examples/netfilter/nfct-daemon.c has the code.
> > In case you haven't git cloned libmnl, here is a summary:
> >
> > > socklen_t buffersize; // Set by your command-line option
> > Your code likely already has:
> > > struct mnl_socket *nl;
> > > nl = mnl_socket_open(NETLINK_NETFILTER);
> > (after mnl_socket_bind)
>
>
> I don't have mnl_socket_open().  I have struct nfq_handle *h = nfq_open(); and
> then fd = nfq_fd(h);
>
> After replacing the call to nfnl_rcvbufsiz() with setsockopt(), I can actually
> link without -lnfnetlink.  However, I'm not sure it is sane to fiddle with
> configure macros trying to avoid it.  On my system I have:
>
>     ale@pcale:~$ pkg-config --libs libnetfilter_queue
>     -lnetfilter_queue -lnfnetlink
>     ale@pcale:~$ pkg-config --modversion libnetfilter_queue
>     1.0.2
>
> Should a future version drop that dependency, my code is ready :-)
>
>
> > > setsockopt(mnl_socket_get_fd(nl), SOL_SOCKET, SO_RCVBUFFORCE, // You should
> > >   &buffersize, sizeof(socklen_t));     // check the return code (not shown)
> > If you like, you can check how big a buffer the kernel gave you
> > > socklen_t socklen = sizeof buffersize;
> > > socklen_t read_size = 0;
> > > getsockopt(mnl_socket_get_fd(nl), SOL_SOCKET, SO_RCVBUF, &read_size, &socklen);
> > From testing it seems you get a buffer of twice buffersize bytes.
>
>
> It's stranger than that.  The default value is 0x34000.  If I set that same
> value or higher, I seem to always get 0x68000.
> However, if I set 0x33fff I get 0x67ffe, the double, as you say.
> This strange behavior apparently was the same when using nfnl_rcvbufsiz().

This does look to me like a bug. Perhaps someone on the devel list would have
something to say about it.

Cheers ... Duncan.
