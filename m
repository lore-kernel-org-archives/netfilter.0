From: Carl Lei <me@xecycle.info>
Subject: Re: nft tproxy failed to redirect on one system
Date: Tue, 22 Aug 2023 18:16:31 +0800
Message-ID: <327D57E822A265D5+20230822181631.528b64c2@xcws1>
References: <20230811120043.0c3c6302@xcws1>
        <196291AF4921A1FE+20230821154807.270690a5@xcws1>
        <ZOSITfIcAHBrXpUi@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ZOSITfIcAHBrXpUi@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Tue, 22 Aug 2023 12:05:01 +0200
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> On Mon, Aug 21, 2023 at 03:48:07PM +0800, Carl Lei wrote:
> > Btw: sent to wrong address, re-sent to list...
> > 
> > On Fri, 11 Aug 2023 12:00:43 +0800
> > Carl Lei <me@xecycle.info> wrote:
> > 
> > > Sorry for being incomplete, but I added nftrace before these
> > > rules and saw packets went through the same chain of rules, first
> > > hitting tproxy in mangle, then meta mark 42 counter accept in
> > > input-new-isolated. But on one system it works for local programs
> > > AND network-received packets, on another system it works only for
> > > local programs.  On the bad system the packets instead gets
> > > directed to whatever program originally listening on the original
> > > port, or rejected; e.g. I have an nginx listening on 0.0.0.0:80
> > > but no programs on 443, then curl http in a vm connected to vbr0
> > > goes to my nginx, and curl https gets rejected.  I expect them to
> > > go to that program listening on 1081.  
> > 
> > Looked closer at the trace, I found that on the bad system, when the
> > packet goes back to input rules, its trace id changed; on the good
> > system it does not change.  Perhaps this explains it, but I don't
> > know why it was changed?
> 
> Could you provide more detailed information on your setup? You refer
> to a system where this works fine and another where this does not, but
> you do not specify kernel and userspace versions?

Sorry I forgot that in my first email, indeed I replied to myself
several times and already provided versions, but I did not realize I
sent to a wrong address.  My used versions are (copying from my
previous mails):

"they are both running Arch Linux, the good system running kernel
6.4.8-arch1-1, the bad system I tried both 6.4.4 and 6.4.9; nftables
version both 1:1.0.7-2; the proxy program on 1081 is also identical,
running identical config."

> Some simple script with 'ip netns' as a reproducer might also help
> that might help people jump in a provide feedback.

I will try ASAP to make a reproducer.

Thank you.


