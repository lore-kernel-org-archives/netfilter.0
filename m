From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: blocking by domain
Date: Sun, 13 Jun 2004 10:29:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087115340.1891.2.camel@anduril.intranet.cartel-securite.net>
References: <200406122127.i5CLR0bJ009276@ylpvm15.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406122127.i5CLR0bJ009276@ylpvm15.prodigy.net>
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
To: Spiro Azkoul <spiro@snacorp.net>
Cc: netfilter@lists.netfilter.org

Le sam 12/06/2004 =E0 23:27, Spiro Azkoul a =E9crit :
> Is it possible to block any packets that ride on a specific domain by
> domain? I know blocking is possible based on IP/Subnet, but wanted to
> double-check the domain

Unless you use a dedicated userspace application using QUEUE target to
reverse lookup source and/or destination IP, you can't.

Netfilter is a paquet filter and works on IP, not names. Moreover, I
think it would generate too much latency if you had to check DNS for
packets at firewall level.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

