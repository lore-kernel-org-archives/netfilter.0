From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: NAT table bypass for local traffic
Date: Fri, 30 Apr 2010 12:52:45 +0530
Message-ID: <s2xcfeab66d1004300022ub22078fby6a32f58f576b5e36@mail.gmail.com>
References: <q2xcfeab66d1004282325wbf9a93aduf3a8fc2d82ee90b0@mail.gmail.com>
	 <001636c5c15232dea504855f65c2@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=MdR7c4Pba3Hlonm4jbiq4ZTUzW4g3ecuM3W0uawxLFQ=;
        b=ZwLWo434r15J11LpkehmJG4TgJIbA/Mrv5YGCHQO++PFCPZKPOEEpfoFdwmdZb3cSX
         KtSCD7w5IYZfrIR8QIYKUoRJtZGYEkfof9Txa/1wy1cziOOG32sb8dUMcNkIdEAupHuI
         xuzedkFappWOSApnbHEYKoupqCF3i6GWC615I=
In-Reply-To: <001636c5c15232dea504855f65c2@google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: billprozac@gmail.com
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

On Thu, Apr 29, 2010 at 6:07 PM,  <billprozac@gmail.com> wrote:
> The echo-reply does not.
>
> On Apr 29, 2010 2:25am, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>> =A0>>the outgoing echo-reply matches to it and thus does
>>
>> > not show up in nat OUTPUT/POSTROUTING.
>>
>>
>>
>> Does echo reply will show up in nat PREROUTING chain ?
>>
>>
>>
>> Thanks,
>>
>> Ratheesh
>>
>>

Is icmp different from other protocol packets ?

My understanding is  : - { In a router }  whenever a packet hits
PREROUTING  chain , a tuple is created  and state is made NEW by
conntrack module . When the packet goes out of POSTROUTING chain,
install  original and reply direction tuples in hash table . When
reply packet comes back and hits PREROTUING chain , state is made
ESTABLISHED .

So , in icmp , whenever request goes out itself  , state will be made
ESTABLISHED ???

Thanks,
Ratheesh



>>
>> On Thu, Apr 29, 2010 at 2:25 AM, Sven-Haegar Koch haegar@sdinet.de> =
wrote:
>>
>> > On Wed, 28 Apr 2010, Bill Prochazka wrote:
>>
>> >
>>
>> >> A more simple example is that ICMP echo requests
>>
>> >> go out the nat table's output chain, but ICMP echo replies do not=
=2E
>>
>> >
>>
>> > The incoming ICMP echo-request (should be visible in PREROUTING) s=
ets up
>>
>> > a conntrack entry, the outgoing echo-reply matches to it and thus =
does
>>
>> > not show up in nat OUTPUT/POSTROUTING.
>>
>> >
>>
>> > c'ya
>>
>> > sven-haegar
>>
>> >
>>
>> > --
>>
>> > Three may keep a secret, if two of them are dead.
>>
>> > - Ben F.
>>
>> > --
>>
>> > To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>>
>> > the body of a message to majordomo@vger.kernel.org
>>
>> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>>
>> >
>>
