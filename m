From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Adding features to xt_recent and xt_cluster
Date: Thu, 9 Jun 2011 15:23:27 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106091518240.22244@frira.zrqbmnf.qr>
References: <BANLkTi=os6R7oUa6B_snwKPtNAfQA=i4GQ@mail.gmail.com> <alpine.LNX.2.01.1106082205360.13030@frira.zrqbmnf.qr> <BANLkTimRA6Vae7NW_37CApTP2Z0kGn09xg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimRA6Vae7NW_37CApTP2Z0kGn09xg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Heiss <kheiss@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2011-06-09 14:29, Karl Heiss wrote:
>> You could use two separate tables, which has the same effect as
>> storing entries with a unique key of <saddr-or-daddr-bit, addr>
>> in a single table, unless I missed something.
>
>I assume you mean something like this:
>
>iptables -A INPUT -p tcp --dport 23 -m recent --rcheck --seconds 30 -j DROP
>iptables -A INPUT -p tcp --dport 23 -m recent --set -j DROP

I mean:

-A foo -p tcp [plus other conds] -m recent --name by-srcip --rsource --set
-A foo -p tcp [other conds] -m recent --name by-dstip --rdest --set
-A bar -p tcp -m recent --name by-srcip --rsource --rcheck
-A baz -p tcp -m recent --name by-dstip --rdest --rcheck

>PS.  After taking a second look at the code, I realized I stuck my
>foot in my mouth about xt_recent not differentiating between saddr and
>daddr.  It does indeed differentiate by choosing the correct address
>from the incoming packet to match against the entry IPs.

