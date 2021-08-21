From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Sat, 21 Aug 2021 15:03:10 +0200
Message-ID: <CAMEa=f=ooH=KVS753j7ByYGgG0HB=f_fGY6Q57aCO-vMAPY4vw@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia> <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia> <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
 <20210819101628.GA2036@salvia> <CAMEa=f=Or70aNKCiw6=SRG0wQxbdG51HhP6jBZsbKhUcTqaNqA@mail.gmail.com>
 <20210819170330.GA7011@salvia> <CAMEa=f=wHTwJX6CjgOROcStTgDo-TdU6jb2xtpmNi=coHuPboA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gwsH9ikGyVN3OFhBXmOcC+TpbY01uPZ8Bi/yTmf9GgY=;
        b=eCmXlec1M2Ig3SQ32TZavViQm5Rj1Y6YjaVRmhxTPh/YilNOe+qVGqJFb851SZp0z1
         2qwvO+4IR0FSX3M0z44zg/cyewimYevoJvnKoKg4Azr9k4CS3/4k4DAC2e9g698MxAKB
         rQ10CLY6WXwmfR53H/Nl3oIOUIDGQSmbNft0WMqalhmDBHxsjlqec2SAE/jSx/fTGi0p
         27ajZyH3BJzJE1xIzSv8JpfULDp0CiHWfSfeX6/IH+mpH73QXOyf8h91nY/yEkz6kWga
         d2QXdFB6+M0auxlk4XJDII1X+CLKuv1lWWVL83WxvtdeAPio/bupDJ37iQwQwnlgl9+/
         2YjQ==
In-Reply-To: <CAMEa=f=wHTwJX6CjgOROcStTgDo-TdU6jb2xtpmNi=coHuPboA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

I'm not sure if previous message was delivered to the list members (I
don't see it on web archive).
So once again:

=C5=A1t 19. 8. 2021 o 19:03 Pablo Neira Ayuso <pablo@netfilter.org> nap=C3=
=ADsal(a):
>
> Better if you integrate it into the existing plugin.
>
> Please, go ahead post it for review, it might just need a few
> iterations before it gets merged into master.
>
> Thanks.

Okay, I will prepare my first ever patch to open source world :)

I just found an another strange behaviour of conntrack. I'm mirroring
port on switch and mirrored data are coming to Linux server. That port
on server is in bridge. In nftables I created table bridge filter with
some CT rule to enable connection tracking on bridge.
As I found I had to add another dummy interface to bridge, because
conntrack was not working at all, if just one port in bridge.
Now I see conntrack entries but all of them as UNREPLIED and just one
way byte/packet counters are increasing (see attachment). Is it
because the both ways are coming to server on the same port? Any easy
workaround?

https://drive.google.com/file/d/1-aIXA13IicHcKHIaxkC1Hz2tRckU3YDm/view?usp=
=3Dsharing
