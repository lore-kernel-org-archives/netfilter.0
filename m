From: Khanh Tran <khanh@slc.edu>
Subject: RE: Measuring traffic that goes thrugh a specific IP
Date: Wed, 5 Feb 2003 15:49:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB580@EXCHANGE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: gummi7@simnet.is, netfilter@lists.netfilter.org

Assuming I'm understanding everything you are saying,=20

You'd probably want to set up an interface on your local linux router =
that
will be used when routing traffic to this specified IP that is =
elsewhere.
Of course you'll next want to set a route to route all traffic to this
specific IP on this new interface.  This will isolate the traffic =
between
your local network and this specific IP to only that interface.  You =
could
then either use ifconfig, or cat /proc/net/dev to calculate the number =
of
packets, bytes, etc that traverse that interface.  I've even seen Perl
scripts that will take that data and send it to MRTG for some nice =
graphs.
I use that on my network to get stats from our campus routers.

Khanh Tran
Network Operations
Sarah Lawrence College



-----Original Message-----
From: gummi7@simnet.is [mailto:gummi7@simnet.is]
Sent: Sunday, February 02, 2003 5:11 PM
To: netfilter@lists.netfilter.org
Subject: Measuring traffic that goes thrugh a specific IP


Hello

I'm a linux/iptables/netfilter newbie, but I want to ask you a simple
question.
It's a long story and unrellevant to tell you why I want to do it so =
i'll
just get straigt to the point.

I want to be able to measure(with my linux router) all the traffic from =
the
computers on my network that go thrugh a specifc IP number wich is =
located
in another place in my country. That is, if a computer on my network
accesses a website and goes trough a specifed IP number to get that =
website,
I want to be able to measure the amount of data that goes trough that
specified IP number, but only the data on my behalf. Note that I do not =
have
phisical(nor telnet or ssh) access to the router with the specifed IP =
number
that I want to measure.

Can I do that with iptables and/or ipfilter? A yes is all I have to =
hear if
that is possible but an example or a little help wouldn't hurt :)

With reagards, Gu=F0mundur Viktorsson

ps. Please say so if I don't make myself clear enough.



