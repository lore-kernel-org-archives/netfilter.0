From: "Sven-Ake Larsson" <sven-ake.larsson@hiq.se>
Subject: SV: Ports opened without request
Date: Wed, 25 Feb 2004 20:24:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IKEBLEEAACOIAKBCECDDOECICAAA.sven-ake.larsson@hiq.se>
References: <403CD4DF.1070704@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403CD4DF.1070704@stupar.homelinux.net>
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
To: netfilter@lists.netfilter.org


How did you make scan, from the machine itself or from another machine on
the outside? Some rulesets doesn't really work when you are at the same
machine.
Do you allow any ICMP packets? If so, try to drop them too and scan the
machine again.
What is your current ruleset? It helps a lot if you can add it to the list.

I believe you'll have the masters answers soon... ;-)

Regards,
S

-----Ursprungligt meddelande-----
Fran: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]F=F6r Sasa Stupar
Skickat: den 25 februari 2004 18:01
Till: netfilter@lists.netfilter.org
=C4mne: Ports opened without request


Hi!

I have linux RH8 with kernel 2.4.20-28.8, iptables v1.2.8. I have setup
a firewall with some tcp ports opened (21,25,80,110,443) for servers.
Then I have ran a port scan  and scanned all 65535 tcp and udp ports. I
was suprised that 3 ports were opened even if I didn't opened them in
the configuration. These ports are tcp 389,1002 and 1720.
I have tried to block them manually by entering a drop command for these
three ports but no success-they are still open.
What am I missing here? Is this some problem with iptables?

Sasa


