From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: NFNETLINK answers: File exists
Date: Tue, 23 Sep 2008 12:06:22 +0200
Message-ID: <48D8BF9E.3010406@netfilter.org>
References: <48C3FC2D.903@netcabo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C3FC2D.903@netcabo.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Jo=E3o_Valverde?= <backup95@netcabo.pt>
Cc: netfilter@vger.kernel.org

Jo=E3o Valverde wrote:
> Hello everyone,
>=20
> I'm working on a program that uses libnetfilter_queue, and after the
> program crashes or I have to kill it I get the following error starti=
ng up:
>=20
> NFNETLINK answers: File exists
> Error during nfq_bind_pf(): File exists
>=20
> Rebooting fixes it so I guess the netlink socket in question is a
> "virtual" one. What I'd like to know is how to clear this error witho=
ut
> rebooting?

Could you post the code of your program?

--=20
"Los honestos son inadaptados sociales" -- Les Luthiers
