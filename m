From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ipt_tos.ko vs ipt_TOS.ko
Date: Thu, 29 Apr 2004 17:08:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083251298.4884.100.camel@anduril.intranet.cartel-securite.net>
References: <D3DD55FDB74AD511BA5100500416368053E88C@ORION>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053E88C@ORION>
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
To: Jochen Vogel <jvogel@it-sec.de>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Le jeu 29/04/2004 =E0 16:55, Jochen Vogel a =E9crit :
> Whats the differents between ipt_tos.ko and ipt_TOS.ko?

ipt_tos.ko is kernel side module for TOS matching (tos match) and
ipt_TOS.ko is kernel side module for TOS mangling (TOS target).

As a general rule, matches are lowercase and targets are uppercase. This
rule also applies to iptables shared .so libraries.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

