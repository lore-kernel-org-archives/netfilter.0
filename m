From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables analyzer
Date: Tue, 28 Oct 2003 17:11:11 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: SBlaze <dagent.geo@yahoo.com>, "Earl A.Killian" <netfilter@lists.killian.com>
Cc: netfilter@lists.netfilter.org

In all honesty, the tool may have limited small scale benefits, but the
only way to scale into bigger projects would be to write a firewall
structural design before even implementing the rule structure.

1. The analyzer needs to be able to predict the load of each protocol /
rule match in order to 'order' the rules in the most effective manner.

EG:

Rule #1: 5% of the traffic
Rule #2: 10% of the traffic
Rule #3: 85% of traffic
This is a non-optimized ruleset, but unless the analyzer can use
historical data, the effectiveness of this optimizer is diminished.
Ideally, a history based ruleset analyzer would reorganize the rules in
the following order:

Rule #3
Rule #2
Rule #1
But! Now, this may break the actual logic of the program as well, so you
have to allow for making historical rule adjustments while taking into
account the correctness of the ruleset flow. Making this work for larger
set of rules and for dynamically adjusting based on short term forecasts
would start with head starting to hurt then my going to bed all dizzy
and such.


2. Complex rulesets with large numbers of branches and conditional rules
would cause killer complexity, and the changes to that structure would
blow away any non-trivial iptables ruleset creation tools.

EG:

A->B
A->C (!A->B)
A-R1 (!A->B & !A->C)
A-R2 (!A->B & !A->C & !A-R1)
A-R3 (!A->B & !A->C & !A-R1 & !A-R2)
B-R1 (A->B)
B-R2 (A->B & !B-R1)
B-R3 (A->B & !B-R1 & !B-R2)
B->D (A->B & !B-R1 & !B-R2 & !BR3)
C-R1 (!A->B & A->C)
C->D (!A->B & A->C & !C-R1)
D-R1 (((A->B & !B-R1 & !B-R2 & !BR3)) | (!A->B & A->C & !C-R1))

If you can parse the args, return the correct structural dependencies of
each rule throughout the path to the end of the ruleset then actually
optimize the ruleset for the best efficiency (which can vary depending
on the needs of the firewall), I will surely come visit whatever corner
of the world you are from and offer you a b33r, because you would surely
deserve it!

Remember, the dependencies of each rule are compounded with the existing
rules that did not pass the filter, which is assuming that the jumps
relinquished control over the packet, but as log, some rules pass
control back to the branch changing the packet's state and continues!
All this must be accounted for!


3. Programming in functionality that intelligently uses the iptables
extensions would bloat the program to a dramatic extent.=20

Well, but now, I imagine you get the difficulty of this point as well.


