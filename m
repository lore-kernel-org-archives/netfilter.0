From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Tue, 17 Aug 2021 16:42:12 +0200
Message-ID: <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rJoK6y2Aw/OuKuybrJwbqyXO2c7bV6a6oYDq4t3xPvo=;
        b=Nne/ig3ahbRI2qj0qECBXhmN7I5cHb05XJVAA1I1J2M9HLOduvlzzt5t7OanSVg+3F
         8+iZWCwdjOn5D6FUPt5pDp1zURfz2VJLgaCIrHrt0x7X7KC2NdH+9YDIMB6Ub0e5w4Yn
         npkbwMaOvEgC4ad3R37EElRw+YmcbkESKWSD/AvGmWzLBscZrnFxT9h4EAJeAmVR6I1H
         GTFn/lOo8tyJNDbLTUvcmQLgw5Xq5iLUJ62PqYCgFtwnw+37t6GKem+QTd5sYQweNQbU
         KNtKH7tA35SfeUi/u54jYv+sj0u5VZGBGqExn22R5AHS6OHJmWRHqzSN5Fo5mhUl9bW3
         V4CA==
In-Reply-To: <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hello Pablo,

I'm just rewriting input plugin ulog_inppkt_NFLOG.c to include
conntrack params. I successfully included CT flags from enum
ip_conntrack_status (assured, reply seen, ...) and CT state and
direction from NFULA_CT_INFO.

However, in NFULA_CT few counters from enum nf_conntrack_attr are
still 0 value. For ex. ATTR_TIMESTAMP_START / STOP and
ATTR_ORIG/REPL_COUNTER_PACKETS/BYTES.
Is it normal, or am I missing some bug at parsing?

ne 15. 8. 2021 o 18:23 Bla=C5=BEej Kraj=C5=88=C3=A1k <blazej.krajnak@gmail.=
com> nap=C3=ADsal(a):
>
> ne 15. 8. 2021 o 16:31 Pablo Neira Ayuso <pablo@netfilter.org> wrote
> >
> > From the example ulogd2 configuration file in the tree:
> >
> > http://git.netfilter.org/ulogd2/tree/ulogd.conf.in#n77
> >
> > # this is a stack for flow-based logging via XML
> > #stack=3Dct1:NFCT,xml1:XML
>
> At first, thank you for fast response. Of course I saw this example,
> but I have situation, where I need to know packet details (pktlen,
> mac, ifindex) along with information of conntrack entry which this
> packet triggered.
> I modified one of the libnetfilter_log example utilities to print both
> (packet and conntrack) information together.
> https://drive.google.com/file/d/1wx_LAjH57czHyFwTBSUvSnOkMchWEiiq/view?us=
p=3Dsharing
>
> Is there any way to do the same in ulogd?
