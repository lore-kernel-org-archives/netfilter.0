From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
	rules
Date: Sun, 12 Oct 2003 21:02:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065985353.4924.64.camel@elendil.intranet.cartel-securite.net>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
	 <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
	 <20031011194527.17273de9.netfilter@lucassen.org>
	 <20031012111620.GB571@pcw.home.local>
	 <20031012195331.409596fc.netfilter@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031012195331.409596fc.netfilter@lucassen.org>
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
To: reply2@lucassen.org
Cc: netfilter@lists.netfilter.org

Le dim 12/10/2003 =E0 19:53, richard lucassen a =E9crit :
> Ok, but that does not answer my question ;-) Maybe I'm not so clear
> in saying what I mean. Let me put it this way: Does the
> ESTABLISHED,RELATED rule of the FORWARD chain handles all
> ESTABLISHED,RELATED packets of a connection which was accepted as NEW i=
n
> a "child" chain? I think the answer is finally "yes".

Well, because I di not really answer this very question, the answer is
yes, because packet state does not depend on rules. I mean a packet is
flaged with its state and carries this within all Netfilter framework,
regardless rules and chains.

So, if a packet is ESTABLISHED, then it is ESTABLISHED all the way,
regardless prior NEW packet as been matched (or not) in a builtin or
user chain. Rules have no effect on state.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

