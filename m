From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] economics of reverse path filtering - FIB expression
 vs. kernel parameter
Date: Thu, 13 Feb 2020 12:35:45 +0000
Message-ID: <0b6710c6-d2d2-59bd-8054-d4b6203781a1@gmx.net>
References: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net>
 <075aab6d-0c81-f38a-eed1-41be303066d9@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581597347;
        bh=chonmhNptSzhyM/hpWyf0d2JTexlXxBKsBmbIbF4cZE=;
        h=X-UI-Sender-Class:Reply-To:Subject:From:To:References:Date:
         In-Reply-To;
        b=jRiYxUDssU2Mm8R3MPtc7raP5c84EYCQXIQ/y034tcpwvcn1Dg7B/B88kfRxFkZeq
         8Y4s8xSQCq6Vtk7lcqzjfaSJpnuIOexa36M5tcVTJ/YQdIgpsKl3MVT/cFZhrzJE6D
         Zy0hsbzzBDtKVNZqYqhsERaLXUoOrG0PikkgGpVA=
In-Reply-To: <075aab6d-0c81-f38a-eed1-41be303066d9@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/02/2020 11:03, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> On 09/02/2020 12:51, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>> Presumably NFT rule
>>
>> * filter prerouting fib saddr . iif oif missing drop
>>
>> and kernel parameter
>>
>> net.ipv4.conf.<interface>.rp_filter =3D 2
>>
>> achieving the same goal.
>>
>> Which one comes into effect first, if there is difference assuming=20
>> that both are being processed through netfilter?
>> Is one or the other more economic with regard to CPU cycles and/or=20
>> responsiveness?
>>
>>
>
> Been also wondering about potential conflicts between kernel=20
> parameters vs. firewall rules, which takes precedence?
>
> Another example - here purposely creating a conflict:
>
> * net.ipv6.conf.<interface>.accept_redirects =3D 0
>
> vs.
>
> * ip6 saddr fe80::/10 ip6 hoplimit 255 daddr FF02::1 icmpv6 type 137=20
> accept;
>
>

Looked into various publications, including [1], but came up short in=20
discovering the hierarchy of /proc parameters vs firewall rules/chains, i=
=2Ee.

* is the kernel treating both the same or considers one or the other=20
weighing more/higher than the other?
* if treated equally does timing in availability of structures cancels=20
out the other, e.g. first available sets the rule or the last one=20
available cancels out the earlier one?

____
[1] https://www.kernel.org/doc/Documentation/filesystems/proc.txt

