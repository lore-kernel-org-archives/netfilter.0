From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: FORWARD rules
Date: Fri, 12 Sep 2003 12:35:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063362901.887.39.camel@elendil.intranet.cartel-securite.net>
References: <20030910175253.GA2752@linux.local>
	 <1063260568.26703.1.camel@risingsun.penguindia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063260568.26703.1.camel@risingsun.penguindia.com>
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
To: tkvishy@yahoo.com
Cc: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org

Le jeu 11/09/2003 =E0 08:09, Vishwanatn T. K. a =E9crit :
> You need to add NEW state in the above FORWARD rule for this to work.
> $IPTABLES -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

It will let is firewall wide open.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

