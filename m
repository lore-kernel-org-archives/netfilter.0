From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: ready to cry over NATting!
Date: 20 May 2003 19:18:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053451097.27975.136.camel@kermit.spenneberg.de>
References: <20030520102957.GA98543@justpickone.org>
	<1053440382.1993.117.camel@kermit.spenneberg.de> 
	<20030520155813.GA33081@justpickone.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030520155813.GA33081@justpickone.org>
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
To: David T-G <davidtg-netfilter@justpickone.org>
Cc: NetFilter Users' List <netfilter@lists.netfilter.org>

Dear David,

> % >   iptables -A FORWARD -i eth1 -o eth1 -j REJECT
> % What are you trying to achieve?
> % These rules do not allow any traffic through your firewall (Forward
> % REJECT).
>=20
> As I said, I was lifting from the HOWTO :-)  I thought that that rule
> rejected anything coming in on eth1 (external interface) that was due to
> go back out on eth1.
Sorry my mistake. You are right. I apparently assumed you meant -i eth1
-o eth0.

> I'm not sure why I want to do postrouting going out the LAN interface; I
> thought that NAT was for internal machines trying to get out.  I *think*
> that what I want is SNAT =3D=3D source translation, and the NAT HOWTO doe=
sn't
> talk about DNAT =3D=3D destination translation so I don't know that it's
> needed -- but, of course, also don't really know about what I'm speaking.

>=20
> [Oh, phooey -- I just realized that I had a typo, and you're obviously
> going from what I wrote!  eth0 is the LAN and eth1 is the WAN; sorry!]
Ok. lets get this straight. You are protecting internal clients which
want to access the internet. You need Source NAT and the NAT rules are
applied in the Postrouting chain on the external interface:

EXTIF=3Deth1
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

> This is one test case that I didn't try since the firewall was otherwise
> locked up.
What do you mean be locked up?
>=20
>=20
> % >   Goal 2: Allow various connections and confirm that they work
> % Now you are trying to filter. The filter table has three chains. Each
> % chain with a specific task:
> % INPUT only filters packets with the local machine as destination
>=20
> Oh, INPUT from any interface; OK.
>=20
>=20
> % OUTPUT only filters packets originating on the local machine
> % FORWARD only sees those packets not covered by INPUT and OUTPUT being
> % forwarded by the firewall.
>=20
> OK.  But this FORWARD is different from the NAT forward, right?
There is no nat FORWARD chain. The nat table only has: PREROUTING and
OUTPUT for Destination NAT and  POSTROUTING for Source NAT.=20
Defining a rule in POSTROUTING only defines the NAT not the filterrules
>=20
> I'm close, I think.  I'd start with
>=20
>   # flush everything
>   iptables -t filter -F ; iptables -t mangle -F ; iptables -t nat -F
>   # allow masquerading
>   iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
> to just forward packets from inside clients and then perhaps add
>=20
>   # outbound connections through
>   iptables -t filter -A FORWARD -i eth0 -o eth1 -m match --match NEW -j A=
CCEPT
>   # returning connections through
>   iptables -t filter -A FORWARD -m match --match RELATED,ESTABLISHED -j A=
CCEPT
Do not forget to turn routing on:
echo 1 > ...
>=20
> to allow things like pings to go out and in.  Then I'd need
>=20
>   # incoming to
>   iptables -t filter -A INPUT ACCEPT
>=20
> to just let everything going to the box -- like my ssh -- get there.  Not
> yet secure, but a start, right?
Yes. But if you just want to allow ssh and web do the following:
# Allow ssh and web access to the firewall box
iptables -t filter -A INPUT -i $EXTIF -m match NEW,RELATED,ESTABLISHED
-j ACCEPT
# Allow the firewallbox to answer
iptables -t filter -A OUTPUT -o $EXTIF -m match RELATED,ESTABLISHED -j
ACCEPT

# Block everything else
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT DROP
iptables -t filter -P FORWARD DROP


Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

