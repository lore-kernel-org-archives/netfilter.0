From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Reject non-ipsec traffic
Date: Thu, 21 Jul 2011 16:55:44 +0000 (UTC)
Message-ID: <slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
 <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
 <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
 <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
 <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>
 <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>
 <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 2011-07-21, Ryan Whelan <rcwhelan@gmail.com> wrote:
>
> Is there a way to accomplish this? Maybe a way to only accept a
> non-esp packets if it destined for the ipsec stack; is that possible?

I know you ask about netfilter, but consider IPsec security policies
(defined by setkey tool) can be used to force xfrm based on network or
transport source or destinatino addresses.

-- Petr

