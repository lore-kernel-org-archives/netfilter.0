From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: problem with mac address and  SNAT
Date: Wed, 23 Jul 2003 09:47:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030723134703.GA23652@cannon.eng.us.uu.net>
References: <BAY1-F82XIwOnCSBs4K00010097@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY1-F82XIwOnCSBs4K00010097@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Javier Garza <ejgg71@hotmail.com>
Cc: netfilter@lists.netfilter.org

Either assign 200.40.199.221 to that external interface, or make
sure you have a route to that address (even a blackhole route will do)
and use proxy arp.

For each of these solutions search the web as to how to set it up.

Ramin

On Tue, Jul 22, 2003 at 06:23:40PM -0300, Javier Garza wrote:

> Hy
>  I have a redhat-release-7.2-1,  with   kernel-2.4.7-10  and  =20
> iptables-1.2.3-1.
>=20
> I want to assign a public  IP 200.40.199.221  to my PCs for access to=20
> internet,
> and the interface outside  is 200.40.199.220.
>=20
>       iptables -t nat -A POSTROUTING -s 10.220.5.13 -o eth1 -j SNAT=20
> --to-source   200.40.199.221
>=20
> The problems is the router outside, not kwon the mac to  200.40.199.221=
,=20
> because my linux not reply the
> MAC assigned to  200.40.199.221.
> my linux have a MAC  entry to IP  200.40.199.221  equql to MAC of inter=
face=20
> outside.
>=20
> Help me please.!!
>=20
> _________________________________________________________________
> Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
> http://messenger.yupimsn.com/
>=20

