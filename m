From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: What is the protocol number of NETBIOS over IEEE 802.2
	ethernet?
Date: Mon, 14 Jun 2004 10:58:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087225096.5254.46.camel@localhost>
References: <000001c451ed$a84bb790$1d01a8c0@palettemm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c451ed$a84bb790$1d01a8c0@palettemm.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: bassam@palettemm.com
Cc: netfilter@lists.netfilter.org

On Mon, 2004-06-14 at 04:57, Bassam A. Al-Khaffaf wrote:
> Hi Guys,
>=20
>    I am trying to DNAT the netbios broadcast traffic
> (03:00:00:00:00:01) over IEEE 802.2 ethernet. So is there any number
> for this protocol so I can use it with my iptables rule?
>=20
> =20
>=20
> Note: I am asking for netbios protocol over IEEE 802.2 ethernet and
> not over Ethernet II
>=20
> =20
>=20
> For example:
>=20
> =20
>=20
> iptables =E2=80=93t nat =E2=80=93A PREROUTING -i eth1 =E2=80=93p netbios =
=E2=80=93j DNAT
> =E2=80=93to-destination 192.168.1.231
>=20
<snip>
NetBIOS generally uses three different protocols:

NetBIOS datagram service - 138 /udp - most data transmission

NetBIOS name service - 137 /udp - probably what you need for
registration

NetBIOS session service - 139 /tcp - I'm not sure what uses session
oriented NetBIOS

As I mentioned in response to your previous post, I generally try to
avoid the use of NetBIOS broadcasts and far prefer a name server
approach on both routed and bridged networks.

--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net=20


