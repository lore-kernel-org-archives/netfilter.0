From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: redesigning my firewall -- concepts and suggestions for a more structured layout
Date: Fri, 26 Sep 2003 13:50:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E55@alderaan.smgtec.com>
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
To: Alistair@nerdnet.ca, netfilter@lists.netfilter.org

I do this in the same way you suggest. The only thing my FORWARD chain
does is pass up rules to chains that handle interface-interface rules,
then do policy decisions once the packet has failed to be accepted by
the other chains.



-----Original Message-----
From: Alistair Tonner [mailto:Alistair@nerdnet.ca]=20
Sent: Thursday, September 25, 2003 9:31 PM
To: netfilter@lists.netfilter.org
Subject: redesigning my firewall -- concepts and suggestions for a more
structured layout


	Okay ...=20
	    I've been reading, watching and sometimes chipping in on
this list for a=20
	while now.  I started with Oskar Andreassens (hope I got that
right, and=20
	I hope some deity somewhere blesses the man for his work)  basic
script
	tutorial to set my firewall up originally.  My firewall has over
time =09
	modified and grown, and twiddled its way into a morass of rules
that last
	week gave me utter fits when I inserted a rule in which I
goofed, and b0rked
	the internal network filesharing system.  And couldn't see it
right off as to=20
	why ...=20

	I am endevouring to remake the basic "my multi-pc home lan needs
	a firewall" firewall into something more organized, and I
intend, as an
	exercise to write it *cough* myself.  My question is .... given
the above
	basic premise, and a DROP default policy across all chains, Is
it more
	effcient, processing wise, to have all the rules in a flat line,
or, since it
	can make things easier to debug, have it parsed up in user
chains.

	My logic is this.  I can break my network traffic flow into 6
directionally
	oriented chains ( internet to server, internet to lan, lan to
server, lan to
	internet, server to internet, and server to lan) ... I *feel*
that it makes
	better logical sense to setup user chains for each direction,
and=20
	*then* have, at the top of each directional chain a jump to a
chain
	that handles things that go in all directions ( i.e. established
related=20
	and dns and things), then append rules that apply to that
specific direction.

	From a system load perspective I recall that minimizing the
number of rules
	a packet must traverse lowers load.  Does my logic fall down
somehwere here
	that I am missing?  From a facility point of view, does anyone
have comments
	about ease of use/debug/tracing/problem solving?
=09
	Is the use of -m multiport to put several accepted ports into
one rule an=20
	imporovement in efficiency (a la fewer rules to traverse) or a
burden based
	on something in the multiport code adding load?

	Ummm ... okay .. there are several other questions boiling about
in my brain,
	but 1) its too darned late at night to get them out coherently
and 2) its=20
	time for bed. (gotta get up at 05:15 fer work)

	Please don't suggest any packages that setup rules for me.  I
want the
	challenge of doing this m'self. (with a little input from the
list of course)

	Thanks for any and all assitance
--=20

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
=09
     Any sufficiently advanced technology will have the appearance of
magic.
	Lets get magical!


