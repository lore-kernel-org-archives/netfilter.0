From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Thu, 19 Aug 2021 16:05:41 +0200
Message-ID: <CAMEa=f=Or70aNKCiw6=SRG0wQxbdG51HhP6jBZsbKhUcTqaNqA@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia> <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia> <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
 <20210819101628.GA2036@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uwDTjcW9FlvxIBu8D0fz0ZXg1EHX30k44/lFcrJ3m3c=;
        b=ZkaIaMp9krv3dukFRVOJNqc6yTQMci9b5w8OFbKg9pab/DXIGCyqjwesFpAyRxVgrN
         ceJiGTPP91K7CUCQeXIGX6ey6VxAwoPkrPV70i7jH+73cRpT3A4BrkUsSzNHpK98uEoH
         uaY3KrjXCVn9+1vaBG4xY86ZRjqazT+F1+5ewV/7e+c+E41LIKUshYIQHsfOhMbwkdu4
         gPgNlL4S3AGmijITO1nFV1CqTUmACihtcT/2NeifRZRSFfiJ5/Z71JQguIkKtOiqmPnJ
         ls0uoVdGdXa+I8jkaibtxdk2MHBBq1UNb+/olpzWISxesd1WD9MVvTntDbsf9u60ng/b
         Hspg==
In-Reply-To: <20210819101628.GA2036@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

=C5=A1t 19. 8. 2021 o 12:16 Pablo Neira Ayuso <pablo@netfilter.org> nap=C3=
=ADsal(a):
>
> Better to stick to use nflog_nlmsg_parser(), my suggestion is:
>
> #1 msg_cb() provides struct nfgenmsg *nfmsg, you could retrieve the nlmsg
>    from there since the nlmsghdr comes before nfgenmsg:
>
>         struct nlmsghdr *nlh;
>
>         nlh =3D (struct nlmsghdr *)((void *)nfg - sizeof(*nlh));
>
>         err =3D nflog_nlmsg_parse(nlh, attrs);
>         if (err < 0)
>                 ... error path
>
> #2 once you have access to attrs[NFULA_CT], from there on:
>
>         struct nf_conntrack *ct;
>
>         ct =3D nfct_new();
>         if (!ct)
>                 ... error path
>
>         err =3D nfct_nlmsg_parse(nlh, ct);
>         if (err < 0)
>                 ... error path
>
> Then, you get the pointer to conntrack object.

Great, your suggestions perfectly work. Thank you.
Little later I will post complete code to everyone.

Could it be useful to prepare patch to add this to ulogd2? As new
input plugin or as a upgrade to inppkt_UFLOG?
