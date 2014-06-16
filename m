From: pistenflitzer@alpenjodel.de
Subject: Aw: Re: Problems to get started with nftables
Date: Mon, 16 Jun 2014 17:19:54 +0200
Message-ID: <trinity-3a9fb6b3-7e0d-45aa-b7a5-6be4a31a2a5d-1402931994020@3capp-gmx-bs50>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?UTF-8?Q?=22=C3=81lvaro_Neira_Ayuso=22?= <alvaroneay@gmail.com>
Cc: netfilter user mailinglist <netfilter@vger.kernel.org>

Dear =C3=81lvaro,

thank you for your detailed answers. Some questions still remain, unfor=
tunately.

> >                   icmp type { echo-request } limit rate 5/second co=
unter accept
>                             ^^^^^^^^^^^^^^^^
> It's a single element, you don't need to use a set. You can use the r=
ule=20

I just added the braces to be consistent throughout the ruleset.

> > What I observe when I load these rules is that the accept in the lo=
g1 line is
> > not enough to accept the packets. They are ultimately dropped in th=
e log3
> > rule. How do I get the packets through both rule chains?
>
> Because you have a table inet and a table ip6. The table ip6 filter
> sees the ip6 traffic and the table inet filter sees the ip4 and ip6=20
> traffic. You have defined the priority of the first chain at 0 so=20
> nftables checks the rules there and after nftables checks the rules=20
> inside of the filter chain in inet.
>
> I suggest you to use one singles filter table like inet.

How would the rule look like? I tried to just copy it to the inet secti=
on,
but I get "Error: conflicting protocols specified: inet-service vs. icm=
pv6".

I created the separate ip and ip6 tables only for icmp and icmp, becaus=
e I
couldn't get past this issue:
$ nft add rule inet filter input icmp type { echo-request } limit rate =
5/second counter accept
<cmdline>:1:28-36: Error: conflicting protocols specified: inet-service=
 vs. icmp
$ sudo nft add rule inet filter input icmpv6 type { echo-request } limi=
t rate 5/second counter accept
<cmdline>:1:28-38: Error: conflicting protocols specified: inet-service=
 vs. icmpv6
$ nft add rule ip6 filter input icmpv6 type { echo-request } limit rate=
 5/second counter accept
<works>

> > #                 udp sport bootps dport bootpc accept
>
> The rules is like that:
>
> nft add rule filter input udp sport bootps udp dport bootpc accept

OK, I overlooked the second udp. Now, it works fine.

> > And finally: Is there a way to match the destination mac address of=
 an
> > incoming packet?
>
> You must to add a rule with ether like this:
>
> nft add rule filter input ether daddr 20:16:d8:a2:59:33 counter

In what section would that go? When I just execute the command, I get:
"<cmdline>:1:1-59: Error: Could not process rule: No such file or direc=
tory
add rule filter input ether daddr 20:16:d8:a2:59:33 counter"

Thanks again,
Michael
=2E
