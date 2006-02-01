From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: netfilter Digest, Vol 18, Issue 29
Date: Tue, 31 Jan 2006 22:45:07 -0500
Message-ID: <20060201034506.GD15311@bostoncoop.net>
References: <20060131183135.1FB42A01EF@bostoncoop.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20060131183135.1FB42A01EF@bostoncoop.net>
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
To: netfilter@lists.netfilter.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2006 at 16:33:52 +0100, Boryan Yotov <yotov@prosyst.com>
wrote:
> 1. In this version of the script I see no "clear" option, but only
> "stop" and "status". Could you try "./wondershaper stop" and check
> if it fix the problem. Or probably you have a newer one.

Oh, yes, there is definitely a clear option now:

   if [ "$1" =3D=3D "clear" ];
   then
      tc qdisc del dev $DEV root    2> /dev/null > /dev/null
      tc qdisc del dev $DEV ingress 2> /dev/null > /dev/null
      echo Wondershaper queues have been cleared.
      exit
   fi

> 2. The wondershaper is using kilobits instead of kilobytes. If you
> have a 700 kilobytes uplink, then you'll have to set UPLINK equal
> to 5600. The same is valid for DOWNLINK.

Yes, I understand that.  I'm not throttling downlink at all on the NAT
box--I have it set to something like 10000.

>   + If the wondershaper's DEV is accidently set to match your
>     internall interface
>   AND
>   + You did wrote 700 instead of 5600 as UPLINK value
>   THEN
>=20
>   =3D You'll have these 700 kbytes limited to exactly 70 kbytes for
>     all HTTP responses going to your LAN clients.

I agree that it does seem very suspicious that the internal clients are
being throttled on HTTP to almost exactly what wondershaper is supposed
to throttle outbound traffic on the external facing interface.

But: it is definitely the same behavior with wondershaper cleared. Both
of the following give empty responses (after 'wondershaper clear' is
run):

tc class show dev eth0
tc class show dev eth1

And I definitely know which interface is inward facing and which is
outward facing. The inward facing one is 192.168.98.50, the outward
facing one is 72.1.169.236. There's not really any way that I could have
that backwards. :)

The other thing is that wondershaper, when in place, definitely throttles
port 80 and port 22 to the same bitrate; but the problem I'm experiencing
for internal clients is only on port 80. I really don't have anything
anywhere in my network that would discriminate in bandwidth between the
two ports.
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFD4C7CdTf3ZklQ6qYRAp/zAKDIIkUbTI2TrCJ5rSQ1Gs1/04/bZQCgqFIA
za4oiTI4exoJMEXeblWPrmc=
=fBxb
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

