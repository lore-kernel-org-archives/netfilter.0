From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Redirecting a Pre-existing SSH Session
Date: Wed, 07 Jul 2010 16:33:31 +0200
Message-ID: <4C34903B.8040704@plouf.fr.eu.org>
References: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Wade Gasior <wadegasior@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Wade Gasior a =E9crit :
> Hi... I am hoping that someone can help me with routing an already
> established SSH session.
>=20
> I have two physical servers set up: 192.168.1.150 and 192.168.1.160
>=20
> All external traffic comes in to server .150
>=20
> Initially, I want all traffic to be served by server 150. So for this
> purpose I am leaving the IPTables on .150 empty (for sake of
> simplicity).
>=20
> At a point in time, I want to forward all incoming traffic to be
> served by .160 instead.
> I have accomplished this using these commands (on .150):
>=20
> iptables -t nat -A PREROUTING -j DNAT --to 192.168.1.160
> iptables -t nat -I POSTROUTING -j MASQUERADE
>=20
> My problem is that if I have an open SSH connection to .150 (prior to
> adding the rules), the packets are still handled by .150 after adding
> the rules.. e.g. my SSH session stays active. I want these packets to
> be forwarded to .160, which would effectively disconnect the SSH
> session in a sense (I will later be performing a live server migratio=
n
> from 150 to 160, so the SSH session should stay valid). I do not want
> the packets flat out dropped, I need them to be forwarded on in
> whatever state they are in.
>=20
> If I try a _NEW_ SSH session, the packets are properly forwarded to .=
160

As you observed, iptables NAT rules only apply to new connections, not
already existing ones. This is by design. You could try to delete the
related conntrack entries with conntrack-tools or reject them with the
REJECT target. However neither is a clean solution as it leaves the
connection half-open at the server side.
