From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [firewall context] packet presentation for dual WAN interfaces on
 the same link - eth <> pppoe?
Date: Sat, 8 Feb 2020 20:23:40 +0000
Message-ID: <ddad2de0-d272-2476-0a93-fcf3f185f161@gmx.net>
References: <e825da29-8a00-972d-40a7-f2588f4229d9@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581193421;
        bh=RNCSDvBjoPfbdi8NxGtBE2tt3FuQA6RrDwIQLTGObDs=;
        h=X-UI-Sender-Class:Reply-To:Subject:From:To:References:Date:
         In-Reply-To;
        b=QRg9UIMz1HaIinC2AbVtZ2EtA7qR2SDa8usxKJr24TpngAl5rHfSa74IJgv/HzQmS
         eadaEnX+2Dt8jH4HT7NoTBYSvk+xhQLZtQcRy6JgomKe4XUJek51uXIPKayK5EfFiT
         MktUYQpHS5fmlHwq8QkGCyDmc8ty8M5/L/M2cNkk=
In-Reply-To: <e825da29-8a00-972d-40a7-f2588f4229d9@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 08/02/2020 16:03, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> With a subscriber line where the ISP has implemented PPPoE there are=20
> two WAN interfaces present in the CPE's network stack:
>
> * ethX
> * PPPoE-X
>
> It seems that each interface is treated separately (netdev), as=20
> opposed to collaboratively, and require in firewall context separate=20
> rules (duplicated) for each interface - is that a correct assumption?
> Asking because noticed that with a global drop rule and certain packet =

> types specifically accepted on ethX the same packets are then being=20
> dropped on PPPoE-X.
>
> In which interface order are the packets presented for inspection to=20
> netfilter - fist on ethX and then again on PPPoE-x or vice versa?
> And whatever the order - is it the same on egress as it is on ingress=20
> or is the order inverted with opposite flow direction?
>

With only PPPoE-X in the FIB that sorts it then. ethX still a good place =

to drop undesired traffic earlier with the netdev family.

