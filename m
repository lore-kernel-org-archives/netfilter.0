From: agashi shipora <gashipo@gmail.com>
Subject: Re: uisng L7 filter in ebtables commands
Date: Thu, 1 Apr 2010 19:44:35 +0530
Message-ID: <s2m861e3bca1004010714g502e3c9esaf8832979c0a8bbf@mail.gmail.com>
References: <x2v861e3bca1003311124sa0aa2ab6y94fa42c650ef16f8@mail.gmail.com>
	 <4BB4427A.3020706@pandora.be>
	 <n2z861e3bca1004010050j7063cee8ya8c27ac73458b8bf@mail.gmail.com>
	 <alpine.LSU.2.01.1004010958390.18225@obet.zrqbmnf.qr>
	 <z2t861e3bca1004010248z4bbaf9b7ld414baa09a4153ff@mail.gmail.com>
	 <4BB4737E.7000602@pandora.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=GnC57Fz1+ib7trlccbvoKhkkUI7jPFYnw2m9d2psHDU=;
        b=eTHW1eHuAZOhbul05mXdSebPcnK+mArPNZMO/KNt2AfQKdYz8nzXq2ufE+cq2QevFi
         5Kl44uya4c/64VLdCvk3icNjaf2XhZXORdRfUjkYoy8vhzw0nILahQzCxI0DQ89m7Lq4
         QOJLt9WZwiVWr1bqgBVLdh9NfwmMUzJKOl7OI=
In-Reply-To: <4BB4737E.7000602@pandora.be>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Thanks Bart and Jan.

Bart , my boss says I will have to forgo my salary  if we have to get
it done from someone else.
Let me keep my salary .



On Thu, Apr 1, 2010 at 3:50 PM, Bart De Schuymer <bdschuym@pandora.be> =
wrote:
> agashi shipora wrote:
>> Hi ,
>>
>> The customizations in the linux kernel are provided as binary
>> modules(libraries) hence making CONFIG_BRIDGE_NETFILTER work is been
>> ruled out. =A0Thats why I am looking for L7 filter support directly =
by
>> ebtables.
>>
>>
> What you're asking for isn't going to be included in the standard Lin=
ux
> distribution. So you'll either have to make the modifications yoursel=
f
> or pay someone else to do them for you. Feel free to contact me if th=
e
> latter case applies.
>
> cheers,
> Bart
>
> --
> Bart De Schuymer
> www.artinalgorithms.be
>
>
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
