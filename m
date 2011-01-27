From: E2IA <e2ia.ci@gmail.com>
Subject: Re: xt_ACCOUNT define many network by table
Date: Thu, 27 Jan 2011 23:32:11 +0000
Message-ID: <AANLkTimAZcW4e-VJ=6K+SSkBShEe4n0kkxco5inJS6tq@mail.gmail.com>
References: <AANLkTik+=rifOKRpurA3da=OMe-Jp96Y=YMRC1itgmQ4@mail.gmail.com>
	<1296153825.2064.4727.camel@laplaplian>
	<AANLkTinYhMmnOJ1Kq9BBFcQfOB5p1kkmGXD=BvNf+2i1@mail.gmail.com>
	<alpine.LNX.2.01.1101272321210.26553@obet.zrqbmnf.qr>
	<alpine.LNX.2.01.1101272324020.6686@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=19tzTTAcdc/F2UfO7FH793Or1rchjCrepuRzMZAo6FI=;
        b=tgockGVBd2GoNPpx+RfmjDjWO0SEUmsX8hvEqQnNHH3bRIkzTFMxDm9+CyURQTwzvK
         ZEvryyRkSs+dXMv6y8yuE1YqNoRHzgq/+Wsy9NzsbYdfFLbhXIARB0NYy6uwSAhfU+CC
         dpvNTeW5MDUBp2aDf6YIktkpwAljBdgixJbuk=
In-Reply-To: <alpine.LNX.2.01.1101272324020.6686@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Right I'm about to make one table per subnet.
And I'd like to know if there is a limitation for table number.
regards.

2011/1/27 Jan Engelhardt <jengelh@medozas.de>:
> On Thursday 2011-01-27 23:23, Jan Engelhardt wrote:
>
>>On Thursday 2011-01-27 23:13, E2IA wrote:
>>
>>>Thank very much but it doesn't work because the 128.0.0.0/8 doesn't
>>>pass through my box.
>>
>>Networks don't pass. Packets do. And from the looks of it, of course
>>you _will_ get packets from 128.0.0.0/8.
>>
>>Simply because 192.168.2.0/24 and 172.16.2.0/24 is included in
>>128.0.0.0/8.
>
>
> Er, not for 128.0.0.0/8. =C2=A0That should have been 128.0.0.0/1.
>
>
>>>>> rule 1: =C2=A0iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTIN=
G =C2=A0 -m mark --mark =C2=A0123
>>>>> -j ACCOUNT --addr =C2=A0192.168.2.0/24 =C2=A0--tname http
>>>>> rule 2: =C2=A0iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTIN=
G =C2=A0 -m mark --mark =C2=A0123
>>>>> -j ACCOUNT --addr =C2=A0172.16.2.0/24 =C2=A0 =C2=A0--tname http
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
