From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP and conntrack
Date: Mon, 16 May 2005 13:58:05 +0200
Message-ID: <1116244685.5363.43.camel@anduril.intranet.cartel-securite.net>
References: <6A0C419392D7BA45BD141D0BA4F253C776DF@loureiro.madeiratecnopolo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6A0C419392D7BA45BD141D0BA4F253C776DF@loureiro.madeiratecnopolo.pt>
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
To: Clemente Aguiar <caguiar@madeiratecnopolo.pt>
Cc: netfilter@lists.netfilter.org

Le lundi 16 mai 2005 =E0 12:21 +0100, Clemente Aguiar a =E9crit :
> On a TCP or UDP protocol, if there are communication problems a ICMP
> "responses" are generated.

ICMP messages are genetrated to handle IP problems, regardless which
layer 4 protocol is used. TCP has its own mechanisms to handle layer 4
errors.
Exception mode of ICMP port unreachable for UDP...

> Does conntrack handle all ICMP "responses" correctly?

Yes they are, with RELATED state.

> Shouldn't these messages be handled by conntrack as "RELATED" or
> "ESTABLISHED" and be let through the firewall and therefore not be logged
> (i.e. dropped)?

They should. However, you may have a look at your conntrack table to see
if thoses packets do actually match existing entries.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

