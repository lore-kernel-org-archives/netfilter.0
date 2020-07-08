From: Thilo-Alexander Ginkel <thilo@ginkel.com>
Subject: Re: nftables: masquerading not applied consistently
Date: Wed, 8 Jul 2020 13:40:00 +0200
Message-ID: <CANvSZQ_JOg9JgeCqTN9ZD28M-5iJ=CE7=sp8e=sy92KD4yga9g@mail.gmail.com>
References: <CANvSZQ-TM-2qs4s8QiiFQmqQG_bebn1ptwHEa3atJm7yxii_BQ@mail.gmail.com>
 <20200707231034.GC32005@breakpoint.cc> <CANvSZQ_W2zhudKEYVo7mcMcMFF9JQO-vSz599TECmkU2gZXB3g@mail.gmail.com>
 <cc19ddc3-f489-6bee-a6d6-60fc76ee5127@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ginkel.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNP6dpFVO4oatXLOLntXTNFbaXS6lIUgg2Dfs9ZlkU8=;
        b=HNTpxu3U6MtK3ywUMClDxCDmNjCIbWgzQDf6HGA1Xx4uregbisrQfw4YegFMXr/pAE
         lxf7xz15M/gmDf8craVGN6K/RV5CL9da73H1gex4HuKNUcmgoiDVZKTmNViTopvVhN54
         GA1DR0l42YfeDANZWWj1l5ve0hp6W9XjQCuQw=
In-Reply-To: <cc19ddc3-f489-6bee-a6d6-60fc76ee5127@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

On Wed, Jul 8, 2020 at 12:32 PM Reindl Harald <h.reindl@thelounge.net> wrote:
> what about limit your NAT rules to the interface where you need it? on
> our nat router we have 3 interfaces
>
> * lan
> * wan
> * vpn
>
> NAT is strictly limited to "wan" and so any wireguard related traffic
> would never hit as well as lan-lan forwarding

That's what I am IMHO already doing. Only traffic routed to tun252 is
NATed. While WAN traffic also needs NATing, this is a different story
in my setup as it isn't handled vpn-gw.

Regards,
Thilo
