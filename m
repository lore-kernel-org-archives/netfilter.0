From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 10:58:18 -0400
Message-ID: <7cd58ca4-9569-4c83-d648-4cd332007fd2@fhmtech.com>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <c3cba3e7-4cbb-13f5-7104-e1129416b5e0@fhmtech.com>
 <161865440.26652.1584887186397@ox93.mailbox.org>
 <e4b0dac3-78a3-c515-975d-5d8410e4e720@fhmtech.com>
 <799e2750-37c2-4fcd-8758-9eaed1d13c88@Canary>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=d0UPy9WVinF4gWKjwdabCmuxM1z9WrgNB6sWLlL7P3A=;
        b=hSva8x984cP2vy08/2YS6riUBGecMITlX7kkgN8Bnr9AsaxVkJhfQ5WDpxwvO+svOU+xyEQ/Ba9a4Jc8sgCCG1WMRwXhDBKmiYbIzJqzKZWGoePV/+O/FMyifOOSzdOsMkRFLEDTB0lfKNetkYYPTSmCWxFYJJcBz/vIHtTHCeE=;
In-Reply-To: <799e2750-37c2-4fcd-8758-9eaed1d13c88@Canary>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/22 10:50, Darius wrote:
> Yes, that is true. I will need two rules. Actually I=E2=80=99m using pack=
et marking quite widely, but I guess I should stop doing that and need to u=
pdate ruleset a bit.

AFAIK there's nothing wrong with packet marking, just prefer simpler /=20
more direct way if possible. :-)

Cheers,
Frank
