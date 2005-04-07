From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: firewall protocols
Date: Fri, 08 Apr 2005 00:30:42 +0200
Message-ID: <1112913042.9836.2.camel@anduril.intranet.cartel-securite.net>
References: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
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
To: Ted Gervais <ve1drg@av.eastlink.ca>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le jeudi 07 avril 2005 =E0 16:27 -0300, Ted Gervais a =E9crit :
> I have just discovered that people are not able to telnet to my system an=
d=20
> I have been told that it is not because I don't have the necessary ports=20
> open but rather the problem is because of protocols??

Do you have IPv6 support ? It's a quite common issue with people using
an IPv6 connection not to configure their firewall for this protocol
using ip6tables. Then, they're firewalled for IPv4, but all naked
towards IPv6.

It can be something else, so I think you should post your ruleset.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

