From: "Elmshauser, Erik" <erike@pbgnw.com>
Subject: RE: pom for timeout fix failing
Date: Tue, 25 Mar 2003 13:34:35 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0FD2E5E35F0C0D41AEA66C9C6F39F30D086B0E@HERMES.pbgnw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Martin Josefsson <gandalf@wlug.westbo.se>, "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Cc: Netfilter <netfilter@lists.netfilter.org>

> -----Original Message-----
> From: Martin Josefsson [mailto:gandalf@wlug.westbo.se]
> Sent: Tuesday, March 25, 2003 12:41 PM
> To: Stephen Lawrence Jr.
> Cc: Netfilter
> Subject: Re: pom for timeout fix failing
>=20
> On Tue, 2003-03-25 at 19:50, Stephen Lawrence Jr. wrote:
> > I am trying to apply the extra/ip_conntrack_tcp_timeouts fix to my
> > RedHat 7.3 machine. I have installed the latest kernel-source RPM
> > (kernel-source-2.4.18-27.7.x), and I ran "./runme extra, told it the
> > source was in /usr/src/linux-2.4, and selected "T" to test the
patch. It
> > says:
> >
> > Testing patch extra/ip_conntrack-timeouts.patch...
> > Failed to patch copy of /usr/src/linux-2.4
> >
> > Am I doing something wrong here?
>=20
> Yes, you are trying to use patch-o-matic on a RH kernel. That isn't
> tested and won't be supported. Many patches in patch-o-matic requires
> that you apply all patches in pending and submitted (./runme pending
and
> apply all those patches).
> This will almost certainly fail with a RH kernel. You are on your own.
>=20
	While I haven't had to touch a RH system for a couple years now,
I had no problems installing a vanilla kernel from source on RH systems
in the past.  Grab the 2.4.x source from http://kernel.org and you
should be all set.
	--Erik

