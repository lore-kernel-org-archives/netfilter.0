From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
	rules
Date: Sat, 11 Oct 2003 18:26:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031010132641.2591d3b5.netfilter@lucassen.org>
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
To: netfilter@lucassen.org
Cc: netfilter@lists.netfilter.org

Le ven 10/10/2003 =E0 13:26, richard lucassen a =E9crit :
> I want all traffic on port 80 be handled by a userdefined chain
> "CH_WWW". Now my question: What is better, this way (I let the port
> 80 packets jump first, then I have _two_ ESTABLISHED,RELATED rules, as
> well in the INPUT as in the CH_WWW chain):
>=20
> ********************************************************************
> ${IPT} -A INPUT -p tcp --dport 80 -j CH_WWW
> ${IPT} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> [..]
>=20
> And an extra ESTABLISHED,RELATED in the CH_WWW:
> ${IPT} -A CH_WWW -m state --state ESTABLISHED,RELATED -j ACCEPT
> ${IPT} -A CH_WWW (first rule)
> [..]
> ********************************************************************
>=20
> or this (I have _one_ ESTABLISHED,RELATED rule, and then let port 80=20
> jump):
>=20
> ********************************************************************
> ${IPT} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> ${IPT} -A INPUT -p tcp --dport 80 -j CH_WWW
> [..]
>=20
> And an extra ESTABLISHED,RELATED in the CH_WWW:
> ${IPT} -A CH_WWW (first rule)
> [..]
> ********************************************************************
>=20
> Both ways work, but I'd say the second way is the best. Am I right?

I agree.
To me, theses two rulesets are equivalent for HTTP packets, but first
one implies one more rule evaluation than the second one for ESTABLISHED
packets that are destined to TCP/80.

PS : there's no RELATED packets in HTTP ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

