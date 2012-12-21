From: Ulrich Weber <ulrich.weber@sophos.com>
Subject: Re: How to use IPv6 SNPT?
Date: Fri, 21 Dec 2012 16:00:06 +0100
Message-ID: <50D47976.6090409@sophos.com>
References: <50D1ADEE.8010805@logix.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50D1ADEE.8010805@logix.net.nz>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sophos.com; h=message-id:date:from:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding; s=global; bh=AztFd18iurv+NL4kOwkYsqvkdw2Ndm+CFLPzQ86Sz8s=; b=iOqSAnmKmnNVuk2tbAB2jQtXgmDnLLaRBnQPXNT0EnrgsDqJCZaMUO4kf2Vt8NWIx/7G48tgpQLcubJ2XoBWe0GNjDwEWM/da/VbMGrM9gTRjhFrNfHF5w3AvmLRXZ+YlszRxHgdZ+L0nNddjnwt+O0IKpH8VZ6HPjCqjwzpl7U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hi Michael,

NAT table is only called once for each connection.
Since you use stateless NAT better use the mangle table.

Cheers
Ulrich

On 12/19/12 13:07, Michael Ludvig wrote:
> Hi guys
>
> I did some experimenting with the new NAT support for IPv6 and was qu=
ite
> impressed how smoothly MASQUERADE and SNAT work.
>
> However I didn't have any success with IPv6 SNPT. As I understand it
> SNPT is meant for 1:1 address translation and should simply replace s=
rc
> prefix with dst prefix.
>
> For testing I use fd00::/64 address range in my VirtualBox network wi=
th
> SLAAC addresses.
>
> ip6tables -t nat -I POSTROUTING -s fd00::/64 \
>      -j SNPT --src-pfx fd00::/64 --dst-pfx 2001:e20:2000:xx::/64
>
> The strange thing is that only the first ping6 packet to google is
> translated, the subsequent ones on the external interface are still i=
n
> fd00::/64:
>
> Seq 1 - translated:
> 00:49:25.699206 IP6 2001:e20:2000:xx:b5d0:27ff:feec:3987 > \
>      2404:6800:4006:804::1017: ICMP6, echo request, seq 1, length 64
>
> Seq 2&3 - untranslated source:
> 00:49:26.699498 IP6 fd00::a00:27ff:feec:3987 > \
>      2404:6800:4006:804::1017: ICMP6, echo request, seq 2, length 64
> 00:49:27.699436 IP6 fd00::a00:27ff:feec:3987 > \
>      2404:6800:4006:804::1017: ICMP6, echo request, seq 3, length 64
>
> Once I remove the SNPT rule and replace it with a simple -j MASQUERAD=
E
> it begins to work. Forwarding is obviously enabled and no other firew=
all
> rules are in place (neither in 'nat' table nor elsewhere). My kernel =
is
> 3.7.0-rc8, iptables from the current git checkout.
>
> What am I doing wrong?
>
> Thanks!
>
> Michael
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Ulrich Weber | ulrich.weber@sophos.com | Senior Software Engineer
Astaro - a Sophos company | Amalienbadstr 41 | 76227 Karlsruhe | German=
y
Phone +49-721-25516-0 | Fax =96200 | www.astaro.com

