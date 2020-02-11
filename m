From: =?UTF-8?B?7JaR7Jyg7ISd?= <ileixe@gmail.com>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Tue, 11 Feb 2020 21:07:49 +0900
Message-ID: <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
 <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ECePHKohEqDyHSfOH7umTGEVd4ldTTB461lWx6/7GvM=;
        b=Ym38Yn9SafpMTB/WcMWA0oCMiQAbBHVkaLpEs71WIns/+cHNrV0gW4qHgNC4tlhvbw
         j+MjDSNBvCFxeDsysK9MgAu9Zq6oe4hohGVT5KPgh2vJXvGx4hJ8dzN1UHiwsymKIsuk
         AkQm4THVrxkw3/6bE5oTaevBvDBdyJqteN4eYoxNO6V1LEmt+t02PEgqOVWv5xrapzEt
         aT9pai/IAuD6qs6zEKdpd/js7jOXN/2dkjeRL4Isomz8KyI3S8xbJZovrLUOwUlERltf
         DA7Ksjw8SdcuhMCqgjYVjKhVMLaUajLum5zSYNU4enLtlzSl59wez11b5oukVY+jq5++
         D+iw==
In-Reply-To: <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <ged@jubileegroup.co.uk>, netfilter@vger.kernel.org

Haywood,

Do you mean the remote logging like rsyslog? We did not try since
syslog does not emit at all. Is it worth to try though?

Anyway thanks for the advice, I will try to do anything to fix it.

2020=EB=85=84 2=EC=9B=94 11=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:03, G=
.W. Haywood <ged@jubileegroup.co.uk>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi there,
>
> On Tue, 11 Feb 2020, =EC=96=91=EC=9C=A0=EC=84=9D wrote:
>
> > From today, we even does not know what makes crush since there was no
> > any log (literally kernel, application or something) Only that we
> > encounter is when linux bridge agent in openstack restarted, server
> > reboot without any log. After reboot, we see strange null string (@)
> > in syslog. ...
>
> I cannot help you with the kernel crash but I suggest that you try
> remote logging to another server, it might help provide more log info.
>
> --
>
> 73,
> Ged.
