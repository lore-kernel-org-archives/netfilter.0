From: "k bah" <kbah@linuxmail.org>
Subject: Re: Match specific netbios flag?
Date: Thu, 17 May 2007 09:43:39 +0800
Message-ID: <20070517014341.1F84E2477C@ws5-3.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> ----- Original Message -----
> From: "Jorge Davila" <davila@nicaraguaopensource.com>
> To: "k bah" <kbah@linuxmail.org>, netfilter@lists.netfilter.org
> Subject: Re: Match specific netbios flag?
> Date: Wed, 16 May 2007 18:14:48 -0600
>=20
>=20
> May you must try something different instead of iptables.
>=20
> For loggin the connection/disconnection is enough the configuration=20
> of the loggin in the smb configuration file.

 No samba running here.

>=20
> If you really want monitoring may you want use Nagios.

 I'll take a look, thanks. The logging will also be for statistics purposes=
, since our network was setup a few weeks ago I want to keep track of thing=
s while it's not stable. As I didn't find no netbios name service flags on =
the iptables manual (there are tcp flags), I asked. Didn't find documentati=
on on ip_conntrack_netbios_ns neither, but I gave this one a brief search.

 thanks!

=3D


--=20
Powered by Outblaze

