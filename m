From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables analyzer
Date: Wed, 29 Oct 2003 00:34:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9F5163.5020805@Loudoun-Fairfax.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
This is interesting stuff. I'm not a programmer or an expert, but as a
longtime user I have a couple thoughts:<br>
<br>
Daniel Chemko wrote:<br>
<blockquote type="cite"
 cite="mid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com">
  <pre wrap="">In all honesty, the tool may have limited small scale benefits, but the
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

  </pre>
</blockquote>
<br>
You would have to have a complete dataset from every packet that passes
netfilter to run any kind of rule analysis. Knowing which rule dropped
a packet isn't the same as knowing exactly which condition of that rule
caused the drop. Could be iface, dport, sport, etc. You would almost
have to duplicate the logic of netfilter itself to do any meaningful
analysis at this level. However I think a simpler but still useful tool
could be created by using the packet and byte count kept by netfilter
to sort rules within chains<br>
<blockquote type="cite"
 cite="mid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com">
  <pre wrap="">
2. Complex rulesets with large numbers of branches and conditional rules
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
D-R1 (((A-&gt;B &amp; !B-R1 &amp; !B-R2 &amp; !BR3)) | (!A-&gt;B &amp; A-&gt;C &amp; !C-R1))
  </pre>
</blockquote>
<br>
Yeah, this is going to be tough but keep in mind that most people don't
want to change the logic of their rules. Creating a routine that models
potential changes in program flow is a whole nother ballgame and
specifying the flow logic you're trying to achieve would be far more
effort than doing it yourself. IMHO an analyzer should assume that no
rule change should be allowed to change the logical flow of the rules.
It should only be allowed to test for efficiency within chains or
perhaps recommend new chains that improve efficiency without changing
the final rule destination of the packet. Otherwise the analyzer would
surely break your logic and then you'd be really screwed. Given this
constraint the task becomes much more manageable.<br>
<blockquote type="cite"
 cite="mid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com">
  <pre wrap="">
If you can parse the args, return the correct structural dependencies of
each rule throughout the path to the end of the ruleset then actually
optimize the ruleset for the best efficiency (which can vary depending
on the needs of the firewall), I will surely come visit whatever corner
of the world you are from and offer you a b33r, because you would surely
deserve it!
  </pre>
</blockquote>
<br>
Only one b22r?<br>
<br>
<blockquote type="cite"
 cite="mid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com">
  <pre wrap="">
Remember, the dependencies of each rule are compounded with the existing
rules that did not pass the filter, which is assuming that the jumps
relinquished control over the packet, but as log, some rules pass
control back to the branch changing the packet's state and continues!
All this must be accounted for!

  </pre>
</blockquote>
<br>
Like I said, I don't think this level of analysis is realistic or even
desirable. On the other hand a tool that parses your rules for
obviously poor design (established, related rule at end of chain or not
there at all, rules that can never be reached, etc.), and then
optimizes the efficiency of the rules within each chain based on
historical data would be useful for unsophisticated users (like me!)<br>
<blockquote type="cite"
 cite="mid7C9884991ADAE0479C14F10C858BCDF5122E8C@alderaan.smgtec.com">
  <pre wrap="">
3. Programming in functionality that intelligently uses the iptables
extensions would bloat the program to a dramatic extent. 

Well, but now, I imagine you get the difficulty of this point as well.


  </pre>
</blockquote>
<br>
The phrase walk before you run comes to mind, and good luck to anyone
who takes on this project.&nbsp; :-)<br>
<br>
Jeff<br>
</body>
</html>


