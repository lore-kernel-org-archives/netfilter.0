From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Need to solve a NAT problem, any takers.
Date: Fri, 12 Jan 2007 09:03:21 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8D@pxtbenexd01.pxt.primeexalia.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
	<45A7AD09.30401@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <45A7AD09.30401@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@lists.netfilter.org



>=20
> Just being curious : why do you want to replicate the external view on
> the slave DNS server ? If I understand correctly, only the primary DNS
> server is reachable from the outside.
>=20

Um, I can't remember :).  But that's a good question.=20

> [...]
> > -A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p tcp -m tcp --sport
53 -j
> > SNAT --to-source 80.80.80.66:53
> > -A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p udp -m udp --sport
53 -j
> > SNAT --to-source 80.80.80.66:53
>=20
> What do you expect these two rules to do ?

A long long time ago I had to put these in to fix some VPN clients from
dying on the routes.  This was a long time ago though.  Since then for
our primary firewall we switched from NAT to bridging so we have since
not used most of the options.  So it's like relearning NAT'ing again

Anyways, thanks for the information.  I'll play around with this a
little more.

