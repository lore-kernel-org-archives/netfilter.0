From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: TCP RST vulnerability - handling question
Date: Thu, 17 May 2007 10:41:20 -0700
Message-ID: <000101c798aa$94b39d90$5a05a8c0@nisgaa.net>
References: <bd0eabd0705161756q79024a91y74a132e34616c7fa@mail.gmail.com>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bd0eabd0705161756q79024a91y74a132e34616c7fa@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

From what I can tell, using IPSec mitigates this vulnerability, but if =
you
can grok this article better than I you may be able to tighten your =
security
even further:

http://www.cert.org/advisories/CA-2001-09.html



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9
Web Programmer
enTel Communications Inc
jpb@entel.ca
250.633.5151
866.633.2644
=20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Mike C
> Sent: Wednesday, May 16, 2007 5:57 PM
> To: netfilter@lists.netfilter.org
> Subject: TCP RST vulnerability - handling question
>=20
>=20
> Hi,
>=20
> I am using an iptables 1.3.5 based setup and wonder if there are any
> tools or techniques available to prevent or mitigate the TCP RST
> spoofing issue (http://osvdb.org/displayvuln.php?osvdb_id=3D4030)
>=20
> I see elsewhere there has been suggestions of only accepting the RST
> if the sequence id is 1 more than the current, or providing some sort
> of challenge response
> (http://tools.ietf.org/html/draft-ietf-tcpm-tcpsecure-02#section-2.2).
> I don't believe netfilter uses either of these, so I am interested in
> hearing other peoples approaches to it.
>=20
> Regards,
>=20
> Mike
>=20


