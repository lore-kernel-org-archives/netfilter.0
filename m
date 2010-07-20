From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: question about esp and policy matching rule
Date: Tue, 20 Jul 2010 22:26:38 +0530
Message-ID: <AANLkTimkhSedZPQcdaGeNfNTBkm9lJkGkau_4j72VCMo@mail.gmail.com>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>
	<i21c1p$cl6$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=DjRNzD+rUjedpbCeTbtKVtLNeG0EPg1hPt41wDdG5jE=;
        b=dASmO2f9MIJzRgJ4Vb5962bojmWdSdHJHQYytfv954nsaIznefV38vBYlPWeWmYudQ
         e//ra+3RxtXxcHuZIXer9utu9onvTVhH5+2WlYiFIYYZtdqFL3gd4StnDwTU5keA5eCJ
         MdWHzkYjpj9YrwIcALplYxqK6mSKeqiwgNkzI=
In-Reply-To: <i21c1p$cl6$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sergei Zhirikov <sfzhi@yahoo.com>
Cc: netfilter@vger.kernel.org

On Mon, Jul 19, 2010 at 4:44 PM, Sergei Zhirikov <sfzhi@yahoo.com> wrot=
e:
> On 2010-07-19 05:29, Richard Knight wrote:
>>
>> Hello,
>>
>> =A0I don't fully understand the two rules below.
>>
>> Since each of the rules are get inserted at position 1 in the table =
the
>> ESP
>> rule ends up below the policy matching rule, will the ESP rule ever =
be
>> checked?
>>
>> # allow all ipsec traffic into and out
>> $IP6_TABLES -I INPUT =A01 -i $EXIF -p esp -j ACCEPT
>> $IP6_TABLES -I OUTPUT 1 -o $EXIF -p esp -j ACCEPT
>> $IP6_TABLES -I INPUT =A01 -i $EXIF -m policy --dir in =A0--pol ipsec=
 =A0-j
>> ACCEPT
>> $IP6_TABLES -I OUTPUT 1 -o $EXIF -m policy --dir out --pol ipsec =A0=
-j
>> ACCEPT
>>
>> I have an application which does not seem to operate through my ipse=
c
>> tunnel without both rules in place, I'm having trouble figuring out =
why.
>>
>
> The order of those rules does not matter. They have different purpose=
 and
> match different packets.
>
> With IPSec involved packets pass netfilter twice. For example, if you=
 have
> an incoming ESP packet
> that contains an UDP packet as payload the following happens.
>
> 1. The ESP packet passes netfilter and matches the line with "-I INPU=
T -p
> esp"
> 2. The packet is decrypted and its payload (the UDP packet in this ex=
ample)
> is processed further
> 3. The UDP packet passes netfilter and matches the line with "-I INPU=
T -m
> policy ...".
>
> In other words, "-m policy" applies to packets after IPSec decapsulat=
ion (or
> before encapsulation, for outgoing packets).
>
> --
> Sergei.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

After decapsulation , will the ip packet will traverse prerouting chain=
 again ?

-Ratheesh
