From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Re: Configure my firewall
Date: Thu, 18 Mar 2004 09:57:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079600276.1445.4.camel@anduril.intranet.cartel-securite.net>
References: <20040318074052.C8ED4C165@postfix3-2.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040318074052.C8ED4C165@postfix3-2.free.fr>
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
To: nicolas boussekeyt <nicolas.boussekeyt@free.fr>
Cc: Nick Taylor <nickt@lightlink.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le jeu 18/03/2004 =E0 08:42, nicolas boussekeyt a =E9crit :
> > Well, I don't know how this worm spreads, so I can't help with
> > firewall design, but it seems to me that you might want the LOG
> > rules before the DROP rules, no?
> Yes, it's a problem ?

No, but your script DROP first, and then tries to LOG. So there's
nothing left to log...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

