From: "John A. Sullivan III" <John.Sullivan@nexusmgmt.com>
Subject: Re: Routing and PREROUTING
Date: Mon, 12 Jul 2004 11:18:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F2ABB7.2080801@nexusmgmt.com>
References: <20040712145806.GA30044@itstud.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040712145806.GA30044@itstud.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Erik_Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Cc: netfilter@lists.netfilter.org

Erik Wikstr=F6m wrote:
> Hi again
>=20
> I'm probably thinking to much here but I've got a bit of a problem with
> allowing traffic from my local network out to the Internet. Currently
> I've got the following rules which should do that:
>=20
> # Allow traffic from LAN to WAN
> $IPT -t nat -A PREROUTING -i $LAN -s $LOCAL_NET -j ACCEPT
> $IPT -t filter -A FORWARD -i $LAN -o $WAN -s $LOCAL_NET -j ACCEPT
> $IPT -t nat -A POSTROUTING -o $WAN -s $LOCAL_NET -j MASQUERADE
>=20
> My problem is with the first rule, where I'm uding the "nat" table but
> I'm not doing any NATing, more like filtering since I only pass some
> packets. And filtering is not supposed to be done in the "nat" table bu=
t
> on the other hand there is no filter table in PREROUTING.
>=20
> But the alternative would be to have a ACCEPT policy in the
> PREROUTING-chain and do all the filtering in the FORWARD-chain, which i=
s
> kind of unnecessary since a number of packets would then have to travel
> through a number of rules (larger than the number of rules in the
> PREROUTING-chain) just to be droped in the end. So is my rule OK to use
> or would you do in any other way?
>=20
> --
> Erik Wikstr=F6m
Hmmm . . . someone correct me if I'm wrong but I think your first rule=20
will end processing in the nat table but the packet will still pass to=20
the FORWARD table where, if it does not match a rule, it will be handled=20
by your FORWARD chain policy - John
--=20
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net

