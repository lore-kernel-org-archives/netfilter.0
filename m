From: "Kim Leandersson" <kim.leandersson@chs.chalmers.se>
Subject: RE: non-standard FTP ports and connection tracking
Date: Mon, 9 Dec 2002 23:01:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A414C@olga.chs.chalmers.se>
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
To: Alexandros Papadopoulos <apapadop@cmu.edu>, netfilter@lists.netfilter.org

Put the line:
ip_conntrack_ftp ports=3D2121=20
In your modules.autoload, when it should work fine for you.

//kim


> -----Original Message-----
> From: Alexandros Papadopoulos [mailto:apapadop@cmu.edu]=20
> Sent: Monday, December 09, 2002 10:46 PM
> To: netfilter@lists.netfilter.org
> Subject: non-standard FTP ports and connection tracking
>=20
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi. I have a small problem with ftp_conntrack module (I guess).
>=20
> Scenario:
> =3D=3D=3D=3D=3D=3D
> I run iptables 1.2.6a and an ftp server (publicfile) on a machine=20
> directly connected to the Internet. Connection tracking works=20
> fine when=20
> the ftp server listens on the standard port (21), but seems to break=20
> when I set the ftp server to listen to a non-standard high port (say,=20
> 2121).
>=20
> I set both incoming and outgoing default action to DROP, load the=20
> connection tracking modules in my firewall script:
>=20
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp
>=20
> and try to allow traffic for my ftp server only.
>=20
> What happens:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> If the ftp server uses port 21 (standard setup), it works fine:
>=20
> [] ftpd listening on port 21
> [] client connects -> connection from high port to my 21 is=20
> established [] client requests directory listing ->=20
> connection from my high port to=20
> another high port of the client is established
>=20
> Rules: (all defaults are DROP)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> ## Allow connections to our ftp server
> /sbin/iptables -A INPUT -p tcp --dport 21 -j ACCEPT
>=20
> ## Allow data for incoming FTP to return back to sender=20
> /sbin/iptables -A OUTPUT -p tcp --sport 21 --dport 1024: -m state=20
> - --state ESTABLISHED,RELATED -j ACCEPT
>=20
> ## Allow outgoing FTP (data) + HTTP replies
> /sbin/iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m state=20
> - --state ESTABLISHED,RELATED -j ACCEPT
>=20
>=20
> The problem:
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> But, when I set the server to listen to port 2121...:
>=20
> [] ftpd listens on 2121
> [] client connects -> connection from high port to my 2121=20
> established [] client requests directory listing -> netfilter=20
> drops packets for the=20
> new (but related) connection that tries to be established, and user=20
> never sees the directory listing. Last packets that gets=20
> through is the=20
> one that carries the "150 Making transfer connection..." message.
>=20
> The rules in this case have only the port number changed, but=20
> here they=20
> are in case I'm doing something wrong:
>=20
> ## Allow connections to our ftp server
> /sbin/iptables -A INPUT -p tcp --dport 2121 -j ACCEPT
>=20
> ## Allow outgoing FTP (data) + HTTP replies!
> /sbin/iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m state=20
> - --state ESTABLISHED,RELATED -j ACCEPT
>=20
> ## Allow data for incoming FTP to return back to sender=20
> /sbin/iptables -A OUTPUT -p tcp --sport 2121 --dport 1024: -m state=20
> - --state ESTABLISHED,RELATED -j ACCEPT
>=20
>=20
> Any ideas?
>=20
> - -A
> - --=20
> http://andrew.cmu.edu/~apapadop/pub_key.asc
> 3DAD 8435 DB52 F17B 640F  D78C 8260 0CC1 0B75 8265
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
>=20
> iD8DBQE99Q8ugmAMwQt1gmURApAKAJwJtYh0HFT9A5IX2xI8hVICwydt8QCeNLti
> lE569iwhEPzYdRw4zHnsWAQ=3D
> =3DTM8O
> -----END PGP SIGNATURE-----
>=20
>=20
>=20
>=20

