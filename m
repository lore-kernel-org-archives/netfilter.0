From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Mon, 14 Nov 2005 10:09:37 -0500
Message-ID: <4378A8B1.8010206@rosi-kessel.org>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig06C31A1CF30674E45AD92981"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig06C31A1CF30674E45AD92981
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Jozsef Kadlecsik wrote:
>>   - do not show up in /proc/net/ip_conntrack. There in fact are no
>>     inbound entries at all in /proc/net/ip_conntrack for the IP addres=
s of the
>>     remote server or for any traffic on port 500 at all.
> Double-check it ;-).

Okay--would it be sufficient to grep on port 500? conntrack tracks by por=
t,
right? So as long as there are *no* entries in ip_conntrack for port 500 =
at
any point while I'm trying to make this connection, doesn't it mean that
conntrack isn't handling the packets?

>> I even added a raw table and a NOTRACK destination to packets travelli=
ng
>> on port 500 to every chain in the raw table. Still, the packets do not=

>> show up in nat PREROUTING.
> If you add a NOTRACK rule for the packets in the raw table, then conntr=
ack
> will skip those packets and in consequence NAT will skip them as well: =
NAT
> is built on top of conntrack.

Ah, okay, I didn't understand that.

>> Any suggestions for how to figure out why they're not getting to nat
>> PREROUTING?  Or are they perhaps being tracked in a way that I am not
>> noticing?
> Remove the NOTRACK rules from the raw table. Double check the mangle ta=
ble
> for possible matching DROP targets, including the default policies. Do =
the
> same with the nat table as well.

The NOTRACK rules were just one test--I am not using them generally. So,
yes, they are removed.

As far as drop targets: for testing purposes, I am clearing all of the
tables of all rules, setting the default policy for all rules as ACCEPT, =
and
then just trying to see these inbound packets in the nat PREROUTING table=
=2E
So I am certain they are not being DROPped along the way.

The simplest possible test involves only one or two rules--SNAT'ing outbo=
und
packets to the WAN IP, and then (attempting to) DNAT inbound packets on p=
ort
500 to the LAN IP of the proper machine. But because the inbound packets
don't enter the nat table, they never get DNAT'ed; and they are also not
routed to the proper machine with conntrack either.

I should also mention that all other NAT stuff works fine with this setup=
,
including FTP (passive and active), web browsing, etc..  I am also able t=
o
DNAT inbound ssh connections to another internal machine.  It's only thes=
e
inbound udp port 500 that are somehow not entering the nat table or showi=
ng
up anywhere other than in mangle PREROUTING.
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig06C31A1CF30674E45AD92981
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDeKixdTf3ZklQ6qYRAh1tAJ4keW1LLOH1KJ873kiyRWizclWKAgCguCZd
zWO3HMAgR5QJAeeJMAuv5xM=
=LG0u
-----END PGP SIGNATURE-----

--------------enig06C31A1CF30674E45AD92981--

