From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Fri, 12 Aug 2005 14:52:18 -0400
Message-ID: <42FCEFE2.2030509@rosi-kessel.org>
References: <42FA1BBD.6060806@rosi-kessel.org>
	<5d2f379105081211357e8d558a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigAD0ACAF463BF5D5FF6CA3726"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f379105081211357e8d558a@mail.gmail.com>
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
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigAD0ACAF463BF5D5FF6CA3726
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for your response:

curby . wrote:
>> iptables -t nat -A PREROUTING -i eth0 -s 10.1.1.2 -d 10.1.1.3 \
>>         -p tcp --dport ssh -j DNAT --to 192.168.98.4
> In your hypothetical above, all three hosts were on the same subnet.=20
> If in fact your realtarget is on another subnet (as it is in this
> command), then all you need is DNAT and your source address/port will
> be kept.  If all three hosts are on the same network, or the source
> and realtarget are on the same network, then you will need a SNAT rule
> as shown here:

In reality, userbox, faketarget, and realtarget, are all on different
subnets.

> A single line to DNAT is all that should be necessary for DNAT between
> different subnets (as long as your FORWARD chain allows it).  SNAT is
> definitely not required to get it to work.  If it doesn't work, likely
> you have a bad setup somewhere.  HOWTO might help:

Based on other messages in this thread, it appears that the problem is
that reply packets are going directly back to userbox rather than
through faketarget and thus are being dropped.  I guess the proxy needs
to go both ways, but also be invisible. This is what I'm having trouble
figuring out.

>> Is this possible?  Am I asking the wrong question?
> You didn't say why you're doing this, or what else your firewall setup
> has.  If it's for auditing/eavesdropping, there are certainly other
> ways to do it.  If all three hosts are on the same network, the client
> could simply go directly to realserver.

The main purpose is to facility relocation of a server to a new subnet
with zero downtime while DNS changes propagate. Any client that is still
getting the old IP address should be transparently routed to the new one.=

--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enigAD0ACAF463BF5D5FF6CA3726
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFC/O/idTf3ZklQ6qYRAhhhAJ9snA3Gd5/64n2ByGzJkXnsnroatgCgwn+z
ceUY+8AWxc1WpIM4bxOkD28=
=Kquq
-----END PGP SIGNATURE-----

--------------enigAD0ACAF463BF5D5FF6CA3726--

