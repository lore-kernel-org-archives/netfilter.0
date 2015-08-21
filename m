From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: ipset v6.25.1 does not recognize 'counters' as option
Date: Fri, 21 Aug 2015 12:22:50 +0300
Message-ID: <CAEzD07KL6CaBq8dHsPVLQH-R=Em76iiS=ErNOXFsVMd4Gygsfw@mail.gmail.com>
References: <CAFUsPDZw6uGSsNvoZN3TKm=NHdUJTQ79QakYvxP1OyHMzZDzmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=eLEfAn/aayL+Hz5Z0csshb8URDZrSnLdMUybAYfEkRo=;
        b=mSVgSuNd+zvSjxRbu/hBMA6DtZeVWIEg3hgynXuVaSMEn1lZOi22Y43BfO9MJwBfbG
         5dRZ+/WsSxOZQGSc9iHAufCf761gfdVmDRjT27O39PpcXtgUI5wTxAWZnZYA5ebIDW90
         57tO63QsTs2aLXGmMJSRltTJedv0Dl1nmJQedMjADDSdSL5qpp2NjN6zwiyB3BHqrpMh
         IiLfBwWZqhHtYV2DJS+9JIWgmTSxkR9qd3QJxlbrA9JP07jV8y5dPz7bLFoN2+vzyG4K
         nk629OT5Bk0t5iYHm7a3NE4K/jbqtNtBsFmSglEMdov92SXYaN0havBr6Bldf9eljLbD
         tTxw==
In-Reply-To: <CAFUsPDZw6uGSsNvoZN3TKm=NHdUJTQ79QakYvxP1OyHMzZDzmQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soroosh Sardari <soroosh.sardari@gmail.com>
Cc: netfilter@vger.kernel.org

Hello.
You should be sure of using of right version kernel modules.
Check output of 'ipset help'. May be you still using of old version
kernel modules.

2015-08-21 11:08 GMT+03:00 Soroosh Sardari <soroosh.sardari@gmail.com>:
> Hi
>
> I'm using ipset v6.25.1 in ubuntu 12.04
>
> uname -a
> Linux soroosh 3.2.0-72-generic-pae #107-Ubuntu SMP Thu Nov 6 14:44:10
> UTC 2014 i686 i686 i386 GNU/Linux
>
> ipset -V
> ipset v6.25.1, protocol version: 6
>
> I compiled the ipset source code as following:
> ./autogen.sh
> ./configure
> make
> make modules
> make install
> make modules_install
>
> Unfortunately i get this error:
> ipset create foo hash:ip timeout 0 counters
> ipset v6.25.1: Unknown argument: `counters'
> Try `ipset help' for more information.
>
> Any help appreciated
>
> Regards,
> Soroosh Sardari
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
