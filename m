From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: H323 and Traffic Control
Date: 25 Oct 2002 17:08:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035558500.8847.6.camel@elendil>
References: <H4JC9N$8B17FEF3457390EDE1EF6BC9A0A4266D@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <H4JC9N$8B17FEF3457390EDE1EF6BC9A0A4266D@laposte.net>
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
To: "yves.metivier" <yves.metivier@laposte.net>
Cc: netfilter <netfilter@lists.netfilter.org>

Le ven 25/10/2002 =E0 13:36, yves.metivier a =E9crit :
> I was expecting that h323 netfilter module should mark all=20
> h323 traffic, including RTP and RTCP UDP packets, but it seems=20
> that it only marks packets from known ports (those explicitely=20
> declared in iptables), and not UDP related packets.

H323 module's goal is to declare what kind of packets are expected by
H323 flows to have them given the RELATED state. And that's all.

If you want to mark thoses packets, then you'll have to do it yourself.
The main Netfilter distribution does not provide matches to do it well,
but you'll find helper pacth in submitted section of iptables 1.2.7a
patch-o-matic. This patch creates a new match called helper that allows
you to spot packets that are handled by a specific conntrack module. I
didn't tried what you want to do, but I think this can do the trick :

	iptables -t mangle -A PREROUTING -m helper --helper h323 \
		-j MARK --set-mark 0x01
=20
> Is my analyse right?

Nope ;)
Conntrack is something particular in Netfilter. It gives state to
packets, and then, it's up to you to use this state value to achieve
what you want to do.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

