From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: How to allow Real Player
Date: Wed, 13 Aug 2003 13:24:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030813202402.GA11672@home.tig-grr.com>
References: <000c01c35b2e$2de52100$d90315ac@rsrc.be.local> <000001c3614e$e5eeed50$0400a8c0@bradmorgan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000001c3614e$e5eeed50$0400a8c0@bradmorgan>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Brad Morgan <B-Morgan@concentric.net>
Cc: "'Netfilter (E-mail)'" <netfilter@lists.netfilter.org>


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please note most of the following discussion applies to RTSP in general, not
just RealPlayer.

On Tue, Aug 12, 2003 at 09:56:31PM -0600, Brad Morgan wrote:
> I'm trying to understand how to setup my firewall to allow Real Player.
> Based on the text below, I've written the following rules:=20
>=20
> ## Allow Real Player
> for i in $LANIPS; do
>   iptables -A FORWARD -p tcp -s $i --dport 554 -j ACCEPT
>   iptables -A FORWARD -p tcp -s $i --dport 7070 -j ACCEPT
> done
> iptables -A FORWARD -p udp --dport 6970:6979 -j ACCEPT
>=20
> I limited the number of UDP ports to a much smaller range than they sugge=
st.

The RTSP protocol normally uses TCP port 554.  Port 7070 is for an old
proprietary protocol called PNA that has been deprecated for over 5 years.
You may still run into it occasionally, but hopefully that is rare.

RTSP is a control protocol.  It does the equivalent of the play/pause/stop
buttons.  The actual data can flow either in separate UDP packets (this is
preferred), or interleaved within the same TCP connection as RTSP.

> What I don't understand is the statement "The range of UDP ports, on the
> other hand, carries the incoming stream. These ports begin to carry traff=
ic
> only after RealPlayer and RealServer have performed the authentication
> routine, and should be enabled only for incoming traffic."
>=20
> Is the firewall going to know what to do with an incoming packet to one of
> these UDP ports?  If the internal machine initiated the conversation, then
> ESTABLISHED would know what to do, but that would be outgoing traffic whi=
ch
> the documentation says won't happen.

When using UDP, the server usually starts sending packets to the client
first.  This means that the NAT does not have a chance to create a mapping
between client and server, so it doesn't know where to send the UDP packets=
.=20
Newer clients are getting around this problem with techniques such as STUN
and Symmetric RTP, but most clients don't have this ability.

> Is this another one of those applications that needs a "helper"?  Does one
> exist?  I looked but couldn't find it.

Bingo!  :-)

In order to solve this problem, you need to use an RTSP ALG (helper module)=
.=20
I wrote one for the 2.4.21-preX kernels some months ago.  It's not been
updated in some time due to lack of response.  The changes to get the patch
running on the released 2.4.21 kernel are fairly trivial.  You can download
it here:

	http://home.tig-grr.com/rtsp/index.html

Only 2.4.21-preX is listed at the moment.  I plan to update the module at
some point in the near future and support various kernel versions.=20
Eventually it would be nice to get the module into the Linux kernel.

> Strange thing is, the user's web cast worked after adding the above rules,
> but capturing the traffic using Ethereal didn't show any UDP traffic at a=
ll,
> only TCP and RSTP on 554.  I did however, see realplayer.exe listening on
> UDP port 6970.

Typically, the client will realize after a few seconds that it's not getting
any packets and switch over to TCP mode.  Some of the more intelligent
clients (such as RealONE players) will remember which servers are not
accessible via UDP and they won't attempt UDP from that server again for
some time.  This is may be why you aren't seeing any UDP packets from the
server on any arbitrary request.

--=20
I've finally learned what "upward compatible" means.  It means we get to
keep all our old mistakes.
        -- Dennie van Tassel

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj86nmIACgkQFMm9uvwPXW5uwACgjjLK+Omd3e2ZjwQmb/8xB5NB
aaMAoIVQuASGX0cNHzfG0J8T+CsFQpth
=KpUf
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

