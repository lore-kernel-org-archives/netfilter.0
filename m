From: "Simon A. Boggis" <simon@dcs.qmul.ac.uk>
Subject: Re: TCP delay, SMTP errors
Date: 11 Jun 2002 11:41:03 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023792070.960.7.camel@hal9000>
References: <001601c210bf$d1a5fef0$2901a8c0@amos> 
	<3D052994.CD0F1237@planetconnect.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-BmLH/jtJHzO2SRJqWrTw"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D052994.CD0F1237@planetconnect.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--=-BmLH/jtJHzO2SRJqWrTw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-06-10 at 23:35, Doug Monroe wrote:
> Nathan Cassano wrote:
> >         Our website (on an internal NAT'ed network) connects our email
> > server (on an external network). The website uses a SMTP PHP class to
> > send mail using socket connections. The problem is a delay in connectin=
g
> > to the mail server that causes the class to quit prematurely. I fixed
>
> what happens when you use telnet from the website box to the mail server'=
s
> port 25? do you get a delay rec'ving the SMTP banner? Likely has nothing =
to do
> with netfilter...my money's on a paranoid SMTP trying to do a reverse DNS
> lookup (or identd?) causing the delay. Maybe there's no PTR record for th=
e NAT
> (public) IP of the website? Maybe your SMTP server has a big-ish list of =
DNS
> hosts to try before it finally timesout?

My first suspicion would be a timing out ident from the mail server.

I always send rejects on port 113/tcp (ident) for this reason. Some MTAs
absolutely insist on doing an ident (or timing out trying) before they
accept your mail.

It could be useful to tcpdump at your firewall/router, or on the machine
doing the smtp connection (if no border filtering) and see what is going
on.

Simon

--=20
----------------------------------------------------------------------
Dr Simon A. Boggis                                  Systems Programmer
Department of Computer Science,                     Tel. 020 7882 7522
Queen Mary, University of London, London E1 4NS UK.=20
---- GPG public key <http://www.dcs.qmul.ac.uk/~simon/#publickey> ----

--=-BmLH/jtJHzO2SRJqWrTw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9BdO/C8auviztJ4cRAhYGAJwMzDKkpPzeyM7h6FySn68qYSoOtACaA/XN
YtdL0maSAHrO2ohJf0JiGoA=
=ADIi
-----END PGP SIGNATURE-----

--=-BmLH/jtJHzO2SRJqWrTw--


