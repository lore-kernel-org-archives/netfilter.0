From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Iptables rule on span traffic
Date: Sat, 21 Apr 2007 09:23:59 -0700
Message-ID: <1177172639.25008.1.camel@anduril.intranet.cartel-securite.net>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
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
To: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Cc: netfilter@lists.netfilter.org

Le vendredi 20 avril 2007 =E0 12:13 -0700, Krishnamoorthy (Siva) Sivakumar
a =E9crit :
> Anyone have any idea what I need to do to have iptables rule to act on
> SPAN traffic. Tcpdump on eth1 does show traffic that the loaded
> iptables rules should catch. Am I missing something in the way I have
> set things up?

Check the chain where your rules are created. Like FORWARD or INPUT. And
if it eventualy fits your needs:

	. INPUT for traffic destined to your machine
	. FORWARD for traffic it should route


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

