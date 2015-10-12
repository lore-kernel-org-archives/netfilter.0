From: Jason Sipula <alupis1@gmail.com>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Mon, 12 Oct 2015 11:11:26 -0700
Message-ID: <CAJCcFsip+zxLgOTjHfeWGug+up0+T3LM4Tb9+9uvvr0KDcBjMQ@mail.gmail.com>
References: <54761724.9060201@c-s.fr>
	<54815E4F.10500@c-s.fr>
	<20141205103827.GB3746@salvia>
	<54EDBD07.5010801@c-s.fr>
	<CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
	<561BF6AE.7080803@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=X35NR6cZXxWFFygyQJzniEi4fjGN9Fl4P7YTWK73sBY=;
        b=LusTcRXHy1vj8xT4Pv/hHLN0jm48poTf/RVEml+NVPEePJ6YKlqkJg8LwUYwykhc1x
         WdLnJqF5GuI3z5WTDcfEtOqrMdaz2KCrqP+N6TSnyKvaLnOpIN9o8OcPOzwmYswJ05Zj
         KP4fc0+EkRESziOqBV4TIOObRXPEn/fadq3AUJj2nAuZEQoYhS7gPq7Yrmtkut69e/Fu
         lbQVicup1ZG3tfBgY3dB+X3CJ33VUduF+kqI3EHrcN46p+O9GRHJtZZq2YmTOCWITP7Y
         6zjksctp/hiVuUoypCeUg2ZFJSN814GYpJGF7/JRS6pDnOtiJW5A3OCwAyNzrVSBzYvO
         8dCQ==
In-Reply-To: <561BF6AE.7080803@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: christophe leroy <christophe.leroy@c-s.fr>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Maybe we're talking about different things? I had read in some places
that linux kernel version 3.13 had the core of nftables merged.

https://wiki.archlinux.org/index.php/Nftables

I do not know anything about ct helper, however.

On Mon, Oct 12, 2015 at 11:06 AM, christophe leroy
<christophe.leroy@c-s.fr> wrote:
>
> Le 25/02/2015 16:58, Jason Sipula a =C3=A9crit :
>>
>> my understanding was 3.13 had the core of nftables merged
>
> Yes but according to Pablo, "userspace supports this but unfortunatel=
y the
> kernel code is still missing".
> Hence my question.
>
> As of today, what is the status of nftables regarding the support of =
ct
> helper ?
> If it is not in yet, how can I help getting it in ?
>
> Christophe
>
>
>>
>> On Wed, Feb 25, 2015 at 4:16 AM, leroy christophe
>> <christophe.leroy@c-s.fr> wrote:
>>>
>>> Le 05/12/2014 11:38, Pablo Neira Ayuso a =C3=A9crit :
>>>>
>>>> On Fri, Dec 05, 2014 at 08:27:11AM +0100, leroy christophe wrote:
>>>>>
>>>>> test.c               100%
>>>>>
>>>>> |****************************************************************=
********|
>>>>> 804   0:00:00 ETA
>>>>>
>>>>> # nft list ruleset
>>>>> table ip filter {
>>>>>           chain output {
>>>>>                    type filter hook output priority 0;
>>>>>                    udp dport tftp ct helper "tftp"
>>>>
>>>> The right syntax is:
>>>>
>>>>           udp dport tftp ct helper set "tftp"
>>>>                                    ^^^
>>>>
>>>> your rule above does something different:
>>>>
>>>> 1) udp dport tftp
>>>>
>>>> and
>>>>
>>>> 2) the ct helper is "tftp"
>>>>
>>>> However, userspace supports this but unfortunately the kernel code=
 is
>>>> still missing.  So you'll have to wait for this feature or
>>>> (temporarily) rely on the automagic helper assignment (from that
>>>> message, I understand you already do).
>>>
>>> Any idea of when the kernel support will be added ?
>>>
>>> Christophe
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> ---
> L'absence de virus dans ce courrier =C3=A9lectronique a =C3=A9t=C3=A9=
 v=C3=A9rifi=C3=A9e par le
> logiciel antivirus Avast.
> https://www.avast.com/antivirus
>
