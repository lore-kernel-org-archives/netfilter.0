From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Trying to achieve fail over to multiple DNATed destinations
Date: Tue, 9 Aug 2011 00:46:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108090039470.15809@frira.zrqbmnf.qr>
References: <CADCwhZk8VdOCKQ5QA_aEG_Z9naqfJvbjdd=MAR4Pk5R_L4-xHg@mail.gmail.com> <CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Ruth <mrkrth90@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2011-08-09 00:36, Mark Ruth wrote:
>[DNAT]
>
>The problem is that the target webserver (i.e. www.example.com ) is
>loadbalanced between like 10 servers having 10 public IPs (which are
>NOT in series), [...]
>my users can not connect to www.example.com any
>more untill i debug this and change the destination ip address in my
>iptables rules.
>[...]
>I read that multiple --to-destinations were supported in previous
>versions of iptables but not anymore. Hence to summarize, I want to
>achieve some sort of failover with loadbalancing in above mention
>scenario. Failover is more important.

NAT is not a substitute for a proper layer-7 proxy and/or loadbalancer.


>Now i want to handle this situation with some sort of failover rule
>that can forward users to next ip in list if 1st DOES NOT RESPOND for
>some reason.

Even without NAT, a user can't do anything if his browser resolved
a hostname to an address out of a round-robing pool and that
one server happens to be down.
