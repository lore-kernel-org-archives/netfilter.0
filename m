From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 18:57:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063731433.784.25.camel@elendil.intranet.cartel-securite.net>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
	 <200309161256.15286.gdh@acentral.co.uk>
	 <1063716386.31093.160.camel@raylinux.internal>
	 <20030916131153.GA16559@cannon.eng.us.uu.net>
	 <1063720447.31093.166.camel@raylinux.internal>
	 <20030916141505.GB16559@cannon.eng.us.uu.net>
	 <plopm3isnshj1n.fsf@drizzt.kilobug.org>
	 <20030916155001.GE16559@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030916155001.GE16559@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: =?ISO-8859-1?Q?Ga=EBl?= Le Mignot <kilobug@freesurf.fr>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Le mar 16/09/2003 =E0 17:50, Ramin Dousti a =E9crit :
> > Can I ask you why do you want  to turn off the conntrack?
> I don't. I just wanted to learn from the people who were saying "just d=
on't
> load the ip_conntrack..."

I assume that if someone wants to fallback on stateless filtering is for
saving load on his box. I can miss something, but I really don't see
another reason. Once ip_conntrack is loaded, all packets are tracked
anyway, weither you use state match or not. Yes, one can write a whole
stateless ruleset with conntrack running, but what's the point : the
cost implied by a rule with state matching and one without is the same,
as state flaging is done anyway !

That's why assuming that stateless is for save load implies ip_conntrack
module removal. But, as it relies on conntrack, NAT is broken. It is as
simple as this.

So, the remaining question is "why does OP wants to fallback to
stateless filtering". If answer is "to save load", then he will have to
remove ip_conntrack. If answer is... Well, I don't know, anything else,
such as "I like writing weak ruleset for fun with powerful tools", then
not using state matching will be sufficient.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

