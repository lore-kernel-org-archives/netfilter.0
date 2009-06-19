From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 15:08:17 +0200
Message-ID: <200906191508.18236.ben@differentialschokolade.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <200906191413.43513.ben@differentialschokolade.org> <9948385e0906190557q20f28cf4l118b70a6f5132a0a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0906190557q20f28cf4l118b70a6f5132a0a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="utf-8"
To: David =?utf-8?q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 19 June 2009, 14:57 David Bala=C5=BEic wrote:
> 2009/6/19 Benedikt Gollatz <ben@differentialschokolade.org>:
> > On Friday 19 June 2009, 14:03 David Bala=C5=BEic wrote:
> >> One more thing: Where is the timeout for this set ?
> >
> > /proc/sys/net/netfilter/nf_conntrack_generic_timeout I presume.
>
> I have no netfilter dir under /proc/sys/net
>
> (linux 2.4)

The connection tracking framework has changed somewhere around Linux 2.=
6.20,=20
Linux 2.4 probably never adopted the new one. Before that, connection t=
racking=20
somehow depended on the layer 3 protocol, so I don't know which timeout=
=20
applies there.

> > Why do you want to conntrack proto-41 packets at all?
>
> I don't.
> That is why I started this thread: How do I make proto 41 not being
> screwed by netfilter ?

As I've told you before: By replacing your MASQUERADE rule with the one=
 that=20
you can find in the SixXS FAQ.

Benedikt
