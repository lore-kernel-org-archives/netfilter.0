From: "Lewis Shobbrook" <lshobbrook@fasttrack.net.au>
Subject: RE: Loosing bytes in package
Date: Tue, 21 Oct 2003 09:00:37 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C8098CA7F09CE419F0C2B68EB8358765F31@exchange.fasttrack.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: kenr@redergaard-it.no
Cc: netfilter@lists.netfilter.org

Hi Ken,

Have you tried to clamp to pmtu?

iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS =
--clamp-mss-to-pmtu

I believce this can help with encrypted protocols.


> Hi,
>=20
> I'm having problems with packages that are larger than 80 some bytes.
>=20
> The packages come from a IPSec tunnel on the ipsec0 interface=20
> and are routed to a host in the DMZ. The problem is that the=20
> package is "truncated" at the end. When using ulogd and=20
> adding a rule in the FORWARD chain to send the package to=20
> netlink I can see the complete pacakge, nothing missing. But=20
> when running tcpdump at both the host in the DMZ and
> eth1(DMZ) on the "router" the package is 40 bytes short.
>=20
> Any suggestions on what might be happening?
>=20
> With regards,
> Ken A. Rederg=E5rd
>=20
Cheers,

Lewis Shobbrook

