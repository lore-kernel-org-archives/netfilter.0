From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] sets update concatenation?
Date: Sat, 26 Sep 2020 19:21:00 +0000
Message-ID: <9d90c22b-c3ae-8997-e694-6c1bad7c7f00@gmx.net>
References: <a629ba84-7c4e-3663-3516-9176d3223965@gmx.net>
 <20200926182145.GA3628@salvia> <3fcc0be7-b4f8-c17e-96bb-8cef53f375c5@gmx.net>
 <20200926190754.GA3748@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601148087;
        bh=kmDrT+LP+BAuZ8LYVqsfAHqkb9UuFXrPuZvcBXkjcWI=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=aqRt91ZLQ6hwlR59KOfAq+RsGl8XpIv4HmwTUiDv57/KlbuP+eNQYi4Ho1Cmw6IYO
         SOvw0Tn5RAxYZv48gIaev7r8QkRiS7myb3MWYX6LNY2bVmbhiNxvzQNja84DzzVCzt
         kHmIAcqdjlZOvdaolxFsQqmzwK9f8l1pSOhA2L08=
In-Reply-To: <20200926190754.GA3748@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 26/09/2020 21:07, Pablo Neira Ayuso wrote:
> On Sat, Sep 26, 2020 at 06:44:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> On 26/09/2020 20:21, Pablo Neira Ayuso wrote:
>>> On Fri, Sep 25, 2020 at 07:10:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=
=B3=E2=84=A0 wrote:
>>>> Been trying to concatenate sets update:
>>>>
>>>> tcp dport @b_t update @b_sa4 { ip saddr } drop;
>>>> tcp dport @b_t update @b_sa6 { ip6 saddr } drop;
>>>>
>>>> with:
>>>>
>>>> tcp dport @b_t update @b_sa4 . @b_sa4 { ip saddr . ip6 saddr } drop;=

>>> What's the intention here?
>>>
>>>> but that did not work out. Is somehow possible to concatenate sets u=
pdate?
>>> Yes, you can do:
>>>
>>> tcp dport @b_t update @b_sa4 { ip saddr . ip6 saddr } drop
>>>
>>> You can update one single set at a time. Not sure what you expect fro=
m
>>> this concatenating sets instead of keys.
>> The two mentioned sets are dynamic, learning ip | ip6 saddrs from hits=
 on
>> tcp dport.
>>
>> The intended concatenation was to put it into one rule instead of two,=
 like
>> if ip saddr then update element in set @b_sa4 and if ip6 saddr then up=
date
>> element in set @b_sa6 respectively.
> So you would like to consolidate:
>
>   tcp dport @b_t update @b_sa4 { ip saddr } drop
>   tcp dport @b_t update @b_sa6 { ip6 saddr } drop
>
> In one single rule?
>
> Something like (hypothetical syntax)
>
>   tcp dport @b_t update @b_sa { inet saddr } drop
>
> where b_sa is a set with something like type inet_addr.

In a way yes, though this would consolidate also ip and ip6 into the=20
same set and could make viewing (a large) set it bit cumbersome, unless=20
there was an optional view filter something like

nft list set [family] [table] filter [set] ( optional [ip] | [ip6] )

