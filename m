From: Mahmood Naderan <nt_mahmood@yahoo.com>
Subject: Re: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 04:32:42 -0700 (PDT)
Message-ID: <104125.36240.qm@web111712.mail.gq1.yahoo.com>
References: <642302.28729.qm@web111719.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr> <993639.25943.qm@web111704.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291305050.2679@obet.zrqbmnf.qr> <716679.51968.qm@web111703.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291310150.2679@obet.zrqbmnf.qr>
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1304076762; bh=Y/AMM2I2ImlirBs7CTyeL/XIqmktAjhIUt9BlbklgqM=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=6GTmY9rk2FFinancEW7ICBz+wDwOGBE1NIT5AeC7Q4b3YUBqNiImZiEYFoCamQYbuu5nhBCnGsJ/SCZJGt8Z8Cp2MiAlp38cbma8FpfS72YOVlSdfFR/RwQPP8P/iIX0v3IG7omEZKO3cIwuPLjMTJ0uW0fGpIG6JqkB3q+fQ5g=
In-Reply-To: <alpine.LNX.2.01.1104291310150.2679@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>you still need a function /lib/modules/* directory - and that is
>what seems to be afoul in your system.

I checked that folder and it is empty. Maybe these questions are not re=
lated to this list
but I will be glad if you help me what to do.
=A0
Thanks.
=A0
// Naderan *Mahmood;


----- Original Message -----
=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Sent: Friday, April 29, 2011 3:42 PM
Subject: Re: can't initialize iptables table `filter'

On Friday 2011-04-29 13:09, Mahmood Naderan wrote:

>>But I talked about the kernel.
>
>Sorry but I am confused. What is wrong with kernel?=20

Quoting myself from earlier:

>>Make sure you kernel is configured with these enabled, and don't forg=
et=20
>>to actually provide the modules, if not already built-in, because it=20
>>does have the looks of a crippled installation, judging from the miss=
ing=20
>>modules.dep.

>Since the client can boot and I can login to that,=A0I don't think any=
=20
>thing wrong=A0with kernel.
>
>Can you exaplain more?

Just booting the kernel is only half of the work. In most cases,
you still need a function /lib/modules/* directory - and that is
what seems to be afoul in your system.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html

