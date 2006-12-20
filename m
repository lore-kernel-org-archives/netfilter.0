From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Wed, 20 Dec 2006 04:42:11 +0100
Message-ID: <1166586131.32182.6.camel@anduril.intranet.cartel-securite.net>
References: <45860240.2040102@riverviewtech.net>
	<1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>
	<4587B400.6080206@rtij.nl>
	<1166526302.12238.12.camel@anduril.intranet.cartel-securite.net>
	<4588351F.1040806@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4588351F.1040806@rtij.nl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Martijn Lievaart <m@rtij.nl>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Grant Taylor <gtaylor@riverviewtech.net>

Le mardi 19 d=E9cembre 2006 =E0 19:53 +0100, Martijn Lievaart a =E9crit :
> ICMP filtering is not tricky. Just remember the rules.
> 1) NEVER, EVER, EVER filter out fragmentation needed.

;)

> 2) You may filter out ping, and the various destination unreachables,=20
> the consequences are yours.

Actually, Fragmentation Needed is one of various Destination Unreachable
message... Type 3, code 4.

> 3) Everything else can be filtered without consequences.

Time Exceeded ?

> If you mean, it is hard for a firewall to filter malicious ICMPs but not=20
> beneign ICMPs, the we agree.=20

That was my point.

> I have not heard of an fragmentation needed attack yet, but I can
> imagine it happening (analogous to the zero windowsize attack).

You can use Frag Needed to degrade performances. See section 7 of:

http://www.gont.com.ar/drafts/icmp-attacks/draft-ietf-tcpm-icmp-attacks-01.=
txt

You can also use Source Quench.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

