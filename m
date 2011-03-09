From: Pandu Poluan <pandu@poluan.info>
Subject: Re: How to completely disable conntrack?
Date: Wed, 9 Mar 2011 21:24:38 +0700
Message-ID: <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com>
References: <4D7785DC.8050904@centrum.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D7785DC.8050904@centrum.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?UGV0ciDFoMWlYXN0bsO9?= <petr.stastny@centrum.cz>, netfilter@vger.kernel.org

I'm sure there's a sysctl knob, but off the top of my head:

-t raw -A PREROUTING -j NOTRACK

Rgds,


On 2011-03-09, Petr =C5=A0=C5=A5astn=C3=BD <petr.stastny@centrum.cz> wr=
ote:
> I'm using Fedora 14, which has conntrack compiled into the kernel. It=
 is
> not a module, so I'm not able to unload it to disable connection
> tracking. Is it possible to do it in another way without building my =
own
> kernel?
>
> Thanks
>
> Petr Stastny
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
