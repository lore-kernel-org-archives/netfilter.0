From: Florian Westphal <fw@strlen.de>
Subject: Re: nft icmp type all?
Date: Sun, 26 Jan 2020 19:02:57 +0100
Message-ID: <20200126180257.GC795@breakpoint.cc>
References: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
 <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
 <7f7b3f05-f0cf-1694-b61e-ab627fa4e176@street-artists.org>
 <01c0f25b-862b-cb00-3b5c-f8ac5852f37c@heinlein-support.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <01c0f25b-862b-cb00-3b5c-f8ac5852f37c@heinlein-support.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Sander <r.sander@heinlein-support.de>
Cc: netfilter@vger.kernel.org

Robert Sander <r.sander@heinlein-support.de> wrote:
> Ah thanks. I overread the "protocol" keyword on the wiki page.
> 
> So you have to add protocol before "icmp" if you do not want to specify
> an icmp type (or tcp/udp port).
> 
> Is there any motivation for that?

Different things.

"ip protocol icmp" is short for
"ip protocol = icmp".

"icmp type x" is short for "icmp type = x".

So, "icmp type" is short for "icmp type =", i.e., the compare lacks
right-hand-side.

