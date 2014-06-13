From: =?ISO-8859-1?Q?=C1lvaro_Neira_Ayuso?= <alvaroneay@gmail.com>
Subject: Re: Problems to get started with nftables
Date: Fri, 13 Jun 2014 13:37:50 +0200
Message-ID: <539AE28E.2040204@gmail.com>
References: <op.xiag4xyrdwu75w@alpenjodel.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=e9P8vwYsV1vNYUIuIJrEU2poJI8L4H4u7Kt8o9ARlDQ=;
        b=jBBq/WEEA3tNZ/GnzJjLaNbQzTuZHdDCtp28M+Cr2firhTMOTdqcfaHnZpbX3nVIfX
         9CfUPw6G0qL1SPXfAbx2acSNMZkJ1YpnUQ9GQQv0rU6EvehZ1NW3gB67x+KhEa0DPB7M
         1VfMK0Z+mMquugTMFghmU3kw2BWf8K4RPfgsY8NVlmyK7JW3gcKeG6el/N1RULGzQhdL
         LMOkgOz1RM+kruyE7Kme0C72PJHFxleqOA5u5rd5iNiflTgrFctEU6dXV7X7oMWWzYXq
         VcenpIJjVOPYTb4t7L9PhMH7m0fC+kthKRrYTmyIXvJSyv5XF0eg2avF4W9AnvmbDn9I
         p35A==
In-Reply-To: <op.xiag4xyrdwu75w@alpenjodel.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michael <pistenflitzer@alpenjodel.de>, netfilter user mailinglist <netfilter@vger.kernel.org>

Hello Michael

El 11/06/14 20:25, Michael escribi=F3:
> Dear all,
>
> I have some problems, that might well be due to my lack of understand=
ing
> nftables: My rules look like this:
>
> table filter {
>          chain input {
>                   type filter hook input priority 0;
>                   icmp type { echo-request } limit rate 5/second coun=
ter accept
			      ^^^^^^^^^^^^^^^^
It's a single element, you don't need to use a set. You can use the rul=
e=20
like:

nft add rule filter input icmp type echo-request limit rate 5/second=20
counter accept

>          }
> }
>
> table ip6 filter {
>          chain input {
>                   type filter hook input priority 0;
>                   icmpv6 type { nd-neighbor-advert, nd-neighbor-solic=
it, nd-router-advert } ip6 hoplimit 255 counter log prefix "log1: " acc=
ept
>                   icmpv6 type { echo-request } limit rate 5/second co=
unter accept
>          }
> }
>
> table inet filter {
>          chain input {
>                   type filter hook input priority 1;
>                   ct state { established, related } accept
			     ^^^^^^^^^^^^^^^^^^^^^^^^
Also, you have used here a set but you can use the rule without the set=
,=20
like that:

nft add rule inet filter input ct state established, related counter ac=
cept

>                   ct state invalid counter log prefix "log2: " drop
>                   iif lo accept
> #                 udp sport bootps dport bootpc accept
>                   counter log prefix "log3: " drop
>          }
>
>          chain output {
>                   type filter hook output priority 1;
>                   ct state { new, established, related } accept
>                   ct state invalid counter log prefix "log4: " drop
>                   oif lo accept
>          }
> }
>
>
> What I observe when I load these rules is that the accept in the log1=
 line is
> not enough to accept the packets. They are ultimately dropped in the =
log3
> rule. How do I get the packets through both rule chains?

Because you have a table inet and a table ip6. The table ip6 filter
sees the ip6 traffic and the table inet filter sees the ip4 and ip6=20
traffic. You have defined the priority of the first chain at 0 so=20
nftables checks the rules there and after nftables checks the rules=20
inside of the filter chain in inet.

I suggest you to use one singles filter table like inet.

>
> The second problem is in the
> #                 udp sport bootps dport bootpc accept
> line. I've seen examples with this syntax, but it's not accepted for =
me. What
> is the correct syntax to filter on both dport and sport? I've tried u=
sing and
> or &, but that didn't work either.

The rules is like that:

nft add rule filter input udp sport bootps udp dport bootpc accept

>
> And finally: Is there a way to match the destination mac address of a=
n
> incoming packet?

You must to add a rule with ether like this:

nft add rule filter input ether daddr 20:16:d8:a2:59:33 counter

I hope that I have explained correctly and I have helped you

Regards

=C1lvaro
