From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: I thought ssh is port #22 ?!!
Date: Thu, 1 Apr 2004 09:20:55 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567928A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>, cldavis@speakeasy.net, netfilter@lists.netfilter.org
Cc: Fajar Priyanto <fajarpri@arinet.org>

Unfortunately I have the "privilage" of maintaining a customer TCP
protocol which cans you if your source and destination ports aren't as
specified by their fcked up protocol!!

-----Original Message-----
From: Martinez, Michael [mailto:MMARTINEZ@CSREES.USDA.GOV]=20
Sent: Thursday, April 01, 2004 7:14 AM
To: cldavis@speakeasy.net; netfilter@lists.netfilter.org
Cc: Fajar Priyanto
Subject: RE: I thought ssh is port #22 ?!!


Port 32873 is the return port on the ssh client.

Here's how it works. The server listens on port 22. The client opens a
connection to the server, and tells the server which return port to use.
If you do "netstat -an" you will see the server talking on port 22, and
the client talking on some high numbered port like 32873. The high
number port used is random. It will change from one session to the next.

This is true not just for ssh - it is true for most tcp applications.

Michael Martinez
Unix System Administrator

-----Original Message-----
From: cldavis@speakeasy.net [mailto:cldavis@speakeasy.net]=20
Sent: Wednesday, March 31, 2004 9:10 PM
To: netfilter@lists.netfilter.org
Cc: Fajar Priyanto
Subject: Re: I thought ssh is port #22 ?!!

You should edit sshd_config with the port command and set it to 22.  If
the directive is not present, I've had some versions of ssh listen on
everything, others only 22. =20

You may also want to use the PermitRootLogin no directive to disable
root logins and use a regular user account to log in and then su to root
if need be.

As far as the firewall, you may want to setup your firewall to drop all
packets except packets sent to needed services.

Hope that helps
Chris
> -----Original Message-----
> From: Fajar Priyanto [mailto:fajarpri@arinet.org]
> Sent: Thursday, April 1, 2004 01:32 AM
> To: netfilter@lists.netfilter.org
> Subject: I thought ssh is port #22 ?!!
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi guys,
> I'm not really sure about this. I thought ssh is made in port #22?=20
> When I made a ssh session into my server, /var/log/messages showed=20
> this: Apr  1 09:20:20 server2 sshd[2711]: Accepted password for root=20
> from 192.168.0.234 port 32873 ssh2
>=20
> Why did it use port #32873?
> Is there something wrong with my ssh or firewall?
> TIA,
> - --
> Fajar Priyanto | Reg'd Linux User #327841 | http://linux.arinet.org
> 08:31:42 up 36 min, Mandrake Linux release 9.2 (FiveStar) for i586=20
> public key: https://www.arinet.org/fajar-pub.key
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.3 (GNU/Linux)
>=20
> iD8DBQFAa3EYkp5CsIXuxqURAluBAKCNiyg8+KXYDu/JuZghSVMXvfrjMgCdG7O2
> Bb4SQcbOiAqALl1o9yQ5H1k=3D
> =3D4uUZ
> -----END PGP SIGNATURE-----
>=20
>=20
>=20




