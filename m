From: "Jeremy Jones" <jeremy@samnjack.com>
Subject: RE: Bridge with iptable
Date: Mon, 7 Apr 2003 11:38:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c2fd2c$89545930$4a0210ac@djc.state.id.us>
References: <071501c2f9ef$31312700$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <071501c2f9ef$31312700$13fcc5cb@Housecall>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Check out http://bridge.sourceforge.net for docs

Bridging with netfilter functionality in 2.4.x requires a kernel patch:

http://bridge.sourceforge.net/devel/bridge-nf/bridge-nf-0.0.7-against-2.4=
.19
.diff

This should work just fine with most 2.4.x kernel source trees.  There =
are
precompiled kernels, too, I think, at the same place.

Jeremy

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of B H R Balaji
> Sent: Thursday, April 03, 2003 7:42 AM
> To: netfilter@lists.samba.org
> Subject: Bridge with iptable
>=20
>=20
> Hi
>=20
> iam trying to setup a bridge with iptable
> i have setup the transparent bridge,
>=20
> and iam try to mark the http packets for QOS
> iam not able to see the packets
>=20
> i was going through the Lartc.org
> some where i read at this stage ( kernel 2.4.18-27 Redhat iam=20
> using) bridge
> will not support iptables.
> it will support only on kernel 2.5, is this true
>=20
> if false, where can i get the right documentation which help=20
> me to setup
> bridge with packet filtering
>=20
> thanks in advance for the help
>=20
> hare
>=20
>=20
>=20
>=20


