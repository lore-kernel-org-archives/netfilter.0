From: Bryan Ballard <ballard@netsolus.com>
Subject: Re: Netfilter vs Cisco PIX
Date: 18 Oct 2002 10:38:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034955494.886.33.camel@dell8100>
References: <A758C299015FD411887B0000E2131186C21447@TRUVA>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A758C299015FD411887B0000E2131186C21447@TRUVA>
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
To: =?iso-8859-9?Q?=DDhsan?= Turkmen <iturkmen@ifk.com.tr>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

The Cisco PIX is capable of stateful inspection. I would have to say
that working with a pix via the command line is not the most pleasant
experience. It lacks rule reordering without a complete reload of the
config via tftp or cut-and-paste and also lacks many if the targets
available to iptables. Its NAT capability is very basic since it uses
the security level per interface approach. One of my biggest complaints
with the pix is that it lacks the ability to to dnat based on the ip and
port. It can only do dnat with a one to one approach. Finally if that
wasn't enough you can't even do some of the basic routing tricks you can
do with a cisco router.=20

On the flip side it does support websense (url blocking software) and
its syntax for configuration is like cisco ios so that makes it easy for
the CCIEs to use it. There is a java based web configuration screen but
it is not near as nice as say a checkpoint fw1 or netscreen system.



On Wed, 2002-10-16 at 15:54, =DDhsan Turkmen wrote:
> Hi..
> I am using netfilter (iptables) for about 5 months time, and like it very
> much. When it comes to comparison to other vendor solutions,  I would alw=
ays
> be in favour of iptables because it will be one and maybe the only firewa=
ll
> in the future.It deserves this reputation even today.
>=20
> I am expected to CONVINCE one of my personal customers to give up buying =
PIX
> and use iptables instead. Since, I did not have personal experience with
> PIX, I am not armored with necessary information that will be needed for
> such a duty. I once heard it was not a statefull firewall, but a packet
> filter only. Can u give me a comparision table , or links about this issu=
e?.
> Please answer to my e-mail becouse I am not a member of the list.
>=20
> Best regards..
>=20
> Ihsan Turkmen
>=20
> =20
>=20



