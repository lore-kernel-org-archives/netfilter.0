From: "Kim Leandersson" <kim.leandersson@chs.chalmers.se>
Subject: RE: FTP connection trackung
Date: Mon, 27 Jan 2003 11:59:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A42F1@olga.chs.chalmers.se>
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
To: Axel Heinrici <heinrici76@gmx.de>, netfilter@lists.netfilter.org

Load the ip_conntrack_ftp as a module with the ports argument. If you
have your ftp on 2121, load it like this:

ip_conntrack_ftp ports=3D2121

//kim


> -----Original Message-----
> From: Axel Heinrici [mailto:heinrici76@gmx.de]=20
> Sent: Monday, January 27, 2003 10:47 AM
> To: netfilter@lists.netfilter.org
> Subject: FTP connection trackung
>=20
>=20
> Hi
>=20
> I have a problem making passive FTP-connections on non standard port.=20
> Login is no problem but I cannot transfer any data. I am=20
> sitting behind=20
> a firewall. It is no problem to connect to ftp-servers outside on=20
> standard port.=20
> It seems that FTP-conntrack doesn't track these non-standard=20
> connections. How can I teach netfilter to track these=20
> non-standard-ftp-connections?
>=20
> greetings
> 	Axel
>=20
>=20

