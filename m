From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: OUTPUT: nat after filter (2nd nat). Please help :(
Date: Tue, 14 May 2013 11:00:04 +0530
Message-ID: <5191CBDC.6020603@atc.tcs.com>
References: <CAJ1PRSnsV_cN0R6JK+8PYb=9u=Fnp_tbo9ufB1j0vUJPoP0cFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ1PRSnsV_cN0R6JK+8PYb=9u=Fnp_tbo9ufB1j0vUJPoP0cFQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "krzf83@gmail.com" <krzf83@gmail.com>
Cc: netfilter@vger.kernel.org

On 05/14/2013 10:05 AM, krzf83@gmail.com wrote:
> According to graph at wikipedia
> (http://imageshack.us/scaled/thumb/29/iptablesb.png) in OUTPUT nat
> table is processed before AND after filter (2 times). I want to
> utilize this second time:
>
> iptables -t filter -A OUTPUT -d 1.2.3.4 -j DROP
> iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner abc -j DNAT --to
> 127.0.0.1:121
>
> Does not work because nat is executed befure filter.
>
> iptables -t filter -A OUTPUT -d 1.2.3.4 -J DROP
> iptables -t filter -A OUTPUT -m owner --uid-owner abc -j CONNMARK
> --set-mark 0x1234
> iptables -t nat -A OUTPUT -p tcp -m connmark --mark 0x1234 -j DNAT
> --to 127.0.0.1:121
>
> I think that should work. It does not. What am I missing? Please help :(

It seems, the two nat tables you are talking about are from different 
chains (OUTPUT, POSTROUTING). The order of packet flow between these 
tables will be like the following,

     OUTPUT nat --> OUTPUT filter --> POSTROUTING nat

So, if you want to filter the packets before nat you can do the following,

iptables -t filter -A OUTPUT -d 1.2.3.4 -J DROP
iptables -t nat -A POSTROUTING -p tcp -m owner --uid-owner abc -j DNAT --to
127.0.0.1:121

I found the following simplified iptables diagram useful for beginners.
<http://pritambaral.com/wp-content/uploads/2012/05/iptables.png>


Regards,
Vignesh
