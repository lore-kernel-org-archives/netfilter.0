From: Kevin Bailey <ke-linux@retriever.dyndns.org>
Subject: Re: Pre-routing re-write
Date: Fri, 16 Oct 2009 20:43:03 -0700
Message-ID: <20091017034303.GB27400@retriever.dyndns.org>
References: <20091014231016.GA4580@retriever.dyndns.org> <4AD8555A.1080301@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4AD8555A.1080301@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Oct 16, 2009 at 01:13:30PM +0200, Michele Petrazzo - Unipex wrote:
>
> Sorry, but this can be possible. The gw for a network class must be
> inside the _same_ class!

The gateway of 192.168.10.2 is quite reachable from 192.168.10.1.

> Where the packet starts? If you use nat + output you are saying to the
> kernel to do a thing when a packet are generated locally.
> Are you the gateway for another network (lan)?
> However, It's not so well explained what you want to achieve.

The packet will be originated locally. I was just asking if it was
possible for a packet that got re-written to be routed beforehand.
