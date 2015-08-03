From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: SNAT and connection tracker: should established connections be
 dropped when a rule is removed from nat table?
Date: Mon, 3 Aug 2015 12:33:20 +0530
Message-ID: <CAA5aLPg7YmZnas9QK6BxFaurWTqxJexDO7F835YGSMXtXfcu2A@mail.gmail.com>
References: <CAH+_UjV=_dGtUk5D=EnFB2YNeDvDO8GNwu6sMk2=Ci0VpPyTkw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=w3fRLkYGE0B05MboeoeNv9eK+lAyHhojqiP0dJ22jcY=;
        b=HPkKag35Od3vUzvNmv/MI1sz+Tv+e295Ae+XMBD6ghe+wDPOTHh/7aOvDgQiBmQ5B4
         +QxRbz3eadK6BbV64iP9TqNMlMlJO0/ecCBMtKIZCeJ0LhsDz7d8ouSMm0aaLZsb/ukT
         5nuQBu6iN3ALc2MiUOT96qG5Z8NZmy9npyKXrvR5U9E9xOa9hvz7eiMvAx36nfjoFOVk
         UIVgPtGGQj6OOYTN406mApKKqbBoZ+SWZZmUuV6XT6oN4scW18O505bOcJTiafii3om9
         /+Zz4BIGzIEpX2Jh6RsgNpEsiwm9foDSR9LP2zCw6szcBoyT3nP7aC9o1BYDUfaDzwyo
         zu+g==
In-Reply-To: <CAH+_UjV=_dGtUk5D=EnFB2YNeDvDO8GNwu6sMk2=Ci0VpPyTkw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vitaly Repin <vitaly_repin@fsfe.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

why not use 'conntrack -D'  command to delete conntrack entries from
connection tracking itself ?

On Fri, Jul 31, 2015 at 4:01 PM, Vitaly Repin <vitaly_repin@fsfe.org> w=
rote:
> Hello,
>
> I've described complete solution implemented:
> http://vrepin.org/vr/IPsec-PacketLeakage/
>
> Hopefully, it can be useful for others facing similar problems.
>
> 2015-07-10 19:29 GMT+03:00 Noel Kuntze <noel@familie-kuntze.de>:
>> Hello Vitaly,
>>
>> Create a drop rule in *filter FORWARD, that drops incoming
>> packets for SNATed IPs without a matching policy
>>
>> - -A FORWARD -m ipset --set snatedIPs dst -m policy --pol none --dir=
 out -j DROP
>>
>> Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
>> Noel Kuntze
>>
>> Am 10.07.2015 um 18:26 schrieb Vitaly Repin:
>> > Hello,
>> >
>> > I need am advice on SNAT.
>> >
>> > There is SNAT setup where my clients connected through ipsec. When=
ever
>> > new connection appears, SNAT rule for respective IP is created.
>> > Whenever client disconnects, corresponding SNAT rule is dropped.
>> >
>> > In general it works, but this schema leads to the packets leakage =
through NIC:
>> >
>> > 1) IPSEC client disconnects
>> > 2) Rule for this client is deleted from the nat table
>> > 3) But incoming messages (from remote servers) for already establi=
shed
>> > connections are continuing to come! They are "de-NATed" regardless=
 of
>> > the fact the rule does not exist anymore.
>> > 4) They come to xfrm subsystem which does not take them (as no SA
>> > associated with this IP exists)
>> > 5) As a result these packets (addressed to the private addresses) =
are
>> > appearing on the eth0 interface
>> >
>> > As of now my solution is to drop these packets using ebtables. But=
 I
>> > am still not sure it's an optimal one.
>> >
>> > So, my questions:
>> >
>> > - Do I understand it right that when SNAT rule is deleted from the=
 nat
>> > table, it does not mean that already established connections are
>> > stopped from being tracked? And the they are continuing to flow us=
ing
>> > the rule which was assigned to them at the moment when correspondi=
ng
>> > connection was created?  Can this behavior be changed?
>> > - Any idea how can current schema be improved?   The first option =
I
>> > see is to be able to stop SNATting of the connections for which th=
e
>> > rule was deleted. In theory I can do it even from userland. The se=
cond
>> > option is to ask xfrm to drop all the packets from specific networ=
k if
>> > there no SA for dest IP address of the packet (sounds weird).
>> >
>> > Thanks in advance!
>
> --
> WBR & WBW, Vitaly
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
