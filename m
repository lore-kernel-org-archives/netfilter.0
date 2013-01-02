From: Ulrich Weber <ulrich.weber@sophos.com>
Subject: Re: How to use IPv6 SNPT?
Date: Wed, 2 Jan 2013 17:18:40 +0100
Message-ID: <50E45DE0.2000402@sophos.com>
References: <50D1ADEE.8010805@logix.net.nz> <50D47976.6090409@sophos.com> <50E01952.7040901@logix.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50E01952.7040901@logix.net.nz>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sophos.com; h=message-id:date:from:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding; s=global; bh=XrVP8frxZT4FtQHZyP5wUFy4i5XFceTNg/AvemXFzvU=; b=K3Ue4GPtK+ER1HABts1YyMACfy8+FggNUwukDCs+CzbgoOMDty+i3HlXo0wGlKn+lgtjXR1q0tnPc1kDKRB467fSJi2R6dOOiw1FQwnRGYnInwUu8XdHHV2kTNd67NzmRO5Ih3LKYEB2vlfQ5DXHjLMS02QdnNt+qMAtIpSDCu0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Michael Ludvig <mludvig@logix.net.nz>
Cc: netfilter@vger.kernel.org

Hi Michael,

testing your setup I stumbled over a checksum calculation issue,
see "[PATCH] netfilter: fix IPv6 NTP checksum calculation".

But since you see the echo reply packet, you most likely not
hitting this issue.

On my system I needed to enable IPv6 neighbor proxy:
sysctl -w net.ipv6.conf.all.proxy_ndp=3D1
ip -6 neigh add proxy 2001:xxxx:xxxx:xxxx:a27d::5 dev eth0


Note: you have to add one "ip -6 neigh add proxy" entry for
each NATed IPv6 address. There is no way to add ranges.
Blame the IPv6 neighbor discovery multicast groups for that...

Also note that NTP will NOT modify the payload as normal NAT does.
ICMPv6 error handling, e.g. Packet Too Big, might fail therefore.

Cheers
  Ulrich

On 12/30/12 11:37, Michael Ludvig wrote:
> On 22/12/12 04:00, Ulrich Weber wrote:
>> NAT table is only called once for each connection.
>> Since you use stateless NAT better use the mangle table.
> Hi Ulrich
>
> thanks for the suggestion. I made the change and now all the pings ar=
e
> translated, however I struggle with the ping replies reaching my VM.
>
> What I now have:
>
> ip6tables -t mangle -I POSTROUTING -s fd00::/64 \! -o vboxnet0 \
>      -j SNPT --src-pfx fd00::/64 --dst-pfx 2001:e20:2000:40f::/64
>
> ip6tables -t mangle -I PREROUTING -i wlan0 -d 2001:e20:2000:40f::/64 =
\
>      -j DNPT --src-pfx 2001:e20:2000:40f::/64 --dst-pfx fd00::/64
>
> And also these sysctl settings:
> net.ipv6.conf.all.forwarding =3D 1
> net.ipv6.conf.all.accept_ra =3D 2
> net.ipv6.conf.default.forwarding =3D 1
> net.ipv6.conf.default.accept_ra =3D 2
>
> Now the ping goes to google and back...
> 23:18:01.915631 IP6 2001:e20:2000:40f:b5d0:27ff:feec:3987 >
> 2404:6800:4006:804::1012: ICMP6, echo request, seq 1, length 64
>
> 23:18:01.954867 IP6 2404:6800:4006:804::1012 >
> 2001:e20:2000:40f:b5d0:27ff:feec:3987: ICMP6, echo reply, seq 1, leng=
th 64
>
> ... but my laptop (the gateway) rejects it:
> 23:18:04.961643 IP6 2001:e20:2000:401:a11:ff:fe04:50cd >
> 2404:6800:4006:804::1012: ICMP6, destination unreachable, unreachable
> address fd00::b00:27ff:feec:3987, length 112
>
> This is from the external wlan0 (wifi) interface. Nothing with regard=
s
> to the reply appears on the internal vboxnet0 interface.
>
> What am I doing wrong?
>
> Thanks!
>
> Michael
>
>
>
>
>> Cheers
>> Ulrich
>>
>> On 12/19/12 13:07, Michael Ludvig wrote:
>>> Hi guys
>>>
>>> I did some experimenting with the new NAT support for IPv6 and was =
quite
>>> impressed how smoothly MASQUERADE and SNAT work.
>>>
>>> However I didn't have any success with IPv6 SNPT. As I understand i=
t
>>> SNPT is meant for 1:1 address translation and should simply replace=
 src
>>> prefix with dst prefix.
>>>
>>> For testing I use fd00::/64 address range in my VirtualBox network =
with
>>> SLAAC addresses.
>>>
>>> ip6tables -t nat -I POSTROUTING -s fd00::/64 \
>>>       -j SNPT --src-pfx fd00::/64 --dst-pfx 2001:e20:2000:xx::/64
>>>
>>> The strange thing is that only the first ping6 packet to google is
>>> translated, the subsequent ones on the external interface are still=
 in
>>> fd00::/64:
>>>
>>> Seq 1 - translated:
>>> 00:49:25.699206 IP6 2001:e20:2000:xx:b5d0:27ff:feec:3987 > \
>>>       2404:6800:4006:804::1017: ICMP6, echo request, seq 1, length =
64
>>>
>>> Seq 2&3 - untranslated source:
>>> 00:49:26.699498 IP6 fd00::a00:27ff:feec:3987 > \
>>>       2404:6800:4006:804::1017: ICMP6, echo request, seq 2, length =
64
>>> 00:49:27.699436 IP6 fd00::a00:27ff:feec:3987 > \
>>>       2404:6800:4006:804::1017: ICMP6, echo request, seq 3, length =
64
>>>
>>> Once I remove the SNPT rule and replace it with a simple -j MASQUER=
ADE
>>> it begins to work. Forwarding is obviously enabled and no other fir=
ewall
>>> rules are in place (neither in 'nat' table nor elsewhere). My kerne=
l is
>>> 3.7.0-rc8, iptables from the current git checkout.
>>>
>>> What am I doing wrong?
>>>
>>> Thanks!
>>>
>>> Michael
>>>
>>>
>>>
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>


--=20
Ulrich Weber | ulrich.weber@sophos.com | Senior Software Engineer
Astaro - a Sophos company | Amalienbadstr 41 | 76227 Karlsruhe | German=
y
Phone +49-721-25516-0 | Fax =96200 | www.astaro.com

