From: =?UTF-8?B?7JaR7Jyg7ISd?= <ileixe@gmail.com>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Wed, 12 Feb 2020 11:37:53 +0900
Message-ID: <CAFAx9aZ7awXivUDp9-czFkKNA=p0HMKAPOmV5Dt8izzncmrK2g@mail.gmail.com>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
 <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
 <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
 <alpine.DEB.2.20.2002111243370.6759@tornado.local.jubileegroup.co.uk>
 <CAFAx9abww8D7y59DU+JrHjswGGMVW1cUEVLgPPu2-gN8M_2Tjw@mail.gmail.com> <alpine.DEB.2.20.2002111414330.6759@tornado.local.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DhEiJ/8Ei8G5aM1Z6PeKIG35lfGoWGtkdMnfbWFgvPo=;
        b=QpQoGmmTvdC1FMKCrmU/yx9gpouZ/BOV8w+2bQB6Oh8FeTgYvQtknmCyuaa1wwtrdi
         0t+EW4Kf0sCxMCttcJUOKZoMGLZTbYC1gzgg76uVEkubg0AA9GhdLIZnzlzKuZsyy1Rk
         lGp1qjZjuUAKnhnX14P0S9F5V6CFSlqi2vJ4hNa4ys7EqcrCT2PJXSOXBIXB1fog9gAJ
         4kIU/8GV9S0rX7053xLIu33j3q6Xh/SmzQ14qF7MCdYF66vA3RhsxAOyPbEar0H6x1H9
         ubtohVVf8bb7YBEtDRX+CRNkw8aP1gDO1WvOI8e5ztW4Xus++8bUDFkM54YAJ908Pxsb
         YEUw==
In-Reply-To: <alpine.DEB.2.20.2002111414330.6759@tornado.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: netfilter@vger.kernel.org

I wish I can check rsyslog first. It do have the last command (etables
--concurrent -t nat -L). But unfortunately, there is no more command.
I will try to use netconsole which seems to log for kernel.

2020=EB=85=84 2=EC=9B=94 11=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:15, =
G.W. Haywood <ged@jubileegroup.co.uk>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi there,
>
> On Tue, 11 Feb 2020, =EC=96=91=EC=9C=A0=EC=84=9D wrote:
>
> > 2020=EB=85=84 2=EC=9B=94 11=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:4=
7, G.W. Haywood ...
> >> ... Mr. Millar's suggestion is good too.
> >
> > ... where is Mr.Millar's suggestion? ...
>
> https://marc.info/?l=3Dnetfilter&m=3D158142378531784&w=3D2
>
> --
>
> 73,
> Ged.
