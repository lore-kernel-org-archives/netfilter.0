From: "Bill Binko" <Bill.Binko@trcinc.com>
Subject: RE: Simulate Poor Network Conditions?
Date: Fri, 27 Dec 2002 12:42:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3BAC15E02315BC4783152AC5E9621BB501C7BA20@trcexcsrv01.trcinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Michael B. Allen" <miallen@eskimo.com>, netfilter@lists.netfilter.org

NISTNet is what you want to use for this.  It is not related to =
Netfilter, but it does exactly what you want.  When we used it, the X =
client was very buggy, but the command line rocked:
http://snad.ncsl.nist.gov/itg/nistnet/

(Not only that, but you get to use some of those tax dollars :)
Bill

> -----Original Message-----
> From: Michael B. Allen [mailto:miallen@eskimo.com]
> Sent: Thursday, December 26, 2002 3:18 PM
> To: netfilter@lists.netfilter.org
> Subject: Simulate Poor Network Conditions?
>=20
>=20
> I'm writing network software and would like to test it under adverse
> network conditions. Is there a netfilter module that can=20
> simulate slow,
> sticky, and downright errant network conditions over loopback with RH
> Linux 2.4.9-13?
>=20
> Mike
>=20
> --=20
> A  program should be written to model the concepts of the task it
> performs rather than the physical world or a process because this
> maximizes  the  potential  for it to be applied to tasks that are
> conceptually  similar and, more important, to tasks that have not
> yet been conceived.=20
>=20
>=20

