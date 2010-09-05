From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: Re: a single rule that mach source ip or destination ip
Date: Sun, 5 Sep 2010 16:49:31 +0000
Message-ID: <AANLkTimWe2kxVmJkMYsTv8YaYjDBWqxrCf4BTjcKyqQM@mail.gmail.com>
References: <AANLkTimXBDQhkkC4UxS5N3semU6V9v46vNfqpPC2cTTZ@mail.gmail.com>
	<alpine.LNX.2.01.1009051110090.29132@obet.zrqbmnf.qr>
	<4C83A7CA.4060508@plouf.fr.eu.org>
	<alpine.LNX.2.01.1009051747240.9116@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=AY6q+dT3UG8IZ4rv3ElQL3UrznLEQGmLpPFWC/HkvC4=;
        b=nFfwL970kA8MzMb86xGnC0g2xj387Z37E51UHnSo1FOfqmXWKk3QwxFjRQrnyldkmB
         /mqt8uE7AId9zw+SwNgO2sjKA291fFSkKEROhmRyziidZ06fVTOK2EeAjjL5ubJN+//T
         vuOzdjggNXsWizkxHPd+I5ZyJyzQLm9kRzYJ4=
In-Reply-To: <alpine.LNX.2.01.1009051747240.9116@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

hi,
all thank you for your help. can someone give me sample rule plz.
regards.

2010/9/5 Jan Engelhardt <jengelh@medozas.de>:
>>>
>>>> all is it possible to write a single rule that match source IP or
>>>> destination IP.
>>>
>>> It is possible.
>>
>>With the "u32" match, I suppose ?
>
> Ah the language. A linguistic or/and is not the same as a logical
> OR/AND. Parenthesis are required in doubt.
>
> It is possible to write a single rule that matches either src _or_ dst,
> _or_ both src addr and dst. Confusion complete!
>
> u32 does not change that fact. Since rules themselves are ORed so to
> speak, there is few reason to do the same between matches (short of
> deeper match logic).
> It is called disjunctive normal form.
>
