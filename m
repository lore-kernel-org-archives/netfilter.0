From: Beluc <beluc.mailing@free.fr>
Subject: Re: problem getting uid in nfqueue
Date: Mon, 21 Jun 2010 22:51:56 +0200
Message-ID: <4C1FD0EC.6000302@free.fr>
References: <1624629744.165291276781877065.JavaMail.root@zimbra6-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1624629744.165291276781877065.JavaMail.root@zimbra6-e1.priv.proxad.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

no idea ? maybe i didn't explain very well :/

i saw that when using LOG target in OUTPUT policy, there is the user's=20
uid who send packet.
what i want to do is to get that uid when using QUEUE/NFQUEUE target ..=
=2E

Le 17/06/2010 15:37, beluc.mailing@free.fr a =C3=A9crit :
> Hi all,
> i finaly managed to get packet from NFQUEUE to some userspace program=
 using
> perl IPTables::IPv4::IPQueue.
> my problem is that uid/gid is not present in what i receive in perl.
> is it normal or i did something wrong?
>
> (what i want to do is some advanced firewalling based on user id)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20
