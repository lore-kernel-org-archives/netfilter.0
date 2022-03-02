From: Jarno Pelkonen <jarno.pelkonen@gmail.com>
Subject: Re: nftables + docker
Date: Wed, 2 Mar 2022 20:44:41 +0200
Message-ID: <CAKv8qLmc=2tvhoSVYNZrVyuZ3SgcRDmgYtoQzE-+3DE_=nb=ag@mail.gmail.com>
References: <CAOBAZ9COSZ6WcjGoQFNWhUPZsyefd49uWrgiVkeMjnHLsr8yKA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qtB8K/DxCvSfV5TWjnqc7hCfiGWqljFh7DiZticd1zw=;
        b=Vun8R3LvWgSqkxMy6qJNjjjhDdIv3VR5tbjJQpnnhyBE37F1NuKI1UkzvJZ7B1m7YD
         StsnEn4Hz9jHY7xJ/lKhfeynkKe+QDvvhzDmf94f7mH2NbPXnf+U2+lazsvBmmn24vNl
         VWSGXFVG+iNZcixYBNCmJmkTaNB08lkG1uEU8Fowrp7n/AyEn2x3XBwqC2nN6UlY4l8M
         FwtIMYFzy1WBccjEsn9E9KxcPG07GLpwM465vAObj1nz7xQv6o25xm8uEvh+1Mh9b5RW
         tR7ICllGALIL26Kk0eTBoY8NGi9nFTD8csMuc7to+bzlhzlgHItEWmE8En0W05N+8RJw
         DMyQ==
In-Reply-To: <CAOBAZ9COSZ6WcjGoQFNWhUPZsyefd49uWrgiVkeMjnHLsr8yKA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matthew Ellquist <mellqui@d.umn.edu>
Cc: NFTables Mailing List <netfilter@vger.kernel.org>

Hi,

Restarting nftables.service completely flushes the nftables so
docker=E2=80=99s rules go with it. See the nftables.service unit contents.

If you are using systemd you can use =E2=80=9CPartOf=E2=80=9D directive to =
have
systemd take care of restarting services.

Alternative option is to customize nftables.service to not to
completely flush the tables, but remove everything else but docker
rules and its entry point.

Cheers,

Jarno


On Wed, Mar 2, 2022 at 12:45 PM Matthew Ellquist <mellqui@d.umn.edu> wrote:
>
> Greetings,
>
> I'm very new to nftables and thought I'd throw this question out there
> while I researched it.
>
> Is there a way to not have to restart the docker.server to rebuild the
> nftables rules, after restarting the nftables service?
>
> Thanks,
> Matt
