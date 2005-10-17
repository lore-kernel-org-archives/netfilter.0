From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: logging and droping bad tcp packets
Date: Mon, 17 Oct 2005 09:54:55 -0400
Message-ID: <FAC4E024BF776842876169173CE2F013287C@mailbox.vikus.com>
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
To: edvin.seferovic@kolp.at, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Seferovic Edvin
> Sent: Monday, October 17, 2005 9:45 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: logging and droping bad tcp packets
>=20
> Hi and thank you for the answer Derick....
>=20
> I set it as=20
>=20
> Iptables -t mangle -A PREROUTING ..... -j DROP ... I suppose=20
> Ill keep the packages rather far away from the "real"=20
> iptables chains that are used for filtering... critics?
>=20
> Regards,
>=20
> Edvin Seferovic=20

Yes... =3D) Filtering should always be done in the filter table, not
mangle or nat. There have been many discussions regarding this in the
list if you would like more information on why. The bottom line is that
iptables is designed to filter in filter, and it works properly when
done that way.

Derick Anderson=20

