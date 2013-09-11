From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: router and masquerade
Date: Wed, 11 Sep 2013 17:13:46 +0200
Message-ID: <523088AA.3050509@saasplaza.com>
References: <CAKnRR0ZrEyKL1oQTLiP8AoWhoC7kyTajbzboHdPn6-9RLxoBtA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKnRR0ZrEyKL1oQTLiP8AoWhoC7kyTajbzboHdPn6-9RLxoBtA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: budi wibowo <bwibowo@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

With "outside" you mean an ip on internet?
What IP address does your client have that you don't want to MASQUERADE.

Sounds like the outside world doesn't have a route to get back to your 
client.

Regards,
Tom

On 09/09/2013 01:41 AM, budi wibowo wrote:
> Hi
> i have question and i hope the question is on the right list .
>
> i setup PC router running on ubuntu 10.12, since it is router all IP
> address are public IP.
> Topology will be like this
>
>
>
> Router_to_Intl             Router_to_local_IX
>         |                                   |
>         |                                   |
>         |                                   |
>         |                                   |
>          \                                 /
>            \                              /
>              \                           /
>                \                        /
>                 \                     /
>             Distribution Router
>                           |
>                           |
>                      Client
>
> on Router_to_Intl i have define rule to ACCEPT all INPUT OUTPUT and FORWARD
> chain, also have enable ip_forward in sysctl.
> the result is client cant ping outside, but when i define MASQUERADE, ping
> and connection to internet are working normally.
> i dont want masquerade happen in this case
>
>
> anything missing on my configuration?
>
> Regards
>
> Budi Wibowo
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

