From: Kim Jensen <kimj@dawn.dk>
Subject: Multiple Internet Providers
Date: Sun, 23 Mar 2003 20:36:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303232036.52953.kimj@dawn.dk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

After having gnawed myself through tons of docs, having discussed this pr=
oblem=20
on the Linux Advanced Router & Traffic Control mailinglist, I am simply=20
beginning to be desperate.

My problem is as follows; I have 2 internet providers, QSC & Arcor. QSC i=
s a=20
fast connection where we have 32 static IP addresses which should be mapp=
ed=20
to our 32 internal machines. Arcor is a cheap flatrate, where we wish to =
see=20
all our traffic running. I have set up a routing so using --set-mark, I c=
an=20
tell the routing system which route to pick by using an fwmark rule.

The way we wish to have the system working is rather simple, all traffic=20
should go via the Arcor, only mail should go via the QSC. All incoming=20
traffic for the QSC should of course be answered.

To match the setup, I'm trying two things; First to make external connect=
ions,=20
and second, to make internal connections.

When making an external connection, the packets passes through the firewa=
ll,=20
enters my internal server, and is being replied correctly, but then when =
it=20
hits the firewall it gets lost!

When making an internal connection, the packet hits the external server, =
an=20
ack comes back and I receive this, but when sending anything after the fi=
rst=20
ack (initial reply), it gets lost as above!

My problem seems tobe lying in the connection tracking, which simply does=
n't=20
work properly. I have a rule for all packets arriving on the QSC interfac=
e=20
that they should have their destination rewritten to the internal net, th=
is=20
works fine, but when apparently I'm making a mistake somewhere.

Instead of showing my embarassing attempts of setting up a set of sensibl=
e=20
iptable rules, can anyone please give me a hint to what I have to do?

/Kim


