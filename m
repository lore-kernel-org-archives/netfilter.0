From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: iptables analyzer
Date: Wed, 29 Oct 2003 16:24:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E1011990A3@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39E30.C0CE5F78"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C39E30.C0CE5F78
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It gets more interesting if you consider this: I would like to create =
rules solely based on my needs, including making rules per machine. Then =
have this 'tool' use the mathematical concept of domains to distill the =
minimal rule-set. (This is about rules overlapping needlesly).
=20
Gaby

-----Original Message-----
From: Jeffrey Laramie [mailto:JALaramie@Loudoun-Fairfax.com]
Sent: woensdag 29 oktober 2003 6:34
To: netfilter@lists.netfilter.org
Subject: Re: iptables analyzer


This is interesting stuff. I'm not a programmer or an expert, but as a =
longtime user I have a couple thoughts:

Daniel Chemko wrote:


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



 =20


You would have to have a complete dataset from every packet that passes =
netfilter to run any kind of rule analysis. Knowing which rule dropped a =
packet isn't the same as knowing exactly which condition of that rule =
caused the drop. Could be iface, dport, sport, etc. You would almost =
have to duplicate the logic of netfilter itself to do any meaningful =
analysis at this level. However I think a simpler but still useful tool =
could be created by using the packet and byte count kept by netfilter to =
sort rules within chains


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

 =20


Yeah, this is going to be tough but keep in mind that most people don't =
want to change the logic of their rules. Creating a routine that models =
potential changes in program flow is a whole nother ballgame and =
specifying the flow logic you're trying to achieve would be far more =
effort than doing it yourself. IMHO an analyzer should assume that no =
rule change should be allowed to change the logical flow of the rules. =
It should only be allowed to test for efficiency within chains or =
perhaps recommend new chains that improve efficiency without changing =
the final rule destination of the packet. Otherwise the analyzer would =
surely break your logic and then you'd be really screwed. Given this =
constraint the task becomes much more manageable.


If you can parse the args, return the correct structural dependencies of

each rule throughout the path to the end of the ruleset then actually

optimize the ruleset for the best efficiency (which can vary depending

on the needs of the firewall), I will surely come visit whatever corner

of the world you are from and offer you a b33r, because you would surely

deserve it!

 =20


Only one b22r?



Remember, the dependencies of each rule are compounded with the existing

rules that did not pass the filter, which is assuming that the jumps

relinquished control over the packet, but as log, some rules pass

control back to the branch changing the packet's state and continues!

All this must be accounted for!



 =20


Like I said, I don't think this level of analysis is realistic or even =
desirable. On the other hand a tool that parses your rules for obviously =
poor design (established, related rule at end of chain or not there at =
all, rules that can never be reached, etc.), and then optimizes the =
efficiency of the rules within each chain based on historical data would =
be useful for unsophisticated users (like me!)


3. Programming in functionality that intelligently uses the iptables

extensions would bloat the program to a dramatic extent.=20



Well, but now, I imagine you get the difficulty of this point as well.





 =20


The phrase walk before you run comes to mind, and good luck to anyone =
who takes on this project.  :-)

Jeff



------_=_NextPart_001_01C39E30.C0CE5F78
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE></TITLE>

<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR></HEAD>
<BODY text=3D#000000 bgColor=3D#ffffff>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D392202215-29102003>It=20
gets more interesting if you consider this: I would like to create rules =
solely=20
based on my needs, including making rules per machine. Then have this =
'tool' use=20
the mathematical concept of domains to distill the minimal rule-set. =
(This is=20
about rules overlapping needlesly).</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D392202215-29102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D392202215-29102003>Gaby</SPAN></FONT></DIV>
<BLOCKQUOTE>
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Jeffrey Laramie=20
  [mailto:JALaramie@Loudoun-Fairfax.com]<BR><B>Sent:</B> woensdag 29 =
oktober=20
  2003 6:34<BR><B>To:</B> =
netfilter@lists.netfilter.org<BR><B>Subject:</B> Re:=20
  iptables analyzer<BR><BR></FONT></DIV>This is interesting stuff. I'm =
not a=20
  programmer or an expert, but as a longtime user I have a couple=20
  thoughts:<BR><BR>Daniel Chemko wrote:<BR>
  <BLOCKQUOTE =
cite=3Dmid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com=20
  type=3D"cite"><PRE wrap=3D"">In all honesty, the tool may have limited =
