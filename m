From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulogd packet based logging with CT info
Date: Thu, 19 Aug 2021 19:03:30 +0200
Message-ID: <20210819170330.GA7011@salvia>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia>
 <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia>
 <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia>
 <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
 <20210819101628.GA2036@salvia>
 <CAMEa=f=Or70aNKCiw6=SRG0wQxbdG51HhP6jBZsbKhUcTqaNqA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMEa=f=Or70aNKCiw6=SRG0wQxbdG51HhP6jBZsbKhUcTqaNqA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Aug 19, 2021 at 04:05:41PM +0200, Blažej Krajňák wrote:
> št 19. 8. 2021 o 12:16 Pablo Neira Ayuso <pablo@netfilter.org> napísal(a):
> >
> > Better to stick to use nflog_nlmsg_parser(), my suggestion is:
> >
> > #1 msg_cb() provides struct nfgenmsg *nfmsg, you could retrieve the nlmsg
> >    from there since the nlmsghdr comes before nfgenmsg:
> >
> >         struct nlmsghdr *nlh;
> >
> >         nlh = (struct nlmsghdr *)((void *)nfg - sizeof(*nlh));
> >
> >         err = nflog_nlmsg_parse(nlh, attrs);
> >         if (err < 0)
> >                 ... error path
> >
> > #2 once you have access to attrs[NFULA_CT], from there on:
> >
> >         struct nf_conntrack *ct;
> >
> >         ct = nfct_new();
> >         if (!ct)
> >                 ... error path
> >
> >         err = nfct_nlmsg_parse(nlh, ct);
> >         if (err < 0)
> >                 ... error path
> >
> > Then, you get the pointer to conntrack object.
> 
> Great, your suggestions perfectly work. Thank you.
> Little later I will post complete code to everyone.

Thanks.

> Could it be useful to prepare patch to add this to ulogd2?

I think so, yes.

> As new input plugin or as a upgrade to inppkt_UFLOG?

Better if you integrate it into the existing plugin.

Please, go ahead post it for review, it might just need a few
iterations before it gets merged into master.

Thanks.
