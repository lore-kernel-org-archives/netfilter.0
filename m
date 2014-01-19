From: Phil Oester <kernel@linuxace.com>
Subject: Re: rate limits
Date: Sat, 18 Jan 2014 20:01:11 -0800
Message-ID: <20140119040111.GA22074@home>
References: <CAMD-=VLUemcvn4GG6cP9SEyMP4O605s=ZK2-OGDUN=hYd2g9vQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMD-=VLUemcvn4GG6cP9SEyMP4O605s=ZK2-OGDUN=hYd2g9vQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Edwards <nick.z.edwards@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

On Sun, Jan 19, 2014 at 12:43:56PM +1000, Nick Edwards wrote:
> Hi,
> We have some rate limits on port 80 only, they work as intended
> (almost) and we are happy with the outcome (almost)
>
> /usr/sbin/iptables -A INPUT -i lo -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -i lo -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT
>
> /usr/sbin/iptables -A INPUT -s 199.x.x.x/22 -j ACCEPT
> /usr/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
>
> ..some other rules for other ports...
>
> /usr/sbin/iptables -I INPUT -p tcp --dport 80 -m state --state NEW -m
> recent --set
> /usr/sbin/iptables -I INPUT -p tcp --dport 80 -m state --state NEW -m
> recent --update --seconds 5 --hitcount 2 -j DROP
> /usr/sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT
>
> /usr/sbin/iptables -A INPUT -p tcp --dport 1:1023 -j DROP
>
> We obviously dont want our 199.x.x.x/22  limited but it is, I thought
> being before this rule, it would be immune, also, if we use localhost,
> it too is limited, I guess its because we use -I which inserts at top
> of rules, but if we used -A in the two recent rule lines we found it
> didnt always work at all?
>
> any suggestions?

Yes, don't use -I to insert the limit rules at the very top of the INPUT
chain.  But if you insist upon doing so, exempt your LAN from the rules
by adding "-s ! 199.x.x.x/22" to the two recent rules.

Phil
