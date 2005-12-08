From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: stop accepting new connections on port 80
Date: Thu, 8 Dec 2005 08:50:29 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B3DB@mailbox.vikus.com>
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
To: Spam User <spam@the-force.net>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Spam User
> Sent: Wednesday, December 07, 2005 5:18 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: stop accepting new connections on port 80
>=20
> >
> > I don't know exactly how you're determining the above: is it a long=20
> > download that gets killed? HTTP opens at least (and usually=20
> only) one=20
> > connection per page so the problem may be that the connection is=20
> > already closed even though the page is still being viewed.=20
> Unless you=20
> > are downloading something it's not likely your connection will last=20
> > much longer than four or five seconds on a heavily=20
> graphical page with=20
> > broadband.
>=20
>=20
> I had sort of thought about this, but then I thought thats=20
> what the related and established rules took care of.
>=20
> I suppose it it would be more helpful if the end goal was=20
> known.. to be more specific, I should have included that we=20
> use PHP sessions and what I'd like to do is keep the session=20
> open until all the currently open PHP sessions are closed=20
> (serve active session, don't accept new connections).
>=20
> I was hoping that the connection tracking would be associated=20
> to the sessions (not by session id or anything, but by the=20
> relationship of the established connections from the caller),=20
> so if user a looked at page X then 10 seconds later looked at=20
> page y, netfilter would know because that client had had=20
> established connections - I suppose I can see the flaws in=20
> that logic though.  I thought that the callers connection=20
> info being in a time_wait state would possibly mean something=20
> to iptables.

Not knowing exactly how conntrack determines when a connection is
closing, I don't think I can help with explaining that. However each
page load is a different TCP connection (and the client may use a
different source port) so it would make sense to me that conntrack would
process it that way.

> I know this isnt an apache/php list, but maybe thats where I=20
> should be headed?  Something like sending apache a usr1=20
> signal, but instead of accepting new connections with the new=20
> config, just don't accept new connections until the daemon is=20
> restarted.
>=20
> In any case, thanks for your speedy response.
>=20

If you can get your hands on the PHP, I'd start there. You could (a)
have PHP check for the existence of some flag file (say,
/var/.STOP_SESSIONs) and deny new sessions or (b) do that in the
database to cut down on I/O if you've got a busy server.

I don't know enough about the inner workings of Apache to suggest a
solution with that.

Derick Anderson=20

