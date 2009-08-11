From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: libnetfilter_queue ---- set_mode function not returning .
Date: Tue, 11 Aug 2009 12:17:36 +0530
Message-ID: <cfeab66d0908102347y137ab1f7offd72705bf0219cd@mail.gmail.com>
References: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
	 <1249899383.7133.13.camel@khasse.inl.fr>
	 <cfeab66d0908100357v1b3e6718l3299a390982ac8ca@mail.gmail.com>
	 <1249941368.17184.17.camel@ice-age>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3+yWc3GaiO78i289p4O6hYDHZURuPLjxhLGeLoGVLiY=;
        b=M+f5g2YtOLaKI1axqJWY+5ElSX+VrvWMNCFTB5cC2+RWNtV1ehzNE0mBDqALucIfph
         M9o3SEAGCvb/vmkdHbfkokG/x7qrwNVhOduGapBCPch+pXAQ1ExAI1E+CODdwH+OuwMp
         BYZ/5lWqSB+Xx1p8YFgVaSE9xIw6PlVeJAQOM=
In-Reply-To: <1249941368.17184.17.camel@ice-age>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

> Your code (after some minor unrelated fix, like cb missing in what yo=
u
> send) is correct. It is working correctly on my computer. Further mor=
e,
> the logic is the same as the one used in NuFW which is know to work f=
ine
> in most (if not all) setup.

can u send me the working program (after fix u done ) .

> By the way what happen if you only try to get the first bytes :
>
>        if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xff) < 0) {
>
>

i will try this . and get back to u ... ..
do u want me to try
   NFQNL_COPY_META,
   NFQNL_COPY_PACKET,
these also ???


Thanks,
ratheesh.

2009/8/11 Eric Leblond <eric@inl.fr>:
> Hi,
>
> Le lundi 10 ao=FBt 2009 =E0 16:27 +0530, ratheesh k a =E9crit :
>> Eric ,
>>
>> =A0 I am running this program on 2.6.25 kernel on qemu emulation . B=
ut
>> if i run this on my =A0 =A0 fedora linux desktop computer , i am not
>> facing this problem .
>>
>> =A0I dont know =A0whether call is reaching till sendmsg of netlink s=
ocket
>> in af_netlink.c ??? is there any other tool or s/w to test netlink
>> socket is working fine ???
>
> You could give a try to conntrack-tools (conntrack binary in
> particular). They also use libnfnetlink.
>
> By the way what happen if you only try to get the first bytes :
>
> =A0 =A0 =A0 =A0if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xff) < 0) {
>
>
>> i already posted a program ( this i got from internet ) to check
>> nwtlink socket is working fine .
>> http://marc.info/?l=3Dnetfilter&m=3D124937098723617&w=3D2
>> but this program is not working on my fedora 9 linux desktop also ..=
=2E...
>
> Your code (after some minor unrelated fix, like cb missing in what yo=
u
> send) is correct. It is working correctly on my computer. Further mor=
e,
> the logic is the same as the one used in NuFW which is know to work f=
ine
> in most (if not all) setup.
>
> BR,
> --
> Eric Leblond <eric@inl.fr>
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>
