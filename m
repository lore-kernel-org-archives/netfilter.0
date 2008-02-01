From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT'ing IP ranges
Date: Fri, 01 Feb 2008 21:25:32 +0100
Message-ID: <47A3803C.9090303@plouf.fr.eu.org>
References: <1201892435.9016.4.camel@ws-diegolima.consuldata.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1201892435.9016.4.camel@ws-diegolima.consuldata.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter mailing list <netfilter@vger.kernel.org>

Hello,

Diego Alencar Alves de Lima a =E9crit :
>=20
> I'd like to know if there is any way I can add a DNAT rule that will =
nat
> an entire range of IP addresses to another range (which has the same
> network mask). Something like this:
>=20
> -t nat -A PREROUTING -d 192.168.0.0/24 -j DNAT --to 192.168.1.0/24
>=20
> I need to keep the host address, just change the destination network
> address. Thank you,

Check the NETMAP target.
