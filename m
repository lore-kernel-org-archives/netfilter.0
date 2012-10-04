From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Odd use of netmasks - Supported?
Date: Fri, 5 Oct 2012 01:41:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210050135180.3658@nerf07.vanv.qr>
References: <506E088B.8000203@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <506E088B.8000203@yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tlhackque <tlhackque@yahoo.com>
Cc: netfilter@vger.kernel.org


On Friday 2012-10-05 00:07, tlhackque wrote:
>
> The syntax -A FOO -s 001:c000::0/0f:f000::  (note the leading 1s in the
> "netmask") seems to be accepted by iptables, and the rule appears with -L.

Yes, that is officially supported. So all that's lacking is the
mention in iptables.8.


> Of course, it would be nice to have a chain type that didn't have sequential
> evaluation semantics and just dispatched based on netmask and address... but
> that's how things might be, not how they are...
>
> (Why ridiculous chain lengths, you ask?  Country blocking.  But no
> philosophical discussions about why this is a bad idea/easy to subvert,
> please.)

To match on countries, you can preferably use xt_geoip (space
efficient and reasonably time efficient), or construct
something handmade with ipsets (time efficient but space is
secondary).
