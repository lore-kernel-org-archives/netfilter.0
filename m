From: Carlos Mtz-Troncoso <cmartinez@uninorte.edu.co>
Subject: Re: Port forwarding problem
Date: Sat, 16 Oct 2010 09:01:32 -0500
Message-ID: <4CB9B03C.2090107@uninorte.edu.co>
References: <4CB9A03C.7020700@uninorte.edu.co> <4CB9A4FE.1050905@plouf.fr.eu.org> <4CB9A669.7020008@uninorte.edu.co> <4CB9AAB2.8070803@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9AAB2.8070803@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal you are right!

I just changed some -I for -A and moved
iptables -A FORWARD -j DROP
to the end and it works!

It was a fool error, I know that ACL order is crucial!

Thanks a lot for your help

On 10/16/2010 08:37 AM, Pascal Hambourg wrote:
> Carlos Mtz-Troncoso a =E9crit :
>> Thanks Pascal for your answer.
>>
>> I had that rule but I deleted, I just add again
>>
>> iptables -A FORWARD -p tcp -i eth0 -d 10.1.1.7 --dport 80 -j ACCEPT
>>
>> but it doesn't work.
>
> Maybe because of the rule ordering ? Your script weirdly mixes -I and=
 -A
> commands, and has a "-I FORWARD -j DROP" rule which inserts a plain
> "DROP everything" at the very beginning of the chain. As a result, an=
y
> rule created before or appended after this one has no effect.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
