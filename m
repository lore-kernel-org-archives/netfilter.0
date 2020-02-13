From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: manipulating the ttl
Date: Thu, 13 Feb 2020 21:00:18 +1100
Message-ID: <20200213100018.GA6347@dimstar.local.net>
References: <9c18d561-2033-baa9-718f-29275392acd5@street-artists.org>
 <82e00d85-680c-2932-42e2-3b1087bb1013@street-artists.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <82e00d85-680c-2932-42e2-3b1087bb1013@street-artists.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@vger.kernel.org>

On Sat, Jan 25, 2020 at 05:17:05PM -0800, Daniel Lakeland wrote:
> On 1/25/20 5:02 PM, Daniel Lakeland wrote:
> > As far as I can tell in nftables there's no way to manipulate the TTL
> > field in packets, along the lines of iptables -A foo -j TTL --ttl-set 2
> > or the like
> >
> > This becomes a problem for handling certain multicast scenarios. Is this
> > on the horizon?
> >
> >
> >
> hmmm in further inspection I see that you can *set* the ttl, something like:
>
> nft add rule inet mytable mychain ip ttl set 2
>
> but I don't see how I could do something like decrement the ttl by 4 or
> basically do anything where you'd calculate the TTL as a function of its
> current value.
>
> In general calculating simple arithmetic in order to manipulate fields isn't
> necessarily obvious in nftables. Any pointers?
>
>
(apologies for late reply)

You are able to make arbitrary changes via a netfilter_queue (nfq) program: send
packets that you wish to manipulate to a QUEUE. Unlike with xtables, in nft this
is not a final verdict: other chains in the same table will see the packet after
manipulation as long as they run at a lower priority than the chain that did the
queuing. (I.e. as long as the nfq program accepts the packet).

Cheers ... Duncan.
