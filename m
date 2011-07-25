From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reject non-ipsec traffic
Date: Mon, 25 Jul 2011 02:47:49 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107250236090.14966@frira.zrqbmnf.qr>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com> <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr> <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com> <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
 <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com> <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr> <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Whelan <rcwhelan@gmail.com>
Cc: netfilter@vger.kernel.org, GregScott@Infrasupport.com, petr.pisar@atlas.cz, steven.kath@vyatta.com

On Thursday 2011-07-21 02:09, Ryan Whelan wrote:
>>>
>>>So the outbound traffic is being processed by netfilter before getting
>>>wrapped by IPSec?
>>
>> Both before and after.
>
>Is there a way to accomplish this? Maybe a way to only accept a
>non-esp packets if it destined for the ipsec stack; is that possible?
>The only other recourse I can think of is dropping on the receiving
>side any non-esp packets.  Thats better than nothing, but I'd like to
>not send anything unencrypted if possible.

And don't strip the Cc list.


You can use -m policy in OUTPUT to check for packets destined to be 
xfrmed (output path) or having come out of xfrm (input path), i.e.

-A OUTPUT -m policy --dir out --pol ipsec -j ACCEPT
-A OUTPUT [ike port 500/4500] -j ACCEPT
-A OUTPUT -p esp -j ACCEPT
