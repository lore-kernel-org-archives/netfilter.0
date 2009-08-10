From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: libnetfilter_queue ---- set_mode function not returning .
Date: Mon, 10 Aug 2009 16:27:57 +0530
Message-ID: <cfeab66d0908100357v1b3e6718l3299a390982ac8ca@mail.gmail.com>
References: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
	 <1249899383.7133.13.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3wFDg8Ujpp7xGm32F8NGvl9hjJbnC8CWTeLn85esAvE=;
        b=jewjXSFyQ+6iEL+IvmuRyWZgl0lf8BMEkXoYvyOr7XUY05z8v8SZDagjIk+Z9Fx4J0
         pHY+a+vsbKA2bWZkgW+9Jl2nnuS3IzdGbluZf6RVNBhOgyN1dVe6RsLiibOGr0C1g+BP
         75D4j8lm3maU0/EektBQzrRZb8JPxpCcS/g8g=
In-Reply-To: <1249899383.7133.13.camel@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

Eric ,

  I am running this program on 2.6.25 kernel on qemu emulation . But
if i run this on my     fedora linux desktop computer , i am not
facing this problem .

 I dont know  whether call is reaching till sendmsg of netlink socket
in af_netlink.c ??? is there any other tool or s/w to test netlink
socket is working fine ???


i already posted a program ( this i got from internet ) to check
nwtlink socket is working fine .
http://marc.info/?l=3Dnetfilter&m=3D124937098723617&w=3D2
but this program is not working on my fedora 9 linux desktop also .....=
=2E


I am totally lost ... can u pls guide a little ??


Thanks,
Ratheesh













2009/8/10 Eric Leblond <eric@inl.fr>:
> Hi,
>
> Le lundi 10 ao=FBt 2009 =E0 13:56 +0530, ratheesh k a =E9crit :
>> Hi ,
>>
>> =A0I have following code
>>
>>
>> nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff);
>> printf ("RAT");
>
> I've nevr encounter such a problem.
>
> Could you post a more complete code sample. (One that could be compil=
ed
> separately could be great).
>
> BR,
> --
> =C9ric Leblond <eric@inl.fr>
> EdenWall, http://www.edenwall.com/
> NuFW, http://www.nufw.org
>
