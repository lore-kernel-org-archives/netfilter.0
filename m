From: "Kim Leandersson" <kim.leandersson@chs.chalmers.se>
Subject: RE: ip_conntract_ftp on another port
Date: Sun, 5 Jan 2003 12:00:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A41EB@olga.chs.chalmers.se>
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
To: Tommy McNeely <Tommy.McNeely@Sun.COM>, netfilter@lists.netfilter.org

Try loading the ip_conntrack_ftp module with the option ports instead.

ip_conntrack_ftp ports=3D6969 should do the trick for you!

On my dist (gentoo linux) i have a modules.autoload in /etc.

//kim

> -----Original Message-----
> From: Tommy McNeely [mailto:Tommy.McNeely@Sun.COM]=20
> Sent: Sunday, January 05, 2003 8:16 AM
> To: netfilter@lists.netfilter.org
> Subject: ip_conntract_ftp on another port
>=20
>=20
> is it possible to use ip_conntrack_ftp on another port.. I=20
> dont see any information about doing that in the FAQ, and=20
> there doesnt appear to be an easy way to actually "SEARCH"=20
> the archives ;) .. I would like to run my ftp server on a=20
> strange port (like say 6969) but the conntrack stuff only=20
> appears to work if its on port 21=20
>=20
> Also.. what is the proper way to load these modules..=20
> currently I just have a /sbin/modprobe ip_conntrack_ftp in my=20
> /etc/rc.local file.. is there something I could put into=20
> /etc/modules.conf ??
>=20
> thanks in advance=20
> tommy
>=20
>=20
>=20

