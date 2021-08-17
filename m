From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Tue, 17 Aug 2021 17:06:50 +0200
Message-ID: <CAMEa=f=mnxifQkZ326dSAJYM_BMB3aLwevWvqfc18+Bp1jt7XQ@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com> <CAN_K0LQESjR-g02cebseiNkoxMEf28cgcEt8eJpOJcWsVKpD9w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tm9h/pTf+3uPLThbh1ejiDyCBBQPuy5SibC/P+hcMcg=;
        b=ckq4EPhONvqZLlQFFvreQXv7mSbZY7GhquKYrw2KoGXpDp4BgRdoNBp1jaBQZ+zK6b
         WsB+n1voBIQOUWBG+qfrxwLhUHyKOpU0V3cGAwRKC6qhUZ/VZzLKokzIsupEZj5lKEWi
         R7V9Ygvoa1FcAbrCQ6qO90bGpGfmcb/6/OWBF9VEFOk0yE0AHsSJm/EEjRUPsYzg1Wky
         amYRnUyDppI0tadf1P7f3qyeU7d35HjqB6j7mDtaVGwKz5PUSj0yMP9OkQ7HDj8z1hY7
         /JWUkvJ3jNIFpTkphQVTCF7cWLd9tCeP1Rg2pDSdprwYJq28qy8KDpq+O8hCI6CU3Asp
         KDFw==
In-Reply-To: <CAN_K0LQESjR-g02cebseiNkoxMEf28cgcEt8eJpOJcWsVKpD9w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fatih USTA <fatihusta86@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

ut 17. 8. 2021 o 17:05 Fatih USTA <fatihusta86@gmail.com> nap=C3=ADsal(a):
> Hi
> Did you enable sysctl parameters.
>
> sysctl -w nf_conntrack_acct=3D1
> sysctl -w nf_conntrack_timestamp=3D1
>

Yes, both are enabled. conntrack -L displays counters and delta-time correc=
tly.

u_int32_t pkts =3D nfct_get_attr_u32(ct, ATTR_ORIG_COUNTER_PACKETS );
printf("  Packet counter: %d", ntohs(pkts));
printf(" (%s)\n", strerror(errno));

returns 0 (No data available)

I'm attaching draft-work of module to check.
https://drive.google.com/file/d/1KouPKrrANvOihBuQH8Uwslk3pBkmP95q/view?usp=
=3Dsharing

I'm not sure about parsing

static inline int
interp_packet(struct ulogd_pluginstance *upi, uint8_t pf_family,
      struct nflog_data *ldata)
{
    struct ulogd_key *ret =3D upi->output.keys;

    struct nfulnl_msg_packet_hdr *ph =3D nflog_get_msg_packet_hdr(ldata);
    .......
    retb =3D nflog_nlmsg_parse(ph, attrs);
    if (retb !=3D MNL_CB_OK) {
        printf("something went wrong");
        printf(" (%s)\n", strerror(errno));
        return retb;
    }

    nfg =3D mnl_nlmsg_get_payload(ph);

    print_nfct(nfg->nfgen_family, attrs[NFULA_CT_INFO], attrs[NFULA_CT], re=
t);
