From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: forwarding to a honeypot
Date: Wed, 10 Sep 2003 17:58:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C63A463@yellowstone.medclaim.local>
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
To: netfilter@lists.netfilter.org



Greetings,

I am on a cable internet connection with 2 DCHP assigned public IP
addresses.  1 address is being used by my iptables router/firewall to
provide a connection to the rest of the LAN.  The second IP address is
being used by my new honeyd honeypot. =20

What I originally wanted to do is put a 3rd NIC in my router to assign
my second IP to and then forward all traffic on that interface to the
honeypot.  This however does not seem possible and if it is I wasted 3
hours with no success.  Plan B is to put 2 NICs in the honeypot, assign
a static private address to one interface and my second public address
to the other.  The problem I'm running into is I don't know how to
forward traffic coming in on the public IP to different "faked" machines
on the honeypot. =20

The machine on which honeyd resides will have no real services running
that will not need to be accessed from the wild so all traffic on that
IP should go to a fake host.  However, since the honeypot still has a
LAN interface connected to the rest of my network, I do need to make
sure that every bit of traffic coming in on the public address must go
through the honeyd process and not actually get to the real host.  If
anyone knows of a script or wants to give me a hand I would greatly
appreciate it.  If you want to use AIM or Yahoo messenger I'm
silvrtegra99 on both.=20

TIA,
Matt

I'll try my best to throw out some decent ACSII art to illustrate what
I'm talking about.



							[Cable
modem]------------[hub]-------------[eth1 honeyd eth0]
=09
|   					|
=09
|						|
=09
|   					|=09
=09
|						|
=09
|[eth1 netfilter eth0]|		|
=09
|		|
=09
|		|
=09
|[  switch  ]
=09
|
=09
|
=09
|
=09
[ Rest of the LAN ]

There's my sorry ASCII LAN ( I did say I'd try my best)

