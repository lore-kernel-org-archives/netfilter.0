From: "Dan Egli" <dan@shortcircuit.dyndns.org>
Subject: Re: Samba Blocked? (repost)
Date: Wed, 27 Nov 2002 11:17:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003f01c29642$22a08bb0$1e00a8c0@yamatto>
References: <001d01c29598$b3087a00$1e00a8c0@yamatto> <200211261924.56163.netfilter@newkirk.us> <001401c295bc$ee9c34c0$1e00a8c0@yamatto> <200211270000.04548.netfilter@newkirk.us> <3DE47D0D.9060702@iprimus.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Michael <mutk@iprimus.com.au>, netfilter@lists.netfilter.org

I will try this one then. Thanks!
----- Original Message -----
From: "Michael" <mutk@iprimus.com.au>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, November 27, 2002 1:06 AM
Subject: Re: Samba Blocked? (repost)


> Joel Newkirk wrote:
>
> >On Tuesday 26 November 2002 09:30 pm, Dan Egli wrote:
> >
> >
> >>that is correct. And I know for a fact that NetBIOS-ns is in the
services
> >>file because I've seen it, and I did try it both ways. Every time I try
to
> >>connect using //myserver/shared1 I get the following log lines:
> >>
> >>
> >
> >Very strange.  the only packets caught here with --dport 137 are on lo
with lo IP, then
> >--sport 137 with 64.x.x.x on lo, and --sport 137 with local 192.x x.x on
lo.  It looks like the
> >'real' --dport 137 packets get through (they're not listed here) but the
machine tries to
> >query itself on lo to resolve the names.  shot in the dark, try:
> >
> >/sbin/iptables -A INPUT -i lo -j ACCEPT
> >/sbin/iptables -A OUTPUT -o lo -j ACCEPT
> >
> >to let these through.  I've only done minimal work with samba, so I don't
know if this self-request
> >is normal or not...
> >
> >
>
> I think it's due to smbd talking to nmbd via lo when it receives a bcast
> ??  Something like that.
> Something like this is generally needed anyway:
>
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>
>
> Cheers,
> Michael
>
>
>
>


