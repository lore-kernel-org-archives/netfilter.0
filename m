From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: DNAT/SNAT question
Date: Thu, 14 Apr 2005 10:49:30 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A8A@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Jason,=20

So I would do something like=20
[0:0] -A PREROUTING -d 66.121.12.64/26 -j NETMAP --to 10.0.12.64/26
Instead of:
[0:0] -A PREROUTING -d 66.121.12.64 -j DNAT --to-destination 10.0.12.64

And=20
[0:0] -A POSTROUTING -d 10.0.12.64/26 -j NETMAP --to 66.121.12.64/26
Instead of:
[0:0] -A POSTROUTING -o eth0 -s 10.0.12.64 -j SNAT --to-source
66.121.12.64

And=20
[0:0] -A OUTPUT -d 66.121.12.64/26 -j NETMAP --to OUTPUT 10.0.12.64/26
Instead of:
[0:0] -A OUTPUT -d 66.121.12.64 -j DNAT --to-destination 10.0.12.64

Is this correct?

Please note, not valid external IP's...

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Jason Opperisano
> Sent: Thursday, April 14, 2005 10:29 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: DNAT/SNAT question
>=20
>=20
> this is the job of the NETMAP target.  and you would do it in two
rules,
> one POSTROUTING (SNAT), and one PREROUTING (DNAT).
>=20
> HTH...
>=20
> -j
>=20
> --
> "Stewie: HA! That's so funny I forgot to laugh! Excluding that first
>  'ha.'"
>         --Family Guy