small scale benefits, but the
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

  </PRE></BLOCKQUOTE><BR>You would have to have a complete dataset from =
every=20
  packet that passes netfilter to run any kind of rule analysis. Knowing =
which=20
  rule dropped a packet isn't the same as knowing exactly which =
condition of=20
  that rule caused the drop. Could be iface, dport, sport, etc. You =
would almost=20
  have to duplicate the logic of netfilter itself to do any meaningful =
analysis=20
  at this level. However I think a simpler but still useful tool could =
be=20
  created by using the packet and byte count kept by netfilter to sort =
rules=20
  within chains<BR>
  <BLOCKQUOTE =
cite=3Dmid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com=20
  type=3D"cite"><PRE wrap=3D"">2. Complex rulesets with large numbers of =
branches and conditional rules
would cause killer complexity, and the changes to that structure would
blow away any non-trivial iptables ruleset creation tools.

EG:

A-&gt;B
A-&gt;C (!A-&gt;B)
A-R1 (!A-&gt;B &amp; !A-&gt;C)
A-R2 (!A-&gt;B &amp; !A-&gt;C &amp; !A-R1)
A-R3 (!A-&gt;B &amp; !A-&gt;C &amp; !A-R1 &amp; !A-R2)
B-R1 (A-&gt;B)
B-R2 (A-&gt;B &amp; !B-R1)
B-R3 (A-&gt;B &amp; !B-R1 &amp; !B-R2)
B-&gt;D (A-&gt;B &amp; !B-R1 &amp; !B-R2 &amp; !BR3)
C-R1 (!A-&gt;B &amp; A-&gt;C)
C-&gt;D (!A-&gt;B &amp; A-&gt;C &amp; !C-R1)
D-R1 (((A-&gt;B &amp; !B-R1 &amp; !B-R2 &amp; !BR3)) | (!A-&gt;B &amp; =
A-&gt;C &amp; !C-R1))
  </PRE></BLOCKQUOTE><BR>Yeah, this is going to be tough but keep in =
mind that=20
  most people don't want to change the logic of their rules. Creating a =
routine=20
  that models potential changes in program flow is a whole nother =
ballgame and=20
  specifying the flow logic you're trying to achieve would be far more =
effort=20
  than doing it yourself. IMHO an analyzer should assume that no rule =
change=20
  should be allowed to change the logical flow of the rules. It should =
only be=20
  allowed to test for efficiency within chains or perhaps recommend new =
chains=20
  that improve efficiency without changing the final rule destination of =
the=20
  packet. Otherwise the analyzer would surely break your logic and then =
you'd be=20
  really screwed. Given this constraint the task becomes much more=20
  manageable.<BR>
  <BLOCKQUOTE =
cite=3Dmid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com=20
  type=3D"cite"><PRE wrap=3D"">If you can parse the args, return the =
correct structural dependencies of
each rule throughout the path to the end of the ruleset then actually
optimize the ruleset for the best efficiency (which can vary depending
on the needs of the firewall), I will surely come visit whatever corner
of the world you are from and offer you a b33r, because you would surely
deserve it!
  </PRE></BLOCKQUOTE><BR>Only one b22r?<BR><BR>
  <BLOCKQUOTE =
cite=3Dmid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com=20
  type=3D"cite"><PRE wrap=3D"">Remember, the dependencies of each rule =
are compounded with the existing
rules that did not pass the filter, which is assuming that the jumps
relinquished control over the packet, but as log, some rules pass
control back to the branch changing the packet's state and continues!
All this must be accounted for!

  </PRE></BLOCKQUOTE><BR>Like I said, I don't think this level of =
analysis is=20
  realistic or even desirable. On the other hand a tool that parses your =
rules=20
  for obviously poor design (established, related rule at end of chain =
or not=20
  there at all, rules that can never be reached, etc.), and then =
optimizes the=20
  efficiency of the rules within each chain based on historical data =
would be=20
  useful for unsophisticated users (like me!)<BR>
  <BLOCKQUOTE =
cite=3Dmid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com=20
  type=3D"cite"><PRE wrap=3D"">3. Programming in functionality that =
intelligently uses the iptables
extensions would bloat the program to a dramatic extent.=20

Well, but now, I imagine you get the difficulty of this point as well.


  </PRE></BLOCKQUOTE><BR>The phrase walk before you run comes to mind, =
and=20
  good luck to anyone who takes on this project.&nbsp;=20
:-)<BR><BR>Jeff<BR></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C39E30.C0CE5F78--

