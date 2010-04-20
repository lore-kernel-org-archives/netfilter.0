From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: removing black listed ip
Date: Tue, 20 Apr 2010 16:51:33 +0530
Message-ID: <m2ncfeab66d1004200421ma6446c06te3c2fb46c5a5ce39@mail.gmail.com>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
	 <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>
	 <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>
	 <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr>
	 <n2jcfeab66d1004112324t35d8d49cx7eebfcfe88b4f461@mail.gmail.com>
	 <alpine.LSU.2.01.1004121427530.30496@obet.zrqbmnf.qr>
	 <m2qcfeab66d1004191946g1a566eb8k7886cd56b6aa968c@mail.gmail.com>
	 <alpine.LSU.2.01.1004201004370.21452@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=FSIGZeLPEDiucdHAoPhL+hIxEd72VrxmhY9Z1uV/TVU=;
        b=G5N7TWLHAXCOhfgYf/gYQb4hoEW45+anHVjCts6jJGgH20BCkNA/pT9JSlk+x0kshP
         277r7m5CzVteQNnvx2wQ9Hye4dByexSux9i7rDiJ+Bq8qiy8PTeQ3c34YoUPbHX7/Ixs
         1xuWhZewhL3XhpIk6K5FRhoBuTkGq3lXStx8A=
In-Reply-To: <alpine.LSU.2.01.1004201004370.21452@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Tue, Apr 20, 2010 at 1:36 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Tuesday 2010-04-20 04:46, ratheesh k wrote:
>>>>
>>>>if =A0number of ip balcklisted ip is more than =A0ip_list_tot , old
>>>>entries will be replaced by new ip addresses ? . { once list if ful=
l ,
>>>>what will happen for new black listing }
>>>
>>> As I see it yes.
>>
>>suppose one particular ip is blacklisted by accident ...I want to
>>remove the ip from black list . How can i do that ?
>
> How do you define accident?
>
> Manually:
> =A0"echo -2a01:198:476::1" >/proc/net/xt_recent/foo
>
> Automatically:
> =A0If you can automatically detect an accident, you can also
> =A0have it removed with -m recent --remove. Or in fact,
> =A0avoid it in the first place.
>

Thanks a ton .
