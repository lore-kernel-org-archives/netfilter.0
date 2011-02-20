From: E2IA <e2ia.ci@gmail.com>
Subject: Re: mark and accept in a single rule
Date: Sun, 20 Feb 2011 20:45:59 +0000
Message-ID: <AANLkTi=X=v8mWbpTPC03F6k0DfJE+bUtc=VO7a3qtGHA@mail.gmail.com>
References: <AANLkTimFXztjt5iJbv2bnP3iqe9GoTcaqEbg1ULsWynZ@mail.gmail.com>
	<1298215673.12048.12.camel@andybev>
	<AANLkTimO0tqE4ftCtBLv1n+X6hdJqQANEh7vicz_NL50@mail.gmail.com>
	<1298222310.12048.40.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=R2E7lVeL2Itb8umgjHYz/izRQpTffb89MXzumZu9xgc=;
        b=vIdZSVnkEDVnOODaHt8gASE6GaKCygGLiWc1s7OXKP4QagaciKnk6DsLCCxs/PzUM9
         7Ad+GwrOMBOSKJ1O6/HzY/B+8EeNR4QFU3+HcRgnmSxifZQahuHyEibFGfsXyUxuFgkq
         SXaZgfJQq/OAHWEm9+bOCSt3Qb73MIE62S3Xc=
In-Reply-To: <1298222310.12048.40.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

HI,
thank you for your reply I think layer7 is quite old.
is there any projet like layer7.
regards.

2011/2/20 Andrew Beverley <andy@andybev.com>:
> On Sun, 2011-02-20 at 16:10 +0000, E2IA wrote:
>>
>> 2011/2/20 Andrew Beverley <andy@andybev.com>:
>> > On Sun, 2011-02-20 at 15:13 +0000, E2IA wrote:
>> >> Hi all i'd like to know if it is possible to mark packet and acce=
pt in
>> >> the single iptable rule.
>> >
>> > There shouldn't be any need to do this.
>> >
>> >> i've these 2 rules:
>> >>
>> >> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =
=C2=A0 -m layer7
>> >> --l7proto =C2=A0yahoo =C2=A0-j MARK --set-mark 74
>> >> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =
=C2=A0 =C2=A0-m mark --mark
>> >> 74 =C2=A0-j ACCEPT
>> >>
>> >> but it seam that the second rule is never match.
>> >
>> > The second rule *should* be matched. What makes you think that it =
is
>> > not? Remember: a packet ACCEPTed in one chain can be DROPed later.
>> >
>> > It might be worth you posting your complete set of rules.
>> >
>
> [ Top posting fixed ]
>
>> Hi here is my complete rule set:
>> #!/bin/bash
>> #script Shapping marker config
>> /usr/local/sbin/iptables =C2=A0-t mangle -F FORWARD
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m layer7
>> --l7proto =C2=A0yahoo =C2=A0-j MARK --set-mark 74
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m mark --mark =C2=A074
>> -j =C2=A0ACCEPT
>
> <snip>
>
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m layer7
>> --l7proto =C2=A0http =C2=A0-j MARK --set-mark 9
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m mark --mark =C2=A09 -j =C2=A0ACCEPT
>
> <snip>
>
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m layer7
>> --l7proto =C2=A0finger =C2=A0-j MARK --set-mark 6
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m mark --mark =C2=A06 -j =C2=A0ACCEPT
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0-j =C2=
=A0ACCEPT
>> # End
>>
>> When doing yahoo messenger it is http, skype and finger witch are
>> match enven yahoo is the first rule.
>> but when =C2=A0i keep yahoo rule alone yahoo is mach when doing yaho=
o messenger.
>>
>
> It's been a while since I played with l7-filter, but I suppose it cou=
ld
> be something to do with the way that it is classifying packets (it
> sometimes has to see a significant amount of data before it matches s=
ome
> protocols).
>
> You might want to try the following for your rules instead, but if yo=
ur
> problem is something to do with l7-filter then it may not help:
>
> iptables -t mangle -A FORWARD -m mark --mark 0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0-m layer7 --l7proto yahoo -j MARK --set-ma=
rk 74
> iptables -t mangle -A FORWARD -m mark --mark 0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0-m layer7 --l7proto http -j MARK --set-mar=
k 9
>
> This will only match and mark packets if they haven't already been
> marked. The disadvantage of this is that all packets will traverse al=
l
> rules making it less efficient.
>
> If you still can't get it to work, you should maybe try asking over a=
t
> the l7-filter project.
>
> Andy
>
>
>
