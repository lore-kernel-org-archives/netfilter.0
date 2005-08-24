From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: NOTRACK action question
Date: Wed, 24 Aug 2005 14:49:28 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829074E2@pxtbenexd01.pxt.primeexalia.com>
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
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

Makes sense.  Your understanding is correct.  We will look at moving the
server into a directly routed subnet in the future.=20

BTW, do you know what the limit is on connection tracking or where I can
find/set the values.

>=20
> It would depend on your configuration. Oh you said NAT, DNAT I guess.
> IIUC DNAT does depend on connection tracking. Perhaps you should put
> your Apache reservation in a routed (not DNAT'ed) subnet.
>=20
> > I would assume no.  But when I add a NOTRACK rule to the raw table
> > Apache suddenly fails to serve the pages to external clients.
>=20
> Then your assumption would seem to be in error.
>=20
> > Am I doing something wrong?
>=20
> If it's not working, and you want it to work, yes. :)
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header


