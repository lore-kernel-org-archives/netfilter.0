From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: list user-defined chain names only
Date: Thu, 27 Jan 2005 12:15:58 +0100
Message-ID: <1106824558.4954.5.camel@anduril.intranet.cartel-securite.net>
References: <200501271104.j0RB4dRk025574@mta2.core.infoclip.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501271104.j0RB4dRk025574@mta2.core.infoclip.fr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Filip Moritz <moritz@ieb.net>
Cc: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

Le jeudi 27 janvier 2005 =E0 12:04 +0100, Filip Moritz a =E9crit :
> maybe this's stupid question, but anyways:
> Is there any way to list my chain names only, i.e. not the rules defined =
in
> there?

Euh...

	iptables -L |grep Chain


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

