From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 11:02:00 +0000
Message-ID: <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
References: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
 <20200923083042.GB10267@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601290942;
        bh=Jo0JClLsrhLgd3wdrtMIwk5Oy7cfMznTSVfYjCFj3Q0=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=Ctoh/9N44npJR5bxMAfyJbNIG72THYbR8+3KdUkCT18KqHtv/SSQjd2EGFSBXjrVQ
         qagYKoC7UInHlU90WXGAba8TBb+JwY7X9UEJ4IJjtHoU3XUxncwu6pAr6qN4nJMNVR
         /+lt3KmRCmUVgLGbu6uX+dzKdj46zM4IOq8a/Xhw=
In-Reply-To: <20200923083042.GB10267@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org


On 23/09/2020 10:30, Pablo Neira Ayuso wrote:
> On Tue, Sep 22, 2020 at 10:49:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> kernel 5.9.0-rc6 armv7l | nft 0.9.6
>>
>> ------
>>
>> (1) netdev rate limiting
>>
>> /table netdev filter {//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set glv4 {//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type ipv4_addr//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 size 65535//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flags dynamic,timeout//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 counter//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 timeout 15m//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gc-interval 10s//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook ingress device "eth2" priority -50=
0;
>> policy accept;//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ip saddr @glv4 counter packets 0 bytes 0 log prefix=

>> "nd glv4 DROP" flags all drop//
>> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> /Then however
>>
>> /nft add rule netdev filter input ip protocol tcp { ip saddr limit rat=
e
>> over 50/second burst 15 packets } update @glv4 { ip saddr }/
> table ip filter {
>          set glv4 {
>                  type ipv4_addr
>                  size 65535
>                  flags dynamic,timeout
>                  timeout 15m
>                  gc-interval 10s
>          }
>
>          chain input {
>                  ip protocol tcp update @glv4 { ip saddr limit rate ove=
r 50/second burst 15 packets }
>          }
> }
>
> This reads: update set 'glv4' with ip saddr using limit rate over
> 50/second burst 15 packets.
>
> You cannot combine counter and limit yet though.

It seems that updating a set and dropping the packet in the same rules=20
does not work either, e.g.

ip protocol tcp update @glv4 { ip saddr limit rate over 50/second burst=20
15 packets } log prefix "foo " drop

would seem to only update the named set but is neither logging nor=20
dropping the frame.

>
>> producing:
>>
>> Error: syntax error, unexpected saddr, expecting comma or '}'
>> add rule netdev filter input ip protocol tcp { ip saddr limit rate ove=
r
>> 50/second burst 15 packets } update @glv4 { ip saddr }
>> ^^^^^
>>
>> Is rate limiting not meant for the netdev chain or where do I go wrong=

>> with the syntax?
>>
>> ----
>>
>> (2) timeouts
>>
>> Like in the above statement is the timeout applicable to the entire se=
t,
>> i.e. the entire gets wiped after 15 min, or the timeout applies
>> selectively to each entry?
>>
>> Perusing
>> https://www.netfilter.org/projects/nftables/manpage.html#lbANhttps://w=
ww.netfilter.org/projects/nftables/manpage.html#lbAN
>>
>> /nft add rule ip filter input tcp flags syn tcp dport ssh meter flood
>> size 128000 { ip saddr *timeout 10s* limit rate over 10/second} add
>> @blackhole { ip saddr *timeout 1m* } drop
>>
>> /I fail to comprehend what the first statement (/timeout 10s/) achieve=
s;
>> what is the purpose?
>>
>> As for the second statement (/timeout 1m/) I am wondering whether it
>> would clash with or supersede the statement in the set (e.g. /timeout
>> 15m/ as in the above example)?
> timeout in your rule (if specified), eg.
>
> ... update @xyz { ip saddr *timeout 1m* }
>
> overrides the global set timeout policy.


