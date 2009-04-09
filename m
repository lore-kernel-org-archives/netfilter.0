From: Payam Chychi <pchychi@gmail.com>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Thu, 9 Apr 2009 10:02:12 -0700
Message-ID: <f08c15d10904091002x7bd56dfbx759536365b1c38c5@mail.gmail.com>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de>
	 <49DAD5E0.9020303@caf.com.tr> <49DDB24A.80400@chello.at>
	 <49DDF7C2.80008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=RcLRJdqgrMIdJPigAsRu/blJ593AON1go6KZ6Yv2Mts=;
        b=OiryUysOgqSGAQ8aIw/+SCczyrntPDAFGQoFqdmVEXCkAjrKcnIGtDFOl8sy7VcWbB
         Evt+iZjxGOaDds6vU83uEaRSFCUiwDhPZxYpzaNCnISeH+lsXbX1BCTJfAeyCSy3poA3
         tQM6qzylnAW10+BOUv9XZ9kz1lnnYSg7SRjkQ=
In-Reply-To: <49DDF7C2.80008@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hey Guys,

Any thoughts or ideas on when a fix for the -m limit function will be
made/released?

Thanks
Payam


On Thu, Apr 9, 2009 at 6:27 AM, Eray Aslan <erayaslan@gmail.com> wrote:
> On 09.04.2009 11:31, Mart Frauenlob wrote:
>> what about the 'policy' in the 'nat' table? Will it allow 'DROP'?
>
> # /sbin/iptables -V
> iptables v1.4.3.1
> # /sbin/iptables -t nat -P OUTPUT DROP
> iptables v1.4.3.1:
> The "nat" table is not intended for filtering, the use of DROP is
> therefore inhibited.
>
>
> Try `iptables -h' or 'iptables --help' for more information.
> # echo $?
> 2
> # /sbin/iptables -t nat -L|grep OUTPUT
> Chain OUTPUT (policy ACCEPT)
>
>> what about the other non 'filter' tables?
>> Will it be possible to 'DROP' in the mangle table? Or set it's polic=
y to
>> 'DROP'?
>
> Yes
>
>> Isn't dropping in the mangle table almost the same thing as doing th=
at
>> in the nat table?
>
> No. =A0Not all packets in a connection traverse the nat table.
>
>> At least it violates the concept of filtering in the filter table.
>
> Yes. =A0Correct place to filter in in the filter table. =A0But if you=
 insist
> on doing the "wrong" thing, who is to interfere?
>
> [...]
>> I've seen quite some people (mostly unexperienced) mess up their box
>> with that, most of them ending up asking for public help.
>> It seems misleading to me, to make that options available.
>
> Well, software does not grow on trees. =A0Someone has to write it but=
 is
> it really worth the effort to ban filtering in mangle et al? =A0Filte=
ring
> in the nat table was especially wrong because it didnot give the
> expected result and I suppose that is reason for the patch/revized
> behaviour.
>
> --
> Eray
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
