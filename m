From: "mailinglists" <mailinglists@belfin.ch>
Subject: AW: natting help needed urgently.
Date: Sat, 6 Sep 2003 13:57:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <65F646CE24EBF24AA3714070D537988E06FA62@gargoyle.seaan.net>
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
To: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org


Hi Payal,

just a quick one before I go home again.

In this scenario I woudln't use NAT on the Linux box. Makes things more =
difficult. Don't forget to set a route on your router with gw linuxbox =
to subnet windowsbox.=20

HTH
Philipp

> I have asked this before but nobody responded. Is this un-do-able?
> I have a windows box which is on intertnal ip 192.168.10.3. I want the
> outside world to access the servers (ftp, http, smtp, pop3) from it.
> The scene is something like this,
>=20
>=20
> +----------+       +--------------+         +---------------+
> |          +---><--+ Linux        +---->--<-+win2k          |
> |router    |       |  (1.2.3.4)   |         | (192.168.10.3)|
> +----------+       +--------------+         +---------------+
>                                  =20
> I am not able to redirect any request for windows box from=20
> outside world
> to internal machine 192.168.10.3
>=20
> Please help me to solve this problem.
>=20
> Waiting eagerly for any help on this.
>=20
> With warm regards,
> -Payal
>=20
> --=20
> "Visit GNU/Linux Success Stories"
> http://payal.staticky.com
> Guest-Book Section Updated.
>=20
>=20

