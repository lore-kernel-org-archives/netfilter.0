From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Working example for NETLINK_FIREWALL protocol
Date: Fri, 07 Oct 2011 09:09:25 +0400
Message-ID: <1317964165.8681.2.camel@hakkenden.homenet>
References: <CAG+XuE4feu1qKw4HGu5vivJRrFaZyFHFGRw362QvPJR4TGkNig@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE4feu1qKw4HGu5vivJRrFaZyFHFGRw362QvPJR4TGkNig@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Prashant Batra <prashant0100@gmail.com>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=9F=D1=82=D0=BD, 07/10/2011 =D0=B2 10:29 +0530, Prashant Batr=
a =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello,
>=20
> Can anyone help me out with a working code sample for receiving
> filtered packets using NETLINK_FIREWALL protocol in the user space.
> I have tried out the things in "http://smacked.org/docs/netlink.pdf"
> But these are not working.
>=20
> Any help would be highly appreciated.

Hi, ip_queue is considered deprecated.
Try this instead
http://www.netfilter.org/projects/libnetfilter_queue/index.html

There are also several useful examples
http://www.netfilter.org/projects/libnetfilter_queue/doxygen/modules.ht=
ml


> -- Thanks
> Prashant Batra
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


