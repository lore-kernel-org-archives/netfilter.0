From: Thilo-Alexander Ginkel <thilo@ginkel.com>
Subject: Re: nftables: masquerading not applied consistently
Date: Wed, 8 Jul 2020 09:28:47 +0200
Message-ID: <CANvSZQ_W2zhudKEYVo7mcMcMFF9JQO-vSz599TECmkU2gZXB3g@mail.gmail.com>
References: <CANvSZQ-TM-2qs4s8QiiFQmqQG_bebn1ptwHEa3atJm7yxii_BQ@mail.gmail.com>
 <20200707231034.GC32005@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ginkel.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzJN46IzlMcctiZXWgfqiDVfxTsH2Wsi0eLFbhxiNqk=;
        b=t2U5AHSEP1Ck+ap4iNsYXEWKjv4E4WxwMClqfHLkSiazRmu5FqtwB6Dh6UjzVmQ4JE
         cMviJuQRlBnD1VyObk0vTNva7MqsyeDxt0DBM7UKI3eSZqZMTV0v6fCR0B+wTy1EYdnP
         EhnY8DvR07vpELc7i8wNsEBdBuWAYMhcQR0VU=
In-Reply-To: <20200707231034.GC32005@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On Wed, Jul 8, 2020 at 1:10 AM Florian Westphal <fw@strlen.de> wrote:
> I.e., traffic passes vpn-gw twice?

Yes.

> If so, that won't work.
>
> On first pass (wireguard decap), packet x is picked up by
> connection tracking and then has NAT applied to it.
> As no matching NAT rule exists, the connection gets a 'do nothing'
> binding.    When packet comes back, it will match the existing
> 'do nothing' connection and the nat table is never consulted.
>
> If thats the case, you will either need to turn off contrack for packets
> coming from wireguard (use 'notrack' keyword in raw table) or, if you
> need nat for this part as well, place the two rounds the packet takes in
> different connection tracking zones, so that the packet coming back
> from gw01/vlan252 is seen as a new flow, rather than an old packet
> matching a known connection.

As the WireGuard interface in question doesn not need NAT, I'll try
the "notrack" approach.

Thanks for your speedy help!

Regards,
Thilo
