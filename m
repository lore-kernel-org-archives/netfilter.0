From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IMQ and marking
Date: Tue, 21 Jul 2009 17:28:07 +0200
Message-ID: <4A65DE87.5010401@plouf.fr.eu.org>
References: <4A65A1A4.4020805@duet.it> <4A65CEE6.9050004@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65CEE6.9050004@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

=46abio Marcone a =E9crit :
> In a post in a forum I see this:
> iptables -t mangle -A PREROUTING -m owner --pid-owner <PID of process=
> -=20
> -j MARK --set-mark 2
> iptables -t mangle -A PREROUTING -j IMQ --todev 0
>=20
> the second rule is used? so, rule matching in mangle table is not blo=
cking?

Whether a matching rule stops further rule examination, if this is what=
=20
you mean, depends on the target. MARK is not a terminal target. It is=20
not specific to the mangle table, although (most if not all)=20
mangle-specific targets are non terminal whereas filter and nat-specifi=
c=20
targets are terminal.


