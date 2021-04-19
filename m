From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables port forward on DHCP interface to static IP
Date: Mon, 19 Apr 2021 23:51:45 +0200
Message-ID: <20210419215145.GA4841@breakpoint.cc>
References: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
 <973b2d85-567a-e9aa-1b64-749a1fb116a5@fhmtech.com>
 <CABvnMchqLVxNWqqd36-0s+ug-aPi3kQe7UT6NnVedAHL=2MOyA@mail.gmail.com>
 <0111b128-5639-7694-3e9a-67452408f71e@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0111b128-5639-7694-3e9a-67452408f71e@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Pekka =?iso-8859-15?Q?J=E4rvinen?= <pekka.jarvinen@gmail.com>, netfilter@vger.kernel.org

Frank Myhr <fmyhr@fhmtech.com> wrote:
> Nitpick: just in my personal opinion, better not to use table name that is a
> nftables keyword ("filter"). I know the wiki does it lots of places. And
> it's not technically wrong. But:

"filter" is not a reserved keyword.

> >         # TCP SYN (CT NEW)
> >         tcp flags & (fin|syn|rst|ack) != syn ct state {new} drop
> 
> You're filtering in a nat chain, generally not a good idea. My understanding
> is that, since nat is based on connection tracking, this chain will see only
> the FIRST packet of each connection.

Correct.
