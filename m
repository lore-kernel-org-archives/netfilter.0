From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 20:26:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063736809.783.62.camel@elendil.intranet.cartel-securite.net>
References: <BAY8-F93kuutSgcOrBL0000ec1b@hotmail.com>
	 <Pine.LNX.4.53.0309161040220.4397@xena.cft.ca.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0309161040220.4397@xena.cft.ca.us>
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
To: Jim Carter <jimc@math.ucla.edu>
Cc: Chua Boon Ping <nitb@hotmail.com>, netfilter@lists.netfilter.org

Le mar 16/09/2003 =E0 19:46, Jim Carter a =E9crit :
> I'm not sure what you mean by a "halted firewall".  Do you mean that th=
e
> kernel uses the "halt" instruction when there is no work to do?

Nope.
An halted firewall is a firewall that is halted, i.e. you have executed
"halt" command. Box is configured not to send halt signal to ATX supply
so it is still powered and network stuff is not killed (interfaces up,
ruleset not flushed, etc.). As kernel is still alive, your box can
continue it's routing/filtering tasks as they're handled within kernel.

But, you won't have the ability to log onto the firewall to update rules
or have applications running (no logs).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

