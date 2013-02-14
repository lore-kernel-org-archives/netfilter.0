From: Eric Leblond <eric@regit.org>
Subject: Re: Make packets go through when NFQUEUE app crashed
Date: Thu, 14 Feb 2013 08:10:46 +0100
Message-ID: <1360825846.11976.2.camel@tiger2>
References: <x9b89wseb1jvatb87cqei016.1360758215647@email.android.com>
	 <CAJZVxRmKM5Wg+8V3LoZd=p5C0nsCOW1eabK+G7eHsM5h5QoymQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRmKM5Wg+8V3LoZd=p5C0nsCOW1eabK+G7eHsM5h5QoymQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

On Thu, 2013-02-14 at 11:04 +0800, Aaron Lewis wrote:
> Hi Eric,
>=20
> --queue-bypass wasn't a standard feature I guess?
>=20
> Is there a patch available? I'm running iptables v1.4.12

the NFQUEUE target option --queue-bypass is standard since kernel
2.6.39. Iptables has this since v1.4.11.

BR,
>=20
> On Wed, Feb 13, 2013 at 8:23 PM, Eric Leblond <eric@regit.org> wrote:
> > Hello
> >
> > Can you read the paragraph about queue-bypass in the article I poin=
t you to and tell me if it seems clear enough ;)
> >
> > BR
> >
> > Aaron Lewis <the.warl0ck.1989@gmail.com> a =C3=A9crit :
> >
> >>Hi,
> >>
> >>I found that If the app that handles NFQUEUE crashed,
> >>all packets goes through that queue got stuck.
> >>
> >>Is there a way to prevent that from happening?
> >>I prefer to let ACCEPT all packets instead of blocking them, possib=
le?
> >>
> >>iptables -I INPUT -p icmp -j NFQUEUE --queue-num 0
> >># If no app handles that queue, no packets could go through
> >>
> >>--
> >>Best Regards,
> >>Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
> >>Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
> >>--
> >>To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
>=20

--=20
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/

