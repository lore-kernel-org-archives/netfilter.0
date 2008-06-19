From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: too many INVALID packets
Date: Thu, 19 Jun 2008 12:50:48 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806191249310.14231@fbirervta.pbzchgretzou.qr>
References: <200806181415.00808.vladislav.kurz@webstep.net> <Pine.LNX.4.64.0806181446100.10175@blackhole.kfki.hu> <200806191231.56317.vladislav.kurz@webstep.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200806191231.56317.vladislav.kurz@webstep.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladislav Kurz <vladislav.kurz@webstep.net>
Cc: netfilter@vger.kernel.org


On Thursday 2008-06-19 12:31, Vladislav Kurz wrote:
>>
>> > I noticed that iptables offers new match: -m conntrack --ctstate
>> > which has also NEW, RELATED, ESTABLISHED and INVALID states. Are they
>> > somehow different from those matched by -m state --state ?
>>
>> The conntrack match offers more internal flags (like SNAT, DNAT) above
>> the state match.
>
>Ok, thats documented,what I wanted to know is if the four states NEW, RELATED, 
>ESTABLISHED and INVALID are equal in -m conntrack and -m state.

They are the same, but conntrack has more matching options.

>> > iptables -t filter -A INPUT -m state --state NEW -p tcp ! --syn -j LOG
>> >
>> > and it catches quite a lot of packets, but still it seems that conntrack
>> > knows about TCP connections being opened (SYN) and closed (FIN). Is there
>> > any reason for NEW packets without SYN to be allowed through?
>>
>> Yes, it's a (well known) feature of netfilter. This way we can catch up
>> connections already established. If you do not want to support it, use
>> the last rule you wrote.
>
>I thought it might be useful to block some weird portscans (e.g. nmap xmas 
>scan).

Xmas scans can be matched much more easily - using INVALID, see
http://jengelh.medozas.de/projects/chaostables/

