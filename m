From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Packets missing state ?
Date: Wed, 24 Dec 2003 08:48:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072251318.767.10.camel@elendil.intranet.cartel-securite.net>
References: <200312231828.59518.rajiv@theargoncompany.com>
	 <200312231907.58135.vinayakm@theargoncompany.com>
	 <1072187752.809.114.camel@elendil.intranet.cartel-securite.net>
	 <200312240942.40069.vinayakm@theargoncompany.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312240942.40069.vinayakm@theargoncompany.com>
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
To: Vinayakam Murugan <vinayakm@theargoncompany.com>
Cc: netfilter@lists.netfilter.org

Le mer 24/12/2003 =E0 05:12, Vinayakam Murugan a =E9crit :
> How can i uniquely identify such packets so that I don't log them and j=
ust=20
> drop them? Is this possible?=20

Yes you can. Just remove the logging rule.

> My primary objective is to log suspicious packets only. Any pointers on=
 how I=20
> can do that?

The thing with suspicious packets is they're only suspicious... That
means you cannot be sure that they're really malicious, so you can't
drop them. Practically, you'll get far more false positive than real
badly crafted packets.
You can spot what you feel suspicious, but afterwards, you'll have to
analyse your logs in order to see if they're malicious or not. In your
case, they don't seem to be (to me).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

