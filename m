From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: NAT and VPN
Date: Thu, 03 Jun 2004 14:00:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086285637.4564.3.camel@localhost>
References: <CBBC84AC3E18304C98492272A68D61117C5917@thor.envisagenow.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <CBBC84AC3E18304C98492272A68D61117C5917@thor.envisagenow.com>
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
To: Derek Storvik <dstorvik@consultech.net>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-06-03 at 12:53, Derek Storvik wrote:
> I=E2=80=99m having trouble with NAT and VPN  =20
>=20
> =20
>=20
> I have a linux server running Fedora core 1   that is a
> NAT/FIREWALL/VLAN/DHCP server for a large client network.
>=20
> =20
>=20
> Internet
>=20
>   |
>=20
>   |
>=20
> Linux
>=20
>   |
>=20
>   |
>=20
> Large network with many vlans and 1000 nodes or so.
>=20
> =20
>=20
> =20
>=20
>  The internal network is natted to the 10.0.0.0 network and my clients
> can not VPN out to the internet.   Specifically they get back an error
> 619
>=20
> What has to be done to allow VPN to traverse through the firewall and
> NAT?   at the moment the firewall rules are wide open to make sure
> that isn=E2=80=99t my issue.=20
<snip>
A few questions . . .=20
What type of VPN are they attempting to access?

I assume they are using some kind of VPN client and you are not talking
about a site to site connection.  What client are they using?

If you are using an IPSec client, one either needs to give each a
dedicated one-to-one mapped public address or use NAT Traversal (must be
enabled on both sides of the connection).

Are you sure that the client is comfortable allowing people on the
inside to VPN to some connection on the outside? There is a real
possibility that whatever is on the other side will now be able to
access your client's internal network through the same VPN connection.
> =20
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


