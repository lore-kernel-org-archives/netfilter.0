From: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Subject: Re: Setup for an Access Point
Date: Mon, 6 Sep 2004 16:45:18 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <50f03b9704090607451c40e39f@mail.gmail.com>
References: <413C6A02.7020504@4Dllc.com>
Reply-To: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413C6A02.7020504@4Dllc.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Comfort <steve@4dllc.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 06 Sep 2004 15:45:38 +0200, Steve Comfort <steve@4dllc.com> wrote:
> Hi All,
>=20
> Could anyone perhaps suggest a script to use in conjunction with a
> bridge (ebtables/iptables combination)? I am trying (unsuccessfully) to
> firewall a linux access point with one wlan and one eth interface...

You need to allow forwarding "between" the bridge and for filtering
"inside" the bridge you'll need physdev-in and physdev-out instead of
-i and -o.

As an example:


# allow forwarding between the interfaces in the bridge but only for ports =
> 100

BRIDGE_IF=3Dbr0

$IPTABLES -A FORWARD -p TCP -i $BRIDGE_IF -o $BRIDGE_IF --dport 1:100 -j DR=
OP
$IPTABLES -A FORWARD -p UDP -i $BRIDGE_IF -o $BRIDGE_IF --dport 1:100 -j DR=
OP

$IPTABLES -A FORWARD -p ALL -i $BRIDGE_IF -o $BRIDGE_IF -j ACCEPT

## at this point, all traffic between ALL the interface in the bridge can b=
e=20
## forwarded, except for udp and tcp connections going to a=20
## port <=3D 100 (just an example, you don't need to include that :) )

## now some further restrictions. All interfaces following must have
## been added using brctl addif to the bridge
## for the example, assume the ifs eth1, ath0  and tap0 are in the bridge


# if coming from device tap0 (VPN) don't allow to go to ath0 (WLAN)
## make new chain
$IPTABLES -N fromtap
## if coming from tap0 jump to chain fromtap
$IPTABLES -A FORWARD -m physdev --physdev-in tap0 -j fromtap
## if going to device ath0, drop
$IPTABLES -A fromtap -m physdev --physdev-out ath0 -j DROP
## if going to device eth0, allow
$IPTABLES -A fromtap -m physdev --physdev-out eth0 -j ACCEPT
## drop everything else
$IPTABLES -A fromtap -j DROP


Of course you can use all other matches that are valid. The important
thing is that generic forwarding of the bridge is allowed (FORWARD -i
bridge -o bridge) and that you need to filter on devices that are *in*
the bridge using physdev. When in doubt, add -j LOG at the end of your
Chains and look what gets logged before (hopefully) the default policy
drop.

Hope that helps

--=20
C U

     - -- ---- ----- -----/\/  Ren=E9 Gallati  \/\---- ----- --- -- -

