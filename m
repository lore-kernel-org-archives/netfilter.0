From: bsilva <bsilva@sonic.net>
Subject: Re: route local packages
Date: Fri, 6 Mar 2009 19:11:30 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0903061909141.24291@bolt.sonic.net>
References: <1236359681.3844.26.camel@pauloric.contatogs.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1236359681.3844.26.camel@pauloric.contatogs.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulobruck1 <paulobruck1@gmail.com>
Cc: netfilter@vger.kernel.org


Look at the policy routing stuff.  In order to have different applications
use different routes, you need to setup multiple routing tables and have
rules that select the correct table.

Warning; this is not trivial.

Brad

On Fri, 6 Mar 2009, paulobruck1 wrote:

> Hi Guys
>
> reading
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#NATINTRO
>
> and man iptables  I can't figure out how to route local packages. For
> example:
>
> ----------LAN ( eth0) -----Firewall/proxy  ------eth1 ( wan1)
> 					   ------eth2 ( wan2)
>
> Knowing that my route default is wan1, how can I alter some local
> packages ( only proxy, for example) to be delivery to eth2????
>
> best regards
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
