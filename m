From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: A practical problem regarding  IP Accounting ...?
Date: Mon, 8 Mar 2004 17:02:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F0B@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: toto eucup <toteucup@yahoo.de>, netfilter@lists.netfilter.org

# Outbound to PC
iptables -t mangle -A PREROUTING -i eth1 --source <ip_address>
# Inbound to PC
iptables -t mangle -A POSTROUTING -o eth1 --destination <ip_address>

Then use your own accounting tool to rip the byte count from "iptables =
-t mangle -nvxL". Remember though, the byte count can reset or overflow =
to 0, so make sure your accounting package can handle this.

toto eucup wrote:
> I have 32 IP ADDRESSE 11.22.33.64-96
> 11.22.33.65 Router (cisco) I do not have access on it
> Big Brother proprerty-- BELL you know already :( ...
> :)
>=20
>=20
>=20
> My linux box 2 net interface
> 11.22.33.66 running DNS on eth0 and
> 11.22.33.67 on eth1
>=20
>=20
> Here comes the scenario:
> Betwen the router and Swich is my machine and I want
> all the trafic to go through my Linux Box to be able
> to account the trafic per IP addres.
>=20
>               ROUTER -->INPUT<-- eth0
> My Linux Box: eth0-->Accounting FILTER<--eth1
>               eth1-->SWITCH<--  11.22.33.68 to 95
>=20
>=20
> I want to be able  in my linux box to measure trafic
> for all the station which are pluged in switch from 68
> to 95
>=20
> Thanks for an eventual complet solution.
>=20
>=20
>=20
>=20
>=20
> I tried to do so
>=20
>  [INTERNET] -->[ ROUTER:11.22.33.65] -->[ eth0(66)
>  --eth1(67)] -->[HUB/switch]--> [station ([68].. to
>  [95])]
>=20
> How can I masure the trafic on each IP address in 68
> to 95 range using your software.
>=20
>=20
>=20
>=20
>=20
>=20
> Mit sch=F6nen Gr=FC=DFen von Yahoo! Mail - http://mail.yahoo.de

