From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: How to drop an idle connection with iptables?
Date: Thu, 24 Nov 2011 06:30:17 -0500
Message-ID: <jal9sa$t42$1@dough.gmane.org>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB5BB8F524127F83293FF7CCA"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECE125F.8090101@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB5BB8F524127F83293FF7CCA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11-11-24 04:46 AM, lu zhongda wrote:
> Hi Brian:

Hi Lu,

>     At least, I hope iptables can confirm whether a connection is idle
> or not by its rules, this is the key point of my problem.

Perhaps there is a module which can do this but perhaps not because what
you are proposing will actually break protocols based on TCP.

>     I have used conntrack of iptables, it seems not work.

iptables' conntrack works exactly as it should.  When it sees a TCP
session go to ESTABLISHED (i.e. TCP 3-way handshake is completed) it
allows packets on that session and continues to do so until the session
is destroyed with FIN and/or RST packets.

To start dropping/rejecting packets before that TCP session is shutdown
will break the protocol that is running on the socket because it expects
the session to still be open.

You didn't answer my other question though, which is why do you think
you need to be dropping idle, yet still ESTABLISHED sessions (and
breaking higher level protocols when you do that)?

b.


--------------enigB5BB8F524127F83293FF7CCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk7OKskACgkQl3EQlGLyuXDx4gCg+y+PlskTJSqdGs0VFyljt1h4
DSUAn3yzuXaxYPM7zWEF1vCRHP1SsfPD
=XQWM
-----END PGP SIGNATURE-----

--------------enigB5BB8F524127F83293FF7CCA--

