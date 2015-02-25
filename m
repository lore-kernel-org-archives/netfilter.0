From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Wed, 25 Feb 2015 13:16:07 +0100
Message-ID: <54EDBD07.5010801@c-s.fr>
References: <54761724.9060201@c-s.fr> <54815E4F.10500@c-s.fr> <20141205103827.GB3746@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20141205103827.GB3746@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


Le 05/12/2014 11:38, Pablo Neira Ayuso a =E9crit :
> On Fri, Dec 05, 2014 at 08:27:11AM +0100, leroy christophe wrote:
>> test.c               100% |*****************************************=
*******************************|
>> 804   0:00:00 ETA
>>
>> # nft list ruleset
>> table ip filter {
>>          chain output {
>>                   type filter hook output priority 0;
>>                   udp dport tftp ct helper "tftp"
> The right syntax is:
>
>          udp dport tftp ct helper set "tftp"
>                                   ^^^
>
> your rule above does something different:
>
> 1) udp dport tftp
>
> and
>
> 2) the ct helper is "tftp"
>
> However, userspace supports this but unfortunately the kernel code is
> still missing.  So you'll have to wait for this feature or
> (temporarily) rely on the automagic helper assignment (from that
> message, I understand you already do).
Any idea of when the kernel support will be added ?

Christophe

