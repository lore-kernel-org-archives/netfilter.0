From: "Kim Leandersson" <kim.leandersson@chs.chalmers.se>
Subject: RE: ip_conntrack_ftp doesn't work with ftp proxy
Date: Thu, 14 Nov 2002 09:34:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A406A@olga.chs.chalmers.se>
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
To: Thomas Boernert <tb@tbits.net>, netfilter@lists.netfilter.org

Try loading the ip_conntrack_ftp module with the option ports instead.

ip_conntrack_ftp ports=3D8082 should do the trick for you!

//kim

> -----Original Message-----
> From: Thomas Boernert [mailto:tb@tbits.net]=20
> Sent: Wednesday, November 13, 2002 10:55 PM
> To: netfilter@lists.netfilter.org
> Subject: ip_conntrack_ftp doesn't work with ftp proxy
>=20
>=20
> Hello,
>=20
> i hope anyone can help me.
>=20
> network-chart
>=20
> linuxbox ----- firewall ---- internet
>=20
> on the firewall runs a ftp proxy (suse proxy-suite on port=20
> 8082) i've the following rules
>=20
> iptables -A INPUT -p tcp -s $local_net --sport 1024:65535 -d=20
> $firewall_internal_ip --dport 8082 -m state --state=20
> NEW,ESTABLISHED -j ACCEPT
>=20
> ipatbles -A OUTPUT -p tcp -s $firewall_internal_ip --sport=20
> 8082 -d $local_net --dport 1024:65535 -m state --state=20
> ESTABLISHED -j ACCEPT
>=20
> iptables -A INPUT -p tcp -s $local_net --sport 1024:65535 -d=20
> $firewall_internal_ip --dport 1024:65535 -m state ESTABLISHED,RELATED
>=20
> .....
>=20
> from the client i do the following
>=20
> ftp ip_firewall 8082
> login to a ftp server like redhat or so
> do "ls"
> then the kernel rejects the third rule written upper.
>=20
> if i change the rule from RELATED to NEW, the it's working,=20
> but this is not a solution.
>=20
> Thanks for help!
>=20
> - Thomas
>=20
>=20
>=20
>=20

