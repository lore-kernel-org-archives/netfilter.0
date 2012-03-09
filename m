From: James Anderson <japanwikidonate@gmail.com>
Subject: Re: quota display in iptables -L
Date: Sat, 10 Mar 2012 01:35:40 +0900
Message-ID: <CAL2t0L5=eg8xe3C5zUs1e9+xdNg9U_YNa64V65je81fYoHv_4A@mail.gmail.com>
References: <CAL2t0L4JR-kPUogudF+vWaypYjQmCPureZE6yM4PjYEVV+XhTg@mail.gmail.com>
 <CAL2t0L4r5ANvRyM=7Spnx68=wMcQCTR7qDH94V4-TRbXCKA-Gg@mail.gmail.com>
 <CAL2t0L4AjXx8QR22Q5cdh6ndPpmmrr58x-t6HG7kHZ6UadtOBg@mail.gmail.com>
 <CAL2t0L5bnu9pX_h01HtvEaurdhDa_QHdc6OeVfy3e4hoKe893g@mail.gmail.com> <4F5A0EB6.9000604@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=cMIuukUDg56Nfd5C/BfGO3/a5QF9AKz2fNrnt0B2jOk=;
        b=SXD1JgydE7uPO2ASnuwpexL+VlsGqcYD0Smpq1j5+1MRFV0l3QEI23bYssltrB+ppB
         S4TTttELcUal6QottYCt0foYfcnA+8hQfWI0Irom8gO30d4iXJiZPVteHyU6aiwGAEwm
         1X5zsw95I87y8ZDg0aYxH8HQ18YNMbx4Jkq9EqnNwmdl9RIFvuDnME7X48wjXzimWiMW
         43vX1cANTlu872MaSegracphwuTiaTaSZ8Hlpv/M4JqTT3UAAbYQSKhmvhM2W59xdutI
         eHTJ4IyI9cGFJawIvmrhMsPDTZRMcpgdBxX0thC0qrAMReqpxemPsUlO22TAh9kR0wxZ
         UO8A==
In-Reply-To: <4F5A0EB6.9000604@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>, netfilter@vger.kernel.org

> 31997506400-31997506128=3D272
> You are under the quota!

Thank you for your reply. By discrepancy I mean iptables -L -v showing
32GB and iptables-save showing the correct point where it stopped, at
the quota. That's a 2.2GB difference.



>
> 2012-03-09 01:19 keltez=E9ssel, James Anderson =EDrta:
>>
>> Hello everyone.
>>
>> I have been trying to get iptables to stop traffic to the internet
>> after I have exceeded 29.8 GB and just allow traffic to the local
>> subnet after that. I did the conversion on google and apparently
>> 29.8GB is 31997506400 bytes. However tonight when I got home and did
>> iptables -L -v, I saw this:
>>
>> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>> =A0pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source
>> destination
>> =A0 =A028M =A0 =A032G =A0 ACCEPT =A0 =A0 all =A0-- =A0any =A0 =A0any=
 =A0 =A0 anywhere
>> !192.168.2.0/24 =A0 =A0 =A0quota: 31997506400 bytes
>> 2459K 3621M =A0ACCEPT =A0 =A0 all =A0-- =A0any =A0 =A0any =A0 =A0 an=
ywhere
>> 192.168.2.0/24
>> =A0 5770 1151K =A0 REJECT =A0 =A0 all =A0-- =A0any =A0 =A0any =A0 =A0=
 anywhere
>> anywhere =A0 =A0 =A0 =A0 =A0 =A0reject-with icmp-port-unreachable
>>
>> At first I thought the quota didn't work, but then I did iptables-sa=
ve -c
>>
>> *filter
>> :INPUT ACCEPT [23078834:14787771556]
>> :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>> [28216466:31997506128] -A OUTPUT ! -d 192.168.2.0/24 -m quota --quot=
a
>> 31997506400 -j ACCEPT
>> [2475569:3622559686] -A OUTPUT -d 192.168.2.0/24 -j ACCEPT
>> [24154:2350411] -A OUTPUT -j REJECT --reject-with icmp-port-unreacha=
ble
>> COMMIT
>>
>> which shows that it stopped at 29.7999998 GB.
>> Could someone perhaps explain the discrepancy?
>> Does iptables keep counting bytes even after the quota is full?
>>
>> many thanks in advance,
>>
>> James
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
