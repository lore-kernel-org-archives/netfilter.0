From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 27 Aug 2023 23:12:20 +0200
Message-ID: <ZOu8NFcZH/NhrOT6@calendula>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula>
 <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula>
 <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
 <ZOsKgctjEQWSARet@slk15.local.net>
 <279a392a-31e0-cfcb-3d28-d0bca7c239ea@tana.it>
 <ZOucwX7c4k7+uaoF@slk15.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ZOucwX7c4k7+uaoF@slk15.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Aug 28, 2023 at 04:58:09AM +1000, Duncan Roe wrote:
> On Sun, Aug 27, 2023 at 07:20:45PM +0200, Alessandro Vesely wrote:
> > On Sun 27/Aug/2023 10:34:09 +0200 Duncan Roe wrote:
> > > > It seems a buffer can contain several packets.  Is that related with the
> > > > queue maxlen?
> > > >
> > > man 7 netlink will tell you that netlink messages may be batched.
> >
> >
> > Thanks for the pointer, I hadn't noticed it.
> >
> >
> > > This is straightforward to observe in a libnetfilter_log program under gdb. >
> > > However libnetfilter_queue programs never get batched netlink messages. So the
> > > callback isn't strictly necessary but it would mean extra code to special-case
> > > libnetfilter_queue (among all the other netfilter libraries) so it's been left
> > > there.
> > >
> > > If you rely on this behaviour it might be prudent to check that bytes read ==
> > > *(struct nlmsghdr *)buf.nlmsg_len.
> > >
> > > > > You can obtain the packet payload length via:
> > > > >
> > > > >           len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);
> > > >
> > > > And this should be the length specified with NFQNL_COPY_PACKET (or less), correct?
> > > >
> > > You can check for packet truncation by checking `len` above against what you
> > > actually received.
> >
> >
> > I'll try.  However, I'd never know if my test conditions equal what can
> > happen at runtime.  As I only look at addresses, it's fine to truncate
> > packets at that length.
> >
> > I just want to minimize memory footprint, but without hampering performance.
>
> You definitely want to use the new pktb_setup_raw() function then. git clone or
> fork the repo at https://git.netfilter.org/libnetfilter_queue/

If Andrea would like to use the pkbuff infrastructure, then yes.
Please note that such pktbuff infrastructure is entirely optional.
