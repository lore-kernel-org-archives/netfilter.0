From: Tushar Shinde <mtk.tushar@gmail.com>
Subject: Re: nftables: How to stop further chain traversal after accept verdict
Date: Wed, 7 Jun 2023 16:45:34 +0530
Message-ID: <CABQpAL50eaRfRsdNON3r3hNqEafJE7KdRYC8z3YM4LPu7NHc2g@mail.gmail.com>
References: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
 <4e78b0e0-0e40-4b6e-b886-168f3b64d30e@at.encryp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686136546; x=1688728546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaxeTObz9jT9aiXen0VxiatD+dij2BlKFxXq2txvIRk=;
        b=XpRlu5r6QZm+c0xFhJTI/OMoUZ1s+0gdBXy3MeGRu+ZyKu6n+gOFAMYgFYeCilqD4I
         K1sBC1OSYzeQqiZUaKFEo3b7hXHZkE2HiT+5FL2/6VQ/szz4an2RB+s81ZYesqi1443x
         lIGtWa9FYDmFX+DU2XziIxDfpccTEEdjWUuPrGAs701iTwmO91a4y+Pt5vv4WVCpNyxT
         GNCNwDSAppi+EdmTb+6pA6G+nBjgHE0CnRWetOe04JUTUvSQjolci3XfASCOY2MRxc9X
         N8DMinhndmZC4hz+wqYcwt1G7w1iEdKOgFZdMeRguqBSXMc1jJ+ZWboizZOzJK7wj0l9
         3/kg==
In-Reply-To: <4e78b0e0-0e40-4b6e-b886-168f3b64d30e@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: seentr@at.encryp.ch
Cc: netfilter@vger.kernel.org

What is use of table chains if they are not decision makers in accept case?
We mostly know what to accept and deny everything else. Is this cannot
be done with nftables?

On Tue, Jun 6, 2023 at 9:29=E2=80=AFPM <seentr@at.encryp.ch> wrote:
>
> You can try to set mark as well as accept them. This way you will be able=
 to determine in the following chains that some of previous ones had accept=
ed it.
>
> 2023-06-06T15:40:03Z Tushar Shinde <mtk.tushar@gmail.com>:
>
> > Hi,
> >
> > I have asked the same question to super users. But I looks like I need
> > help from experts.
> >
> > https://superuser.com/questions/1787416/nftables-how-to-stop-further-ch=
ain-traversal-after-accept-verdict
> >
> > Question is, If there are multiple tables (possibly owned by multiple
> > teams/projects ), if a rule is accepted by one of the tables in the
> > chain, how to stop looking into the next high priority chain. Right
> > now my observation is ACCEPT just stops processing the current chain
> > and jump to next table. If this is last table then only ACCEPT will
> > work, otherwise this ACCEPT is useless.
> > Logs are on SU post.
> >
> > Kindly correct me if I am wrong.
> >
> > Thank you,
> > Tushar.
