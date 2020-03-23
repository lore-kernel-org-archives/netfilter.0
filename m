From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@swifty.hu>
Subject: Re: tc question about ingress bandwidth splitting
Date: Mon, 23 Mar 2020 07:47:11 +0100
Message-ID: <8ce39670-f41d-4053-b424-bfbfe23c0329@swifty.hu>
References: <1D33C8C0-0638-4566-A85F-80B19CD532BA@redfish-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 apollo13.glsys.eu B084A680B0010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swifty.hu;
        s=dkimkey; t=1584946031; x=1585118831;
        bh=lndqKoakPN3l4wUy4H5qbrm6iIvLQIcepfJjOn4uaug=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        z=Subject:=20Re:=20tc=20question=20about=20ingress=20bandwidth=20sp
         litting|To:=20Philip=20Prindeville=20<philipp_subx@redfish-solutio
         ns.com>,=0D=0A=20netfilter@vger.kernel.org|References:=20<1D33C8C0
         -0638-4566-A85F-80B19CD532BA@redfish-solutions.com>|From:=20=3D?UT
         F-8?B?R8Ohc3DDoXIgTGFqb3M=3D?=3D=20<swifty@swifty.hu>|Date:=20Mon,
         =2023=20Mar=202020=2007:47:11=20+0100|In-Reply-To:=20<1D33C8C0-063
         8-4566-A85F-80B19CD532BA@redfish-solutions.com>;
        b=emsambzu3zbkCiH05i8rGMk73/D/4f21CfsknIahkG4HwVpXFQD71QeE/2H5a95xa
         YKwJ7+bf1ZXO0SR6wZBLIsmdFuhl26JopfLgqqvUhLTvW+1PNVsmN+IGPnX3oOpKkX
In-Reply-To: <1D33C8C0-0638-4566-A85F-80B19CD532BA@redfish-solutions.com>
Content-Language: hu
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Philip Prindeville <philipp_subx@redfish-solutions.com>, netfilter@vger.kernel.org

Hi Philip,


Just a tip: AFAIK, you can only limit your sending bandwith... 
Everything what you already received is already on your device... :)


Cheers,

Lajos


2020. 03. 22. 19:20 keltezéssel, Philip Prindeville írta:
> Hi all,
>
> I asked around on IRC but no one seems to know the answer, so I thought I’d go to the source… Seemed like something Stephen or Eric might be able to answer.
>
> I have a SoHo router with two physical subnets, which we’ll call “production” (eth0) and “guest” (eth1), and the egress interface “wan” (eth5).
>
> The uplink is G.PON 50/10 mbps.  I’d like to cap the usage on “guest” to 10/2 mbps.  Any unused bandwidth from “guest” goes to “production”.
>
> I thought about marking the traffic coming in off “wan" (the public interface).  Then using HTB to have a 50 mbps cap at the root, and allocating 10mb/s to the child “guest”.  The other sibling would be “production”, and he gets the remaining traffic.
>
> Upstream would be the reverse, marking ingress traffic from “guest” with a separate tag.  Allocating upstream root on “wan” with 10 mbps, and the child “guest” getting 2 mbps.  The remainder goes to the sibling “production”.
>
> Should be straightforward enough, right? (Well, forwarding is more straightforward than traffic terminating on the router itself, I guess… bonus points for getting that right, too.)
>
> I’m hoping that the limiting will work adequately so that the end-to-end path has adequate congestion avoidance happening, and that upstream doesn’t overrun the receiver and cause a lot of packets to be dropped on the last hop (work case of wasted bandwidth).  Not sure if I need special accommodations for bursting or if that would just delay the “settling” of congestion avoidance into steady-state.
>
> Also not sure if ECN is worth marking at this point.  Congestion control is supposed to work better than congestion avoidance, right?
>
> Anyone know what the steps would look like to accomplish the above?
>
> A bunch of people responded, “yeah, I’ve been wanting to do that too…” when I brought up my question, so if I get a good solution I’ll submit a FAQ entry to LARC.
>
> Thanks,
>
> -Philip
>
