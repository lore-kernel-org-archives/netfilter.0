From: Athan <netfilter@miggy.org>
Subject: Re: Firewall allows new connections back in
Date: Sun, 19 Jan 2003 01:29:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030119012940.GW22487@miggy.org>
References: <20030118222758.49963.qmail@web41113.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fCmRXBY78W5odcVA"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030118222758.49963.qmail@web41113.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Curtis Hawthorne <cghawthorne@yahoo.com>
Cc: netfilter@lists.netfilter.org


--fCmRXBY78W5odcVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2003 at 02:27:58PM -0800, Curtis Hawthorne wrote:
> Is this a bug in NetFilter (and has it been fixed?), or am
> I doing something wrong?  I don't like the idea of new
> connections being allowed back through the firewall after a
> certain kind of packet has been sent, so any help would be
> greatly appreciated.

  It's doing what you asked it to.  First you make an outgoing
'connection' (actually just a packet as it's UDP) from port 137 to port
137 on the target machine.  ip_conntrack remembers this so as to let any
replies in.  Then the same machine makes a 'new connection' using the
same ports and IPs, just in the other direction.  Other than inspecting
the actual data contents of the packets there's no way a firewall can
tell the difference between a reply to your initial request within the
ip_conntrack timeout, and a new request.

  Personally I just block ALL port 137/138/139 stuff OUTGOING as it's
just too much of a risk IMO.  It's so easy to (mis)configure a windows
machine to go broadcasting NETBIOS all over the place.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--fCmRXBY78W5odcVA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4p/4QACgkQzbc+I5XfxKe+6gCgnEzG6uR8TfQTZ9Pj+2+IE+Gh
wNcAoIhO1VIfxnhaq5rYUbS4nk6KJUkx
=Xf95
-----END PGP SIGNATURE-----

--fCmRXBY78W5odcVA--

