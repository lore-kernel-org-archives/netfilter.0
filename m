From: "F.M. Taylor" <ftaylor1@indstate.edu>
Subject: Re: Best vpn w/ iptables.
Date: Fri, 20 Dec 2002 13:00:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212201300.55133.ftaylor1@indstate.edu>
References: <001201c2a84c$7ec0a350$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c2a84c$7ec0a350$6601a8c0@s3ac>
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
To: Rowan Reid <rreid@studio3arc.com>, 'iptables-list' <netfilter@lists.samba.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am doing exactly that here, VPN between my home and office via FreeS/WA=
N.
I have been working on it for 2 days, and almost have it working correctl=
y. =20
THe documentation leaves a little to be desired, but for the most part I =
have=20
corrected all my problems.  I had to open UDP 500 and protocol 50 an d 51=
 in=20
netfilter.  I thought I had it working but I must of missed something in =
the=20
routing 'cause when It came up it killed the routing on my remote end and=
 had=20
to call my wife and have her reboot the box.  Guess I need to R more of T=
FM,=20
everything seems to be in there, just not in a step by step format.


On Friday 20 December 2002 12:23 pm, Rowan Reid imparted the following wi=
sdom:
> I'm gonna be implimenting a VPN between two offices. Both gateways bein=
g
> the Firewall also. Which uses Netfilter I'm looking for secure straight
> forward routable setup and 100% compatability with netfilter ie not
> pptp. It also has to be open source. I know this isn't a vpn group but =
I
> figured you would have valuable input. Thanks Right now I'm looking at
> freeswan
>
>
>
> Rowan Reid
> Job Captain,
> Systems Administrator
> STUDIO 3 ARCHITECTS
> 909  982  1717

- --=20
Mike Taylor.  GSEC          Non Impediti Ratione Cogitationis
Coordinator of Systems Administration and Network Security
Indiana State University.                      Rankin Hall Rm 039
210 N 7th St.                                           Terre Haute, IN.
Voice: 812-237-8843
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE+A1rXknPysOadsKcRAplOAJ91pvVvX5KLaq/JqANRNiAa03EoVACgj0cM
GNAcLFMjCK++xSTEtm8GULw=3D
=3DhXRi
-----END PGP SIGNATURE-----

