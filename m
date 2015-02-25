From: Jason Sipula <alupis1@gmail.com>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Wed, 25 Feb 2015 07:58:29 -0800
Message-ID: <CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
References: <54761724.9060201@c-s.fr>
	<54815E4F.10500@c-s.fr>
	<20141205103827.GB3746@salvia>
	<54EDBD07.5010801@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=DBQ5mIOR0pYVa6PzZ7f2uIUVUOeL2e30EB6VHia/Zaw=;
        b=hHldtuwEVCbxatE9cT+tYGz5WwCQRWHtQQpcawVZ/FEmDWfJVn73HqXz7o1N4LAOIl
         i2Thaa+yaoFCp3Lrg4zmevkgRau/prDAp4Wh9a3U5Mx9+zyxSIkgK2+S51KunFoxQh3F
         DSbR1U+1lRmiMfMPMkgzvhdRimNa+XTRlABlW4JfnLiAdDmAScjdgUramrBy1kEj9UhT
         gyPK4+cfMFX/RFfYDlcgRs/Wa/vvXw9/p16Y2S/zLffbMgwL9BYlri6Cm2ps0pqdoJyN
         43X/ClP1JlEEdFwcGKyzkb+jvZgh3SO/Qjrt2L15w+Oi6omlrL6vFjDJSmsUEUP4fwdI
         nePg==
In-Reply-To: <54EDBD07.5010801@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

my understanding was 3.13 had the core of nftables merged

On Wed, Feb 25, 2015 at 4:16 AM, leroy christophe
<christophe.leroy@c-s.fr> wrote:
>
> Le 05/12/2014 11:38, Pablo Neira Ayuso a =C3=A9crit :
>>
>> On Fri, Dec 05, 2014 at 08:27:11AM +0100, leroy christophe wrote:
>>>
>>> test.c               100%
>>> |******************************************************************=
******|
>>> 804   0:00:00 ETA
>>>
>>> # nft list ruleset
>>> table ip filter {
>>>          chain output {
>>>                   type filter hook output priority 0;
>>>                   udp dport tftp ct helper "tftp"
>>
>> The right syntax is:
>>
>>          udp dport tftp ct helper set "tftp"
>>                                   ^^^
>>
>> your rule above does something different:
>>
>> 1) udp dport tftp
>>
>> and
>>
>> 2) the ct helper is "tftp"
>>
>> However, userspace supports this but unfortunately the kernel code i=
s
>> still missing.  So you'll have to wait for this feature or
>> (temporarily) rely on the automagic helper assignment (from that
>> message, I understand you already do).
>
> Any idea of when the kernel support will be added ?
>
> Christophe
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
