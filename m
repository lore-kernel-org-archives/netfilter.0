From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: icmp-host-unreachable as opposed to destination-unreachable
Date: Tue, 7 Mar 2006 10:23:15 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CBD29@mailbox.vikus.com>
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
To: bclark <bclark@eccotours.co.za>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of bclark
> Sent: Tuesday, March 07, 2006 6:45 AM
> To: netfilter@lists.netfilter.org
> Subject: icmp-host-unreachable as opposed to destination-unreachable
>=20
> Hi all
>=20
> Would anyone be kind to explain why would a person reject a=20
> connection to port 113 with icmp-host-unreachable as opposed=20
> to destination-unreachable.
> I probally dont understand the difference.
> Just something I was wondering.
>=20
> Kind Regards
> Brent Clark
>=20

From what I can tell, icmp-host-unreachable is a code (1) for the
destination-unreachable ICMP type (3). See
http://www.spirit.com/Resources/icmp.html for a little more information,
and Google RFC 792 for a lot more information.

Basically though, "host-unreachable" is more specific than
"destination-unreachable". I would think that code 3 would be more
appropriate ("port unreachable") to this specific rule but then I don't
bother with ident (port 113) rules. There's more information on that on
this page: http://grc.com/port_113.htm.

Derick Anderson

