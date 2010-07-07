From: Antoine Souques <corum@via.ecp.fr>
Subject: Re: Redirecting a Pre-existing SSH Session
Date: Wed, 07 Jul 2010 18:45:56 +0200
Message-ID: <4C34AF44.5050003@via.ecp.fr>
References: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Le 06/07/2010 13:28, Wade Gasior a =E9crit :
> Hi... I am hoping that someone can help me with routing an already
> established SSH session.
>
> I have two physical servers set up: 192.168.1.150 and 192.168.1.160
>
> All external traffic comes in to server .150
>
> Initially, I want all traffic to be served by server 150. So for this
> purpose I am leaving the IPTables on .150 empty (for sake of
> simplicity).
>
> At a point in time, I want to forward all incoming traffic to be
> served by .160 instead.
> I have accomplished this using these commands (on .150):
>
> iptables -t nat -A PREROUTING -j DNAT --to 192.168.1.160
> iptables -t nat -I POSTROUTING -j MASQUERADE
>
> My problem is that if I have an open SSH connection to .150 (prior to
> adding the rules), the packets are still handled by .150 after adding
> the rules.. e.g. my SSH session stays active. I want these packets to
> be forwarded to .160, which would effectively disconnect the SSH
> session in a sense (I will later be performing a live server migratio=
n
> from 150 to 160, so the SSH session should stay valid). I do not want
> the packets flat out dropped, I need them to be forwarded on in
> whatever state they are in.
>
> If I try a _NEW_ SSH session, the packets are properly forwarded to .=
160
>
> Any help would be appreciated to get these packets from the existing
> session forwarded.
>
> Thank you!
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20
Hi,

Why not enable SSH on an unusual port (for instance 1234 or anything) o=
n=20
a server ?
1) The problem is much easier : iptables works great with port based ru=
les
2) You can at any time contact the both servers. Usefull for instance i=
f=20
your TCP session expire for any reason.


