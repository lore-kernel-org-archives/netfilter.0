From: =?windows-1252?Q?David_Bala=9Eic?= <xerces9@gmail.com>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 14:03:11 +0200
Message-ID: <9948385e0906190503i223f715s49730aa8e5e5df89@mail.gmail.com>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
	 <200906191218.03217.ben@differentialschokolade.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1dPoJ/9RMnLIMwnTFPJcmCvkZcy3wavHJfr/JBspPFo=;
        b=HFmva81MA2NVhmAZlINVkU/LfOpxsGwYCR/Jilir9rJtJigR4sghgGVrCPvPDlMMrk
         vI/JSamwaR8tkX0FYIFRBYkJzmnT3bfVvcjSzElT/+2HyZW9QfsAL/OIVGxN1vjQONtM
         WlAQayyLtDvNPzaH7/WgAnYC6V9x7b81digms=
In-Reply-To: <200906191218.03217.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Benedikt Gollatz <ben@differentialschokolade.org>
Cc: netfilter@vger.kernel.org

(resending, it seems I forgot to CC the list)
(and again, it seems gmail put some HTML into the last post from me :-(=
 )


One more thing: Where is the timeout for this set ?
After the mentioned ping, the world can contact me for hours.

I want to lower the timeout to a minute or so, so I can test the
setting without the need to wait hours for the timeout to happen.

Thanks,
David

2009/6/19 Benedikt Gollatz <ben@differentialschokolade.org>:
> On Friday 19 June 2009, 10:31 David Bala=9Eic wrote:
>> I have set up a (SixXS[1]) IPv6 tunnel on my linux router and have t=
he
>> problem, that after a while I become unavailable over IPv6 for the
>> outside world.
>> Then I I perform some IPv6 activity, like "ping6 ipv6.google.com" I
>> become accessible again for a while.
>
> This indeed sounds like netfilter is dropping proto-41 packets when t=
he
> connection tracker thinks that your connection has timed out.
>
>> A SixXS FAQ entry[2] suggests adding an iptables rule:
>> =A0iptables -t nat -A POSTROUTING --proto ! 41 -o [Your IPv4 Interfa=
ce]
>> -j MASQUERADE
>>
>> This way I get (iptables -t nat -L ...):
>>
>> Chain POSTROUTING (policy ACCEPT)
>> target =A0 =A0 prot opt source =A0 =A0 =A0 =A0 =A0 =A0 =A0 destinati=
on
>> postrouting_rule =A0all =A0-- =A0anywhere =A0 =A0 =A0 =A0 =A0 =A0 an=
ywhere
>> MASQUERADE =A0all =A0-- =A0anywhere =A0 =A0 =A0 =A0 =A0 =A0 anywhere
>> MASQUERADE !ipv6 -- =A0anywhere =A0 =A0 =A0 =A0 =A0 =A0 anywhere =A0=
# the added rule
>>
>> I am not an iptables expert, but to me it seems the first MASQUERADE
>> rule matches all packets and the new one does not make any differenc=
e.
>> Can someone confirm that ?
>
> That's absolutely true. The rule from the FAQ is meant to replace you=
r
> original rule, exempting proto-41 traffic from masquerading and thus
> connection tracking.
>
> Benedikt
>
