From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: match a few ecn-ip-ect in one rule
Date: Mon, 24 Oct 2011 13:46:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110241344010.21849@frira.zrqbmnf.qr>
References: <CAH3pVZOW=dQ+BrHJOsvQY5DXL-BhnV0uWiTG44JXKdQ_EeXwXA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAH3pVZOW=dQ+BrHJOsvQY5DXL-BhnV0uWiTG44JXKdQ_EeXwXA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Naumov <sknaumov@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-10-24 12:48, Sergey Naumov wrote:

>Hello.
>
>I would like to ask whether
>
>iptables -A CHAIN -p tcp -m ecn --ecn-tcp-cwr --ecn-tcp-ece -m ecn
>--ecn-ip-ect 1 -m ecn --ecn-ip-ect 2 -j ACTION
>
>will work as
>1) filter by tcp options
>2) filter by tcp options and ecn-ip-ect 2
>3) filter by only ecn-ip-ect 2
>4) filter by tcp options AND (ecn-ip-ect 1 OR ecn-ip-ect 2)
>5) some other behavior
>
>the 4-th variant is desirable (the goal is to be able to specify all
>desirable options in one rule, or I have to split filtering by ect1
>and ect2 on two different rules?).
>
>Unfortunately, it is unclear from the manual.

Since rules are generally combined in ORed, it only makes sense for 
matches to be ANDed (and submatch parts to be ORed at times).
