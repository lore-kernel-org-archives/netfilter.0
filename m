From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: cbq.init and iptables NAT routing
Date: 03 Oct 2002 21:12:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033672321.682.12.camel@elendil>
References: <Pine.LNX.4.33.0210030928220.22286-100000@ts1.alberni.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0210030928220.22286-100000@ts1.alberni.net>
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
To: Aaron Clausen <maureen-taocow@alberni.net>
Cc: netfilter@lists.netfilter.org

Le jeu 03/10/2002 =E0 18:30, Aaron Clausen a =E9crit :
> I am running Linux 2.4.5 with two Ethernet cards as a NAT router (using
> iptables).  I downloaded the cbq.init script so that I could try shapin=
g the
> traffic coming from and going to the internal network.  I am also using
> iptables for IP accounting.  I can shape traffic on ETH1, which is the
> inside NIC, but I cannot shape the traffic going out on ETH0.  None of =
the
> traffic reaches my classes.  Is there any known incompatabilities betwe=
en
> cbq and iptables?

No, I am not aware of such things, and I use cbq.init on a quite regular
basis.

You have to be very careful to where your packets are NATed and where
traffic shaping is acting. You also need to know exactly what kind of
rule you have to use in cbq.init.

Example :

	iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -j SNAT --to 10.0.0.1

OK. Inner interface will be eth1 (attached to 192.168.10.0/24) and the
other one is eth0 (10.0.0.1).
Traffic shaping is done at last routing point, between FORWARD and
POSTROUTING, R2 below :

--> PREROUTING --> R1 --> FORWARD --> R2 --> POSTROUTING

So, when packets are going outside, I will match packets that are
sourced from 192.168.10.0/24 :

RULE=3D192.168.10.0/24,

	!! as written in doc, pay attention to comma at the end of the
	!! rule, for it means we specify source address

And when packets are returning, they've been denated somewhere nere
PREROUTING, so have 192.168.10.0/24 as destination :

RULE=3D192.168.10.0/24

	!! no more comma, we give destination

So, to be quick, be careful to ending comma when you specify source
addresses, and be very careful of what kind of NAT you do. SNAT is
"after" shaping, while DNAT is "before" (considering original way).

Imho, you must have set up your eth0 rule with SNAT address, which does
not work, as explained below.

Hope this helps.

--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

