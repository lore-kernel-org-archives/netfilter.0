From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: log analysis
Date: Thu, 27 Oct 2005 11:16:10 -0400
Message-ID: <FAC4E024BF776842876169173CE2F01328C2@mailbox.vikus.com>
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
To: Gene Dellinger <gene@poh.com>, netfilter@lists.netfilter.org

=20
Inline.
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Gene Dellinger
> Sent: Wednesday, October 26, 2005 11:14 PM
> To: netfilter@lists.netfilter.org
> Subject: log analysis
>=20
> A couple of questions:
> Anyone have a recommendation on a good log anlaysis tool for=20
> iptables/netfilter?

Yes. It's called Snort. =3D)

> How difficult is it to perform Intrusion Detection using=20
> iptables, any real world stories(good and bad) desired.

Next to impossible unless you start writing your own string-based
signatures and get the string match or l7 support I keep hearing about.

> Thanks
> Gene D.
>=20

I don't log with netfilter. I use Snort and BASE for NIDS. There are
many viable options for NIDS and HIDS (like Tripwire). In my opinion the
only purpose of the LOG/ULOG targets are testing rules on live
firewalls. The default netfilter logs don't include the packet payload
anyway, which can tell you whether the M$ command banner Snort flagged
is real or just Bugtraq.

Derick Anderson

