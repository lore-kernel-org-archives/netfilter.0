From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 07 Nov 2013 18:52:52 +0200
Message-ID: <527BC564.1000008@ngtech.co.il>
References: <5278501B.4040406@ngtech.co.il> <CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>, netfilter@vger.kernel.org

On 11/07/2013 12:26 PM, Humberto Juc=E1 wrote:
> Hi,
>
> The cache control for load balance can be done with:
By load balance I am talking about Route load balance.

>
> 1. scheduled flush (to remove old entries)
> /proc/sys/net/ipv4/route/gc_interval
OK so every 60 secs remove the old entries?
>
> 2. Lifetime of each learned route
> /proc/sys/net/ipv4/route/gc_timeout
which I should see using "ip route show cache" ?
>
> If you want a aggressive load balance
> echo 1 > /proc/sys/net/ipv4/route/gc_interval
> echo 1 > /proc/sys/net/ipv4/route/gc_timeout
Agrressive load balance? how exactly?
we are talking about route which will have series issues with that.
>
> But the ideal is not to change the gc_timeout.
> You certainly have problems with https.
I will have.. but not just with https but with any tcp protocol that=20
dont like the packets to be sent 1 to 1 host and 2 to 2 host and 3 to=20
host 3.

>
> I tend to set gc_interval with 1 and  a higher value for gc_timeout.

I will try to ask about it more in the netdev later.

Thanks,
Eliezer
