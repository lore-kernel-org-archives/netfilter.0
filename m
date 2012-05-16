From: Wentao Shang <wentaoshang@gmail.com>
Subject: Re: Need info about how to run nfqnl_test.c !!
Date: Wed, 16 May 2012 18:32:54 +0800
Message-ID: <CAD4s1gSURy1dTTNZGOjhzOQ+tAWsSWYyM_D-EJ2zu1SuTdBFiA@mail.gmail.com>
References: <CAJRDWV6NkPdRVZo5LTSaMbR+_s+b+JnnVZLJ+SELrL=hVhJNQg@mail.gmail.com>
	<CAD4s1gRLFdhpchTez08n_Xjq1kYZ_-A=Y9USbK=eF4N7g-ES+A@mail.gmail.com>
	<CAJRDWV5Ki6iU-BhW6-YPazH3hG6KTvpmDYK-3pBMku6UDRpMtw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=htHdRQtQBtUnEMUiyYWjXNYK1gTrf6WL/BDhCcyNAN4=;
        b=ednT+Nvg0ibRwHm/qJow9vo3OYEbfHGDUEUFam7mUoNev0zHXsLeXYHB0tssjiPKKu
         zctOsvbGvXWGzt5cxzxrNAtItGuKbAK/etZEILkha65oBnoFgrtry3dhP3yEU63A9ns8
         9CxiqiN1K7vHuijvxc5mehCc19zt2qZRYQWm4b/Idp86w2k2DxBTWy0TeGiA+S7BM19l
         LDfgdbcRXrV9laaoTjIQ1wl204BDAZOtW3LOM58nEUWXO0LXmKd6GEXRNq2IjOxNFDVJ
         GNYpNb4h61i2BgGL7QEZYz5oi8VN0e1Jc7VHb1wOhbow3wCeyoGctGEto2gNEqTeZt7q
         qIMw==
In-Reply-To: <CAJRDWV5Ki6iU-BhW6-YPazH3hG6KTvpmDYK-3pBMku6UDRpMtw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Sudheer <sudheer.d@oneconvergence.com>
Cc: netfilter@vger.kernel.org

You may call nfq_create_queue() several times and specify each queue
with different number (the 2nd param in the function) and different
callback routine. However, I'm not sure how the incoming packets are
delivered to different queues. Maybe you should use select() or poll()
here.

Wentao

2012/5/16 Sudheer <sudheer.d@oneconvergence.com>:
> Thanks Wentao for your reply.
>
> =C2=A0I wanna use 3 queues for the same application. is it possible t=
o
> create 3 queues in same application and use to queue the packets into
> each queue ?
>
>
>
> On Wed, May 16, 2012 at 12:36 PM, Wentao Shang <wentaoshang@gmail.com=
> wrote:
>> Simply compile it and run it. Then it will start printing informatio=
n
>> about the IPv4 packets received on your machine:)
>>
>> Wentao
>>
>> 2012/5/16 Sudheer <sudheer.d@oneconvergence.com>:
>>> Hi ,
>>>
>>> =C2=A0 =C2=A0I am new to the concept of netfilters so i have downlo=
aded the
>>> "nfqnl_test.c" =C2=A0from the website and compiled it. Could you pl=
ease let
>>> me know how to run this code and check the output. =C2=A0Do we need=
 to
>>> execute any others commands before running this code ??
>>>
>>> =C2=A0It will be very useful for me if you let me know the procedur=
e to
>>> use the "nfqnl_test.c" code.
>>>
>>> --
>>> Best Regards,
>>> Sudheer
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.=
html
>>
>>
>>
>> --
>> Wentao Shang
>>
>> Master Candidate and Research Assistant at CERNET Center & NGN Lab, =
EE
>> Department, Tsinghua University
>
>
>
> --
> Best Regards,
> Sudheer



--=20
Wentao Shang

Master Candidate and Research Assistant at CERNET Center & NGN Lab, EE
Department, Tsinghua University
