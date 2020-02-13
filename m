From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] economics of reverse path filtering - FIB expression
 vs. kernel parameter
Date: Thu, 13 Feb 2020 13:14:53 +0000
Message-ID: <af53983b-babb-f61d-1889-9b6a95b2d17d@gmx.net>
References: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net>
 <075aab6d-0c81-f38a-eed1-41be303066d9@gmx.net>
 <0b6710c6-d2d2-59bd-8054-d4b6203781a1@gmx.net>
 <alpine.DEB.2.20.2002131342380.9582@blackhole.kfki.hu>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581599695;
        bh=8FNyutFrjzNFxFfD+YiCrjAo9WTuvtDhbtZlJ3nix7U=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=W5OjztCLMuQiOPw08sNhb19op+DzB8Yhd1v3dFmXeCnokbH20hK3tUMpBsNNKi2Sp
         TPnH9x10o1HQMi+QYAYu7sAWFm5LBC/k7RPxD9AQtRPaTnfiJfZ5g4GHG3yUFz+e43
         9pc8FtwyPuXlfjtYvut1z+fjLk4webtiDzpyyEKk=
In-Reply-To: <alpine.DEB.2.20.2002131342380.9582@blackhole.kfki.hu>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 13/02/2020 12:51, Jozsef Kadlecsik wrote:
> On Thu, 13 Feb 2020, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>
>>> Been also wondering about potential conflicts between kernel
>>> parameters vs. firewall rules, which takes precedence?
>>>
>>> Another example - here purposely creating a conflict:
>>>
>>> * net.ipv6.conf.<interface>.accept_redirects =3D 0
>>>
>>> vs.
>>>
>>> * ip6 saddr fe80::/10 ip6 hoplimit 255 daddr FF02::1 icmpv6 type 137 =
accept;
>> Looked into various publications, including [1], but came up short in
>> discovering the hierarchy of /proc parameters vs firewall rules/chains=
,
>> i.e.
>>
>> * is the kernel treating both the same or considers one or the other
>> weighing more/higher than the other?
>> * if treated equally does timing in availability of structures cancels=

>> out the other, e.g. first available sets the rule or the last one
>> available cancels out the earlier one?
> Check out the packet flow in netfilter and the networking stack, eg:
> https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-fl=
ow.svg
>
> A networking subsystem proc/whatever setting have got a chance to tell
> what happens with the packet if the netfilter hooks let the packet pass=
 up
> to that point. And vice versa: if a subsytem decides to drop the packet=

> (say routing due to reverse path filtering), then the next netfilter ho=
ok
> won't/can't process it.
>
> Best regards,
> Jozsef

It was the point of asking the question here, also having perused that=20
graphic, to understand where the /proc/sys/net/* variables fit in the=20
packet flow, but now understanding (also as Florian pointed out) that=20
those variables are processed as part of the routing decision. That make =

things clear and helps to design the network protection efficiently.




