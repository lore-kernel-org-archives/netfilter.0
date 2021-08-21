From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Sat, 21 Aug 2021 18:21:34 +0200
Message-ID: <CAMEa=f=F-eNh1MwsxF2ynFYSEAZ6Z1yRX-oNzpZSZrdLcREsDg@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia> <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia> <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
 <20210819101628.GA2036@salvia> <CAMEa=f=Or70aNKCiw6=SRG0wQxbdG51HhP6jBZsbKhUcTqaNqA@mail.gmail.com>
 <20210819170330.GA7011@salvia> <CAMEa=f=wHTwJX6CjgOROcStTgDo-TdU6jb2xtpmNi=coHuPboA@mail.gmail.com>
 <CAMEa=f=ooH=KVS753j7ByYGgG0HB=f_fGY6Q57aCO-vMAPY4vw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kWSLEfmOuYOpuAdakVlSeH76cN/ZxpD5Yrna4GIEXQ0=;
        b=nsfb02J9WE9ATEceyrPej1Oruwm3NUk/sfQYTaBwJEhDHD5QDCKSW2CG/WyQv/BoNK
         cc4l+FB72UGdQK05y7hAKBE2RcEiYfnAM+4P7H8g24cF/Xyxn2SRvYyRFBUzJ0uxymnG
         SPO7i082cegXjsz5Tr9chFZO7pHIHpRuPDrU10tKz45yKXHHZ8rJmao3ZZdNxtW+6b5n
         PnoNtBArkOGcex9fbO0l9P6TAdZ1oI/851CFC+zV/aIx+8Fp0UDKEwNmKcCKyqSq7kqm
         MhxT11ZzlgSGnUO6EdwmISn3BkGu+XxRdOOdX4/kq70Ad5xt28pAfTctagXFb2HGXZ/R
         hbVw==
In-Reply-To: <CAMEa=f=ooH=KVS753j7ByYGgG0HB=f_fGY6Q57aCO-vMAPY4vw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

so 21. 8. 2021 o 15:03 Bla=C5=BEej Kraj=C5=88=C3=A1k <blazej.krajnak@gmail.=
com> nap=C3=ADsal(a):
> I just found an another strange behaviour of conntrack. I'm mirroring
> port on switch and mirrored data are coming to Linux server. That port
> on server is in bridge. In nftables I created table bridge filter with
> some CT rule to enable connection tracking on bridge.
> As I found I had to add another dummy interface to bridge, because
> conntrack was not working at all, if just one port in bridge.
> Now I see conntrack entries but all of them as UNREPLIED and just one
> way byte/packet counters are increasing (see attachment). Is it
> because the both ways are coming to server on the same port? Any easy
> workaround?

I just figure it out. Switch was sending one way of traffic tagged
with vlan. And also I had to turn off bridge MAC addresses learning
(a.k.a ageing to 0). Now it works.
