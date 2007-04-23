From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Subject: RE: Iptables rule on span traffic
Date: Sun, 22 Apr 2007 20:48:20 -0700
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B01DFB16F@pmi00exf00.us.packetmotion.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>	<1177172639.25008.1.camel@anduril.intranet.cartel-securite.net><E8AFFEFDBE97C94E9297963F0527A07B01DFB0EC@pmi00exf00.us.packetmotion.com>
	<462A8014.6000105@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <462A8014.6000105@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@lists.netfilter.org



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pascal =
Hambourg
Sent: Saturday, April 21, 2007 2:20 PM
To: netfilter@lists.netfilter.org
Subject: Re: Iptables rule on span traffic

Hello,

Krishnamoorthy (Siva) Sivakumar a =E9crit :
>=20
> When I run this rule, and try to access a .txt file (with a web
> browser on a different machine) on the machine running the iptables, I
> get a log message and the file access is blocked. However, if I try to
> do the same but for a .txt file residing on a third machine (machine
> running iptables is able to see the related packets on its interface
> connected to the span port), I see no log or blocking.=20

As C=E9dric said, packets which are not destined to the box do not go=20
through the INPUT chains. And since the box is not forwarding traffic,=20
these packets are dropped at the input routing decision stage and do not =

go through the FORWARD chains either.

[Siva:]=20
Then is it true that for iptables rules to be effective (fwsnort =
generated or otherwise), the machine must be "inline". Is there no way =
to implement iptables rules on "mirrored" traffic.=20

Siva

