From: "Markus Schaefer" <Markus.Schaefer@epygi.de>
Subject: Is this conntrack behaviour correct? Aka. Stealing services...
Date: Fri, 4 Jun 2004 13:15:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDEHJGPIKNLKJJBCCFPLIEGLCOAA.Markus.Schaefer@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

HiHo all!

I have viewed a strange conntrack behaviour.
Sorry if this mail will be long, but it seems to
be a quite complicated szenario, nevertheless it
happens and is bugging me.

=======================
Short questions for the impatient:
  - Why is netfilter using a port for NATing,
    even though the very same port is reserved
    by the router device though a listening socket,
    (but "free" from view of conntrack table.)
  - I need a way to reserve a certain touple in
    the conntrack table. Or
  - prevent a fixed touple from being used.
    (I know, it sounds strange but i need it :)


========================
Short description:

I have three machines:
  A = a router 10.20.10.193 which is natting machine B
  B = 172.30.193.100        being behind A
  C = 10.20.0.95 a server

In the conntrack i have an entry with:
  udp 17 0 src=172.30.193.100 dst=10.20.0.95 sport=5060 dport=5060 src=10.20.0.95 dst=10.20.10.193 sport=5060 dport=5060 [ASSURED]
..

even though A itself is listening on port 5060.
   .......  sport=5060 dport=5060 [ASSURED]
                             ^^^^
				I don't like this, should not be 5060


======================================
Longer Scenario description:
No let me explain why this is a Problem.
The setup is the same as above, i just repeat
the ips for easier understanding.

I have a service running on a linux router A,
the same service is running behind this router on
a another machine B. The service is SIP connecting
to a fixed sip-server C. SIP uses fixed ports for
src and dst. It can be any port, but after signalling
it must be fixed and default is 5060.

This is very important, because this will now lead to
two touples with
      A:5060 C:5060  for the router
and   B:5060 C:5060  for the machine behind the router
			   A does also NAT machine B

Now when the router connects to the sip-server i get
a correct entry in connection tracking.

A= 10.20.10.193
C= 10.20.0.97
udp      17 19 src=10.20.10.193 dst=10.20.0.97 sport=5060 dport=5060 src=10.20.0.97 dst=10.20.10.193 sport=5060 dport=5060 [ASSURED]
use=

So far ok.
Note that the service has opened a Socket for 5060 on A, it is listening on 5060.
Now after this entry expires, let B connect to C

B=172.30.193.100 which is a subnet to router A
udp      17 0 src=172.30.193.100 dst=10.20.0.95 sport=5060 dport=5060 src=10.20.0.95 dst=10.20.10.193 sport=5060 dport=5060
[ASSURED] use=1


========================
Well. I know this behaviour is probably ok, as the old entry
is expired from conntrack table. So technically it looks ok for now.
BUT I don't like that the natted dport 5060 is used.
....5060 dport=5060 [ASSURED] ......
               ^^^^^-should NOT be 5060.

Yes i know it was free from conntrack view. But A is still
listening on port 5060 (open socket). Because now we run
into a problem. The first connect has told the SIP server,
which ports the router uses (5060). The problem is that once we
are registered the sip-server can also initiate a connection
which he does for an incoming call. So now the sip-server
sends a packet from C:5060 to A:5060 telling A that
he has a call, which now will be forwarded due to the later
conntrack entry to the machine B.
To make things even worse. B (being intelligent) has detected
via stun that it is behind nat, so it constantly refreshes it's
connection by sending keep-alive packets to C. So the
second conntrack-entry will never expire. Which itself is
also correct.

The only problem i see is that the natted DPORT in
the touple is 5060 instead of anything else. If it
would have been anything but 5060, both machines
and both services could coexist fine.

==============
So here are the questions:
    - Anyone out there agree with me that this behaviour is
      not 100% ok.
    - How can i "reserve" or fix the first conntrack entry
      I mean if it wouldn't expire i wouldn't have a problem.
      And i dont want the server to send a packet every few seconds
      just to keep it's OWN conntrack entry valid.
    - Or How can i prevent that NATed entry from being created.
      I can circumvent the problem with:
		iptables -I POSTROUTING -p upd -s ! A --sport 5060 -j MASQUERADE --to-ports 32017-32042(anything but 5060)

      actually a ....MASQUERADE --to-ports ! 5060 would do the trick, but is not allowed.

For all the quick schooters out there: Yes I know
there are different ways of circumventing the problem
 - configure B to not use 5060
 - block lan-sided 5060
 - using fixed Masquerade as described above.

And yes i know it is usually not a problem, that's
why other protocols use high-ports. It's a
problem of stupid SIP that it is created like this.
Yet this doesn't help me at all.

I have reasons to use it exactly as discribed above,
the easiest but most important: B may not be under my
control. So i definitly don't want B to steal my service,
yet i also don't want to deny B's service.

phew, that's it. I hope at least one
has read this far. So my best wishes for
you and thanxs :)

ciao
  markus

------------------------------------------------------
markus schaefer  ---  software engineer
epygi labs de gmbh
herrenstrasse 23
d-76133 karlsruhe, germany
tel: +49 (721) 205 96 30  -- fax: +49 (721) 205 96 59
http://www.epygi.de



