From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPS - iptables
Date: Wed, 25 Aug 2004 18:52:08 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093452728.2391.12.camel@anduril.intranet.cartel-securite.net>
References: <20040825164626.6334110FC31@firewall.gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040825164626.6334110FC31@firewall.gateway10.homeip.net>
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
To: stu@gateway10.homeip.net
Cc: netfilter@lists.netfilter.org

Le mer 25/08/2004 =E0 18:47, stu a =E9crit :
> Does anyone know of any Intrusion Presion Systems for iptables / linux.
> Deep packet inspection.
> I need to interigate traffic for specific's, such as worms, viruses, et=
c.

See Snort Inline at http://snort-inline.sourceforge.net/.

All packets are sent to Snort for ruleset based analysis filtering.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

