From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Iptables Tutorial 1.1.19 by Oskar Andreasson
Date: Mon, 15 Sep 2003 13:58:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063627093.931.40.camel@elendil.intranet.cartel-securite.net>
References: <20030912165030.86144.qmail@web40705.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030912165030.86144.qmail@web40705.mail.yahoo.com>
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
To: Michael Anderson <mathtoot@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le ven 12/09/2003 =E0 18:50, Michael Anderson a =E9crit :
> I have recieved an error called: "Unknown arg
> `--state'" from linux=20

You have to call a match before you try to use its options. --state
belongs to state module, so you have to call it before, using -m.

cbr@elendil:~$ sudo iptables -A INPUT --state NEW -j ACCEPT
iptables v1.2.8: Unknown arg `--state'
Try `iptables -h' or 'iptables --help' for more information.
cbr@elendil:~$ sudo iptables -A INPUT -m state --state NEW -j ACCEPT

So use "-m state --state [etc.]".

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

