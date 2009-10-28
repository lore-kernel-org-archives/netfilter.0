From: Jeff Jensen <jjensen@unyalli.com>
Subject: Re: explanation of the syslog LEN and WINDOW entries
Date: Wed, 28 Oct 2009 08:56:09 -0600
Message-ID: <b376a78e0910280756h4ba10f1oea023c6b870fe0cb@mail.gmail.com>
References: <b376a78e0910280653y6312fc63yb2d20414d76a1ce0@mail.gmail.com>
	 <56378e320910280720q79cd3dma8eee31f3512a6c0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e320910280720q79cd3dma8eee31f3512a6c0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Thanks Richard, So there is no parameter (or combination of
parameters) in the syslog entry stating actual packet size?

Hmmmm????

The boss wants to know how much bandwidth is used by the different
app's we allow. I have some unique app's that run on unique port(s)
and rules that log all packets. I set the --log-prefix=3D to something
unique to that app and every day sort it out into individual files. I
was hoping to aggregate all the entries to a total bandwidth out and
it.



On Wed, Oct 28, 2009 at 8:20 AM, Richard Horton
<richard.horton@solstans.co.uk> wrote:
>
>
> 2009/10/28 Jeff Jensen <jjensen@unyalli.com>:
>> Is there an explanation of the LEN and WINDOW fields in an
>> iptables/netfilter syslog entry?
>>
> First example: LEN is the length of the TCP datagram
>
> The Window=C2=A0field applies to TCP packets and is the receive windo=
w size =C2=A0-
> the amount of data the receiver will process before having to send an=
 ack
> message.
>
> Second example I believe LEN 1 is the length of the IP datagram, LEN =
2 is
> the lenght of the UDP payload.
>
> I would be wary of using this to estimate bandwith useage.
>
>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the=
 host
> finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian =
=46orest
> Cats
> http://www.pbase.com/arimus - My online photogallery
>
>
