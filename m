From: Sandy C <sc_netfiltermail@yahoo.com>
Subject: Re: bridge/ebtables/iptables interaction question
Date: Tue, 23 Mar 2004 18:25:10 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040324022510.72338.qmail@web60004.mail.yahoo.com>
References: <1080085546.1439.227.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080085546.1439.227.camel@anduril.intranet.cartel-securite.net>
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
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

That didn't work either. I wonder if its my kernel
version. I'm running:

Kernel: 2.4.20-6
patch: ebtables-brnf-3_vs_2.4.21.diff (applied 3/16)
       Latest POM (12/03: applied 3/22)
IPTables: 1.2.9
EBTables: 2.0.6

From the docs, the br-nf code is required for iptables
to see the bridge traffic. I'm wondering if the order
in which I applied the patches matters. I'll go take a
look at that, but if you folks have any hints I'd much
appreciate it!

Merci beaucoup,
S C

--- Cedric Blancher <blancher@cartel-securite.fr>
wrote:
> Le mar 23/03/2004 =E0 22:16, Sandy C a =E9crit :
> > iptables -A INPUT -m physdev --physdev-in eth1 -p
> tcp
> > --destination-port 2049 -j LOG
> [...]
> > iptables -A INPUT -m physdev --physdev-in eth2 -p
> tcp
> > --source-port 2049 -j LOG
> [...]
> > I must be missing something though because I get
> > nothing in my logs.
> [...]
> > what could I be doing wrong?=20
>=20
> Bridged traffic goes through FORWARD chain, for it's
> not destined to
> your box.
>=20
>=20
> --=20
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint:
> FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature
> virus.
> >> Copy me to your signature file and help me
> spread!
>=20


__________________________________
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
http://taxes.yahoo.com/filing.html

