From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Dropping network "noise"
Date: Sun, 13 Feb 2005 13:03:45 +0100
Message-ID: <1108296226.10876.16.camel@nostromo.bgsecm.com>
References: <200502130928.41225.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200502130928.41225.e-boogie@yandex.ru>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

El dom, 13-02-2005 a las 09:28 +0300, Mikhail Zotov escribi=C3=B3:
> Hello everybody,
>=20
> I have a Linux machine (with a static routable IP address)
> connected to a windoops LAN.  As is known, there is certain
> "noise" in windoops networks, which can be silently dropped
> by a rule like this:
>=20
> iptables -A INPUT -p udp --dport 135:139 -j DROP

That's OK, but also DROP port 445 because there's also a great
amount of traffic in that port.

> I have found that this "noise" can also be effectively blocked
> by the following rule:
>=20
> iptables -A INPUT -d ! $IP.ADDRESS.OF.MY_BOX -j DROP

Yes, it's a rule to prevent spoofing. It's OK *if* and *only if*
the $IP.ADDRESS.OF.MY_BOX it's really the IP address of your
box, and the *only* IP address of your box (you can have more
than one for various reasons).

> I haven't noticed anything going wrong yet, still I'd like to
> know: Does this rule have a (potential) drawback?  Can it break
> anything in case I have NFS or obtain IP address via DHCP or
> in any other situation?

NFS doesn't have any problem, but if you receive your IP via
DHCP you must change the IP in the rule with the one received.
And also if you use Zeroconf you must have a rule to accept
the traffic for the Zeroconf IP.

> A similar question goes for the case of a Linux router/gateway
> protecting a LAN (with machines with routable IP addresses).
> Can the following rules do any harm?
>=20
> iptables -A FORWARD -i $EXTERIOR_INTERFACE -d $LAN.BROADCAST -j DROP

If you are don't want to receive traffic your broadcast it's OK.

> iptables -A FORWARD -i $EXTERIOR_INTERFACE -d ! $LAN.IP.ADDRESSES.RANGE=
 -j DROP

And this it's another anti-spoofing rule. I'll tell you the same that
for the previous rule. It's OK if the $LAN.IP.ADDRESSES.RANGE it's OK.

> Thanks in advance!
>=20
> --
> Mikhail

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



