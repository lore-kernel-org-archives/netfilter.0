From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Advanced Logging
Date: Thu, 3 Jun 2010 23:45:15 +0530
Message-ID: <AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
	<AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=h7AB2pu2E/LHP5JcfWJ+N1T+Y777Ea5oWlJviPPJ64s=;
        b=lSCHWR8rvcGbvk8BNv30Ms1WUfFJnm2cEzB3rS7iDtVTJlARf+Sv0v/2itJEL1l6IY
         kaeRUwiTQ5SXmVf0+5pKUZhcxQFIE77YaFwbciwgfcGbQeqCMjZrw+KvOW54nFS8ELNp
         hpKw+9YbjX/4TAovcAKshIWr4f/ciBq/ETAnI=
In-Reply-To: <AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-2?B?VG9t4bkgVmzoZWs=?= <tomasvlcek@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

2010/5/30 Tom=C3=A1=C5=A1 Vl=C4=8Dek <tomasvlcek@gmail.com>:
> Maybe psad (Port Scan Attack Detector) is that what are you looking
> for. Check http://cipherdyne.org/psad/index.html.

I gone through the link . It seems to be heavy for my embedded applicat=
ion .

My embedded box is a router with two inerfaces - wan0 and lan0 . I
should get information regarding various attacks tried on lan clients
=2EI have some implementation in mind .(see below )

1  Is there any tool fit my requirement or  there any tool , i can do
a little  modification in code   and use .
2 . Is my idea feasible to implement ? . Is it worth implementing ,
because it is run as part of softirq_rx kernel thread . Will it dampen
performance ?
3 . Could i do this as part of connection tracking module . If , could
you guide  a little ?

***********************************************************************=
***********************************************************************=
***********************
"install two  hook functions on NF_IP_FORWARD  hook with
NF_IP_PRI_FIRST( first_hook_func )  and  NF_IP_PRI_LAST(last_hook_func
) priority .   iptables drop all  DOS attack ,flood   pkts in FORWARD
chain with NF_IP_PRI_FILTER priority ,

A tuple ( destip , srcip , protocol , timestamp , in_count , out_count
 ) will be created for each NEW packet in first_hook_func for all
packets from wan to lan . there should be different linked list tuple
for differnt type of packets ( syn attck , icmp  flood  etc ) . And
in_count is incremented   . And in last_hook_func , i  do hashing to
find the correct tuple . if found , out_count is incremented . In
last_hook_func itself , deletion of old entries ( if timestamp <
jiffies -delta ) needs to be done . And in last_hook_func , proc entry
is updated ,if in_count - out_count  is greater than some particular
threshold .That means , a lot of same kind of packet visited
first_hook_func but dropped in Filter table .

***********************************************************************=
***********************************************************************=
**********************





>
> There is also a great book about this program (and 3 additional
> programs as well) written by the author of these programs. This book
> covers psad (analyser of iptables logs), fwsnort (translator of Snort
> rules into iptables rules), fwknop (single packet authorization) and
> ways how to visualize iptables logs. Details can be found at
> http://www.nostarch.com/firewalls_mr.htm.
>
> I hope this helps...
>
> Tom=C3=A1=C5=A1 Vl=C4=8Dek
>
> On Sun, May 30, 2010 at 4:28 PM, ratheesh k <ratheesh.ksz@gmail.com> =
wrote:
>>
>> Hi ,
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have implemented =C2=A0firewall=
 =C2=A0in my linux machine using
>> iptables . It is able to prevent attacks and LOG just before droppin=
g
>> packets . Since i know a little about iptables , i could go thru
>> /var/log/messages and find out information about attacks . Is there
>> any application which will analyze logs and =C2=A0give a brief infor=
mation
>> to user about the attacks =C2=A0?
>>
>> For example , suppose there was a syn flood attack ,the application
>> should analyse the /var/log/messages or by some means should know
>> about the attack and let the user know about that .If there is no
>> application , =C2=A0could you give some hints on how to develop an
>> application .Any comment is =C2=A0appreciated .
>>
>> Thanks,
>> Ratheesh
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
