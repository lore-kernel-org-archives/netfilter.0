From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Wed, 18 Aug 2021 12:06:40 +0200
Message-ID: <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia> <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com> <20210818072256.GA4640@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=itLo4a9V2AvK7CcMgqUUeWRiHzpp1zpqE5uhwjfm06U=;
        b=aND+czxT/Cb0D9OVzVHbBRyXiiEDtBeUwbEEzrKL2PGQzzPxentM3bUcQWBko2fibK
         Xi4O9rg0J/PcP53y7IDanq3cCkgOdGXuB5MsZHSVf29ZKyL90k32qMKAlehELiZ3ugCI
         CWcCK7xraCIxGOCId03+eobhAjl5js7Q4BkG+lO5sH8STPiTAu7xGBIT1XPgweWiY9YT
         vU4Du0EmF74qQff230+2k8i0FGHRn7jlCM80j2vQpHwR19pKGFBQePj6bOGfyAAYTnoS
         0nh1JPros0Cy4IhUI6uX/8RPxhS7704P7HXfcVLYPeUGczEVML6FPyfCpMUI69IFuHQp
         HzEA==
In-Reply-To: <20210818072256.GA4640@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

st 18. 8. 2021 o 9:23 Pablo Neira Ayuso <pablo@netfilter.org> nap=C3=ADsal(=
a):
> You need this kernel patch to add this information to nfnetlink_queue,
> compile-tested only.

Hey Pablo,
patch is working like a charm. Thank you! Now I see timestamps and
packets/bytes counters in JSON output correctly.
At the end I will post customized input plugin for everyone.

The last thing I want to ask is what's correct way to get

attrs[NFULA_CT]

from

struct nfulnl_msg_packet_hdr *ph =3D nflog_get_msg_packet_hdr(ldata);


Now I use the following code which is working but throwing random
errors "something went wrong (Numerical result out of range)" I'm
mixing struct nfulnl_msg_packet_hdr with const struct nlmsghdr *nlh


struct nfulnl_msg_packet_hdr *ph =3D nflog_get_msg_packet_hdr(ldata);
struct nlattr *attrs[NFULA_MAX + 1] =3D { NULL };
int retb;

retb =3D nflog_nlmsg_parse(ph, attrs);
if (retb !=3D MNL_CB_OK) {
    printf("something went wrong");
    printf(" (%s)\n", strerror(errno));
    return retb;
}
