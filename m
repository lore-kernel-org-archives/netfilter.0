From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Yahoo and MSN messenger problem
Date: Fri, 01 Apr 2005 15:41:23 +0200
Message-ID: <424D4F83.50401@lopsch.com>
References: <1112352008.424d2508ac331@webmail.yanbulink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1112352008.424d2508ac331@webmail.yanbulink.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

wlagmay@yanbulink.net schrieb:
> Hi all,
>=20
> Im using Iptables for routing, redirection and Network Address Translat=
ion
> (SNAT), everything is working fine execpt for yahoo and MSN voice chat.=
 I found
> out that there seems to a problem with SNAT, I cannot use masquerading,=
 I know
> that voice chat will work on masquerading but my requirement is many to=
 many
> IP.
>=20
> Is ther any solution on this issue? I need many local IP address to be =
converted
> to many public IP addresses dynamically.
>=20
> Any information is surely a big help, thank you very much,
>=20
> wennie
>=20
>=20
AFAIK MSN sends informations like the local IP-address within the=20
payload of the voice chat request and therefor also MASQ will not work.=20
I don=B4t know exactly if it is based on h.323 if so perhaps the conntrac=
k=20
module for h.323 helps. If not the possibilities are a working conntrack=20
module for these protocols, a UPnP aware router take a look at=20
http://sourceforge.net/projects/linux-igd/ or perhaps a proxy server on=20
the router. Got the similar problems here but didn=B4t have the time to=20
the opportunities.


