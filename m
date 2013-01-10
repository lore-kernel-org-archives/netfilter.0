From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: Basic bridge routing via ebtables and iproute2
Date: Thu, 10 Jan 2013 14:52:03 -0800
Message-ID: <CAJygYd1CC_FFmXNYRfZmX6UKBWM7PJJ5e1ym897CuJBeoebHsA@mail.gmail.com>
References: <CAEDV4yqDKuEvafDsh=FpRGD4-AyXzcyU8-Z0aWdQ=_LV9A6C_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=uxm+EQCMy8Sw1Bbem1vzSc1Ut5bqxdJrvQMvLiDBLmQ=;
        b=G3xZi0R6tY8yR1innOZt+yVear4SJqPB5m0Y/JhIk+m8oV6I334VK2z2HMrLli1fv2
         k7iubqlhD/9K0WyHQ18BTdU+kJTElqbcg4D3jzUWAOU9f2g1qF46c4Y1Bj8QvtI9oxTV
         9z+aMM8n00WIPA9NJZgQLxdJLu2+lPqR5oLXX1XLAf0wh8dKmCT96FJKaWQiLF5TDt0K
         lQXWWm/40ptIkGuv+fOcXudjzLQNQTtmFyX80MgC/1N7ZJ93JLo5Dqz8cXfaz1DqMK65
         oTLriwtkLc748jcvOut5ToCRNDZT0ZM4TthT5h3AuhFf+2CjYFdUor7H9pau2H1sh9IF
         s/ug==
In-Reply-To: <CAEDV4yqDKuEvafDsh=FpRGD4-AyXzcyU8-Z0aWdQ=_LV9A6C_g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter McAlpine <peter@aoeu.ca>
Cc: netfilter <netfilter@vger.kernel.org>

maybe you can add some log in your iptables INPUT/OUTPUT/FORWARD chain
to see where the packet goes.

But I'm confused about what you are trying to do here, is it for doing
transparent filtering?

On Thu, Jan 10, 2013 at 11:28 AM, Peter McAlpine <peter@aoeu.ca> wrote:
> Hello,
>
> I am attempting to route bridged ipv4 traffic via ebtables & iproute2,
> but am experiencing problems.
>
> [client 10.8.7.101] ---- eth2 (no addr)[brouter (br0: 10.8.7.10)] eth3
> (no addr)---- [gateway 10.8.7.99]
>
> I have flushed all iptables and ebtables rules. All policies are "ACCEPT".
>
> At this point, pinging 'gateway' from 'client' is successful.
>
> Then I add an ebtables rule on 'brouter' to route traffic destined to
> 'gateway' via the routing table:
> ebtables -t broute -A BROUTING -p ipv4 --ip-dst 10.8.7.99 --log-ip -j
> redirect --redirect-target DROP
> For good measure I also enable ip_forward:
> echo '1' > /proc/sys/net/ipv4/ip_forward
>
> What I expect to happen:
> 1) The packet comes in on eth2 on 'brouter'
> 2) The ebtables rule matches the traffic and sends it to the routing
> table (via the DROP target)
> 3) The packet (destined for 10.8.7.99) matches the default route and
> is sent to 'gateway'
> 4) The packet is sent out eth3 to 'gateway'
>
> What is actually happening:
> 1) The packet comes in on eth2 on 'brouter' - CONFIRMED via 'tcpdump -i eth2'
> 2) The ebtables rule matches the traffic - CONFIRMED via syslog
> message due to '--log-ip' option in ebtables rule
> 3) ... The packet vanishes.
>
> Can anyone help me figure out why this is happening?
>
> -Peter
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
