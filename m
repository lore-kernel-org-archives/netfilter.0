From: Leonardo Teves <leonardo.teves@alimentos-granix.com.ar>
Subject: Re: Blocking programs with IPtables
Date: Fri, 30 Jul 2004 12:41:11 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410A6C17.4000908@alimentos-granix.com.ar>
References: <410A5D82.4050109@alimentos-granix.com.ar> <200407301548.04847.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407301548.04847.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Thanks Antony,
i will continue looking for a solution,
sorry if subject was a off-topic.
Leo.

Antony Stone escribi=F3:
> Your question is clear.
>=20
> This cannot be done with netfilter (because all imap connections look the=
 same=20
> to netfilter, no matter what client or server software is being used)
>=20
> I cannot think of another way to do it either, because I would be surpris=
ed if=20
> Outlook sent anything in its connect message to identify itself as Outloo=
k=20
> (the server end of a connection often does, but the client end usually=20
> doesn't, except for web browsers).
>=20
> Sorry - but perhaps someone else here can prove me wrong?
>=20
> Regards,
>=20
> Antony.
>=20

