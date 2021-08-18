From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Wed, 18 Aug 2021 22:06:40 +0200
Message-ID: <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia> <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xDDrbBFjuFgahMtkE0RgvaArUii4kwDGsfLpm9Cxqxk=;
        b=VENj9NZOygZ0VWARN5Ww3EBomPmUtP8xV+O//eCGiyxbhP0XkhOdvVn8OChsXgQiKo
         JYfFm/X4EvJztu8mpU0uCNwrriruBx6FYCUmI3g4NFL4kOYj075VLYCQnr0uwZ4TOmL7
         qHz1OdAnDuXziZQhUKnG8nEmkCaFvg4cGpHWjbYujOmFxm+Wzg1tbhhthLxqFWlD9N9w
         N4e/Q9+rotSQT1cSuR3pVOugxMx1x+NjDcLts/dLaPA6jyPn0dJYiE7quStVP6jOdvyr
         yA6EvCvWdZ9y8k3FSe2vPJDLGGZHG0mf7ciR52hkK/nihvt0n2g3Evyg7GAPBWZ0uQSj
         60gQ==
In-Reply-To: <20210818115228.GA9294@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

I'm really confused from searching a bug.

Getting nf_conntrack via nflog_nlmsg_parse(ph, attrs); is (I think)
bad because ph parameter must be nlmsghdr not nfulnl_msg_packet_hdr

So different way. I added new getters to libnetfilter_log.c:

struct nf_conntrack *nflog_get_ct(struct nflog_data *nfad)
{
    return nfnl_get_pointer_to_data(nfad->nfa, NFULA_CT, struct nf_conntrac=
k);
}

uint32_t nflog_get_ct_info(struct nflog_data *nfad)
{
return ntohs(nfnl_get_data(nfad->nfa, NFULA_CT_INFO, uint32_t));
}

nflog_get_ct_info works correctly. But from nflog_get_ct I'm unable to
read anything.

struct nf_conntrack *ct =3D nflog_get_ct(ldata);
printf("test value %" PRIu64 " /n", ct->timestamp.start);

is returning random numbers. What am I missing? How to properly parse
output of nflog_get_ct to be able to use for ex. nfct_get_attr_u32?

st 18. 8. 2021 o 13:52 Pablo Neira Ayuso <pablo@netfilter.org> nap=C3=ADsal=
(a):
>
> Hi Bla=C5=BEej,
>
> On Wed, Aug 18, 2021 at 12:06:40PM +0200, Bla=C5=BEej Kraj=C5=88=C3=A1k w=
rote:
> > st 18. 8. 2021 o 9:23 Pablo Neira Ayuso <pablo@netfilter.org> nap=C3=AD=
sal(a):
> > > You need this kernel patch to add this information to nfnetlink_queue=
,
> > > compile-tested only.
> >
> > Hey Pablo,
> > patch is working like a charm. Thank you! Now I see timestamps and
> > packets/bytes counters in JSON output correctly.
> > At the end I will post customized input plugin for everyone.
> >
> > The last thing I want to ask is what's correct way to get
> >
> > attrs[NFULA_CT]
> >
> > from
> >
> > struct nfulnl_msg_packet_hdr *ph =3D nflog_get_msg_packet_hdr(ldata);
> >
> >
> > Now I use the following code which is working but throwing random
> > errors "something went wrong (Numerical result out of range)" I'm
> > mixing struct nfulnl_msg_packet_hdr with const struct nlmsghdr *nlh
>
> That might be a bug in nflog_nlmsg_parse(): maybe
> nflog_parse_attr_cb() is finding a mismatch in the datatype of the
> attribute payload.
>
> Could you have a look at what attribute is hitting this error?
>
> > struct nfulnl_msg_packet_hdr *ph =3D nflog_get_msg_packet_hdr(ldata);
> > struct nlattr *attrs[NFULA_MAX + 1] =3D { NULL };
> > int retb;
> >
> > retb =3D nflog_nlmsg_parse(ph, attrs);
> > if (retb !=3D MNL_CB_OK) {
> >     printf("something went wrong");
> >     printf(" (%s)\n", strerror(errno));
> >     return retb;
> > }
