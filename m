From: Ryan Whelan <rcwhelan@gmail.com>
Subject: Re: Reject non-ipsec traffic
Date: Thu, 21 Jul 2011 13:05:58 -0400
Message-ID: <CAM3m09Rf7zEQ4TL5PbfT7NHF5gq24o7E-Pbq_wcwbJ25ym6Dww@mail.gmail.com>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
	<alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
	<CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
	<alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
	<CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>
	<alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>
	<CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>
	<slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=dhtGaO/8fDZGEoFqhIzUbhGgcZt0QCoB8/pO7quY8Ro=;
        b=KePSW5eaf8OdZJ9tzp4TR5WRyhUrNNv4nMJOr0CesqWN1V+QS17P5ZqBcOkZM6H4iH
         Y/9sbkp+OgoqEoXKV0HNpNuPfW4O7PYEVMuQ4RnIEy9PDo3kc3FNmA6YHDqzSBZBkwbI
         0twPi0zFIzgMG/AP0VdLgwE5BKztpcyr1wXlY=
In-Reply-To: <slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org

The policy is setup (openswan configures it)

# ip xfrm poli
src 111.222.333.444/32 dst 444.333.222.111/32 proto gre
	dir out priority 2080
	tmpl src 111.222.333.444 dst 444.333.222.111
		proto esp reqid 16385 mode tunnel
src 444.333.222.111/32 dst 111.222.333.444/32 proto gre
	dir fwd priority 2080
	tmpl src 444.333.222.111 dst 111.222.333.444
		proto esp reqid 16385 mode tunnel

The issue is that IPSec is protecting a GRE tunnel and if IPSec fails
for some reason, GRE will be happy to work without it; tunnelling
everything in the clear.  I was just hoping to put some kind of fail
safe in place so if IPSec stopped working or failed to start,
unencrypted traffic wouldn't be transmitted.

I will try putting a filter on the ingress side to reject all GRE
traffic so if it not tunneled in IPSec, it will get dropped.  At least
that way, tunnelled TCP sessions can't get setup.


On Thu, Jul 21, 2011 at 12:55 PM, Petr Pisar <petr.pisar@atlas.cz> wrot=
e:
> On 2011-07-21, Ryan Whelan <rcwhelan@gmail.com> wrote:
>>
>> Is there a way to accomplish this? Maybe a way to only accept a
>> non-esp packets if it destined for the ipsec stack; is that possible=
?
>
> I know you ask about netfilter, but consider IPsec security policies
> (defined by setkey tool) can be used to force xfrm based on network o=
r
> transport source or destinatino addresses.
>
> -- Petr
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
