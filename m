From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Subject: RE: Iptables rule on span traffic
Date: Sat, 21 Apr 2007 12:44:43 -0700
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B01DFB0EC@pmi00exf00.us.packetmotion.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
	<1177172639.25008.1.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <1177172639.25008.1.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org


The thing is, the machine running the iptables is not really a firewall =
nor is it "inline". It is simple sitting on the network and sees the =
traffic mirrored to it from a span port. So it nominally does not =
forward any packets.=20

Here is a sample shell script that fwsnort generates (for a simple rule =
to block .txt files through port 80 --- just testing, not a meaningful =
rule).=20

############################################
$IPTABLES -A FWSNORT_FORWARD -p tcp --dport 80 -m string --string ".txt" =
--algo bm -m comment --comment "msg: test; FWS:
0.9.0;" -j LOG --log-ip-options --log-tcp-options --log-prefix "[1] REJ =
SID1000002 "

$IPTABLES -A FWSNORT_FORWARD -p tcp --dport 80 -m string --string ".txt" =
--algo bm -j REJECT --reject-with tcp-reset

$IPTABLES -A FWSNORT_INPUT -p tcp --dport 80 -m string --string ".txt" =
--algo bm -m comment --comment "msg: test; FWS:0.
9.0;" -j LOG --log-ip-options --log-tcp-options --log-prefix "[1] REJ =
SID1000002 "

$IPTABLES -A FWSNORT_INPUT -p tcp --dport 80 -m string --string ".txt" =
--algo bm -j REJECT --reject-with tcp-reset

###
############ Jump traffic to the fwsnort chains. ############
###
$IPTABLES -I FORWARD 1 -i ! lo -j FWSNORT_FORWARD
$IPTABLES -I INPUT 1 -i ! lo -j FWSNORT_INPUT
$IPTABLES -I OUTPUT 1 -o ! lo -j FWSNORT_OUTPUT
###########################################

When I run this rule, and try to access a .txt file (with a web browser =
on a different machine) on the machine running the iptables, I get a log =
message and the file access is blocked. However, if I try to do the same =
but for a .txt file residing on a third machine (machine running =
iptables is able to see the related packets on its interface connected =
to the span port), I see no log or blocking.=20

Thanks,
Siva

-----Original Message-----
From: Cedric Blancher [mailto:blancher@cartel-securite.fr]=20
Sent: Saturday, April 21, 2007 9:24 AM
To: Krishnamoorthy (Siva) Sivakumar
Cc: netfilter@lists.netfilter.org
Subject: Re: Iptables rule on span traffic

Le vendredi 20 avril 2007 =E0 12:13 -0700, Krishnamoorthy (Siva) =
Sivakumar
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
PGP KeyID: 157E98EE FingerPrint: =
FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

