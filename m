From: John Smithee <for-gmane@mutluit.com>
Subject: Re: Basic routing
Date: Sat, 04 Oct 2014 17:07:44 +0200
Message-ID: <m0p2g0$clr$1@ger.gmane.org>
References: <m0nhf2$oqq$1@ger.gmane.org> <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org> <542F9BEE.9070802@kickstone.com> <m0okc1$g5m$1@ger.gmane.org> <542FFCA2.3010208@bringe.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <542FFCA2.3010208@bringe.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Thomas B=E4tzler wrote, On 10/04/2014 03:56 PM:
> Hi,
>
> Am 04.10.2014 um 13:06 schrieb John Smithee:
>> Ok, I admit using "ping -I" was a bad example. The whole point I tri=
ed
>> to make is, that the second net (69.0) cannot reach any other IP
>> outside its own net.
>> The goal is to let 69.0 reach the world via this gateway machine
>> 68.22/69.22.
>> Is some iptables needed in this case?
>
> You do have IP forwarding enabled?
>
> If not,  enable it using
>    echo "1" > /proc/sys/net/ipv4/ip_forward
> and try again.
>
>
> HTH,
> Thomas


Yes, ip frowarding is enabled.

After doing much research on the net and experimenting
I think (still testing) I finally found a solution,
but it's unfortunately a little bit complicated.
I'll summarize later.



