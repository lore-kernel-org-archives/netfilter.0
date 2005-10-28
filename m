From: "Oscar A. Valdez" <oscar.valdez@duraflex-politex.com>
Subject: Re: IPSEC using Linux Kernel 2.6
Date: Fri, 28 Oct 2005 14:14:51 -0600
Message-ID: <1130530491.4948.14.camel@wzowski.plastipak.com.sv>
References: <1130445253.3908.45.camel@wzowski.plastipak.com.sv>
	<1130501222.2424.6.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1130501222.2424.6.camel@davila.nicaraguaopensource.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: "Jorge I. Davila L." <davila@cablenet.com.ni>
Cc: netfilter@lists.netfilter.org

El vie, 28-10-2005 a las 06:07 -0600, Jorge I. Davila L. escribi=F3:
> Why don't try:
>=20
> kernel 2.6.12
> iptables 1.3.3
>=20
> After that, see If you still needs the patches (from patch-o-matic and
> from shorewall.net)

Jorge:

Thanks for your reply. I am working with 2.6.12, and it doesn't have the
needed "policy match extension" patch. I don't think iptables 1.3.3 has
the ipsec hooks and policy patches, since they're still in "testing"
over at netfilter.org.

Incidentally, I think the folks at netfilter should pay more attention
to the difficulties with ipsec and iron them out.
--=20
Oscar A. Valdez



