From: "Some Clown" <systemic@comcast.net>
Subject: DNAT/Forward difficulties...
Date: Tue, 23 Nov 2004 12:04:04 -0800
Message-ID: <001d01c4d197$955c5660$4501a8c0@squigglesworth>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings--

I've been banging my head against the proverbial firewall for days now, =
and
while I consider myself fairly versed in TCP/IP mechanics, I cannot seem =
to
figure this out--probably because I'm relatively new to =
netfilter/IPTables.
I have mashed together several pieces of scripts with some of my own
creations and have come up with what I consider to be a fairly robust
firewall script--at least for my own use.  I've tested, and as far as I =
can
tell it does everything I want except for one thing--I can't seem to get =
any
NEW inbound connections to get forwarded to any internal machines.  I =
have a
cable box from Comcast, coming into ETH0 on my Linux box, then ETH1 to a
plain-jane Cisco switch, then to various other Windows, Linux, and VOIP
boxes.  I want to be able to allow certain NEW connections inbound, =
across
the Linux (firewall) box, to certain internal machines.  For the life of =
me,
however, I can't get it to work.

I tried to post a message to the list with my rc.firewall file included, =
but
apparently it's too big.  Thus, I'll include a link to the file and hope
that some friendly soul takes a look.  I would have posted only =
"relevant"
parts in the message, but the whole thing is relevant... if I knew where =
the
trouble was I'd fix it myself.

As an aside, if anyone sees any obvious pitfalls of this newbie's =
script...
feel free to point them out--though I'm not expecting a comprehensive
analysis... :)

http://home.comcast.net/~systemic/rc.firewall

Thanks in advance for any help!




