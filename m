From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: DNAT issue (with added network diagram)
Date: Mon, 3 May 2010 16:01:56 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005031601340.29150@obet.zrqbmnf.qr>
References: <4BDECE5A.4010808@imaginator.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BDECE5A.4010808@imaginator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Tennant <simon@imaginator.com>
Cc: netfilter@vger.kernel.org

On Monday 2010-05-03 15:23, Simon Tennant wrote:
>
> Two different applications that need to be accessible on port 443 on one host
> with 1 ip address.  Apache already runs on the destination machine and uses
> port 443.
>
> Partial solution:
>
> 1. Change DNS to tell the client to connect to another host, and.
> 2. use another host that is not running anything on port 443 to receive and
> forward the connctions using a "-j DNAT --to-destination" rule.
>
> But:
>
> What happens when a client on the destination also needs to connect and looks
> up the service in DNS?  It connects out and is DNAT'ed back to itself.
>
> A quick diagram:
>
> http://docs.google.com/drawings/pub?id=1dxCOw8wbAhyuz7z1-ukJfmKOHcymsqN6YTRCjrTh_MY&w=1440&h=1080
>
> My question is what DNAT or SNAT rules do we need to add to cave or to maar so
> that remote *and local (originating from cave)* clients can make xmpp
> connecitons on 443 and end up on cave:5222?\

Since they have all public addresses, no NAT is needed.
