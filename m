From: Joel Newkirk <netfilter@newkirk.us>
Subject: Odd Packets, semi-OT
Date: Mon, 11 Nov 2002 16:24:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211111624.55737.netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
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

Just felt the need to share this story...  It may be vaguely educational,=
 more=20
likely vaguely entertaining.

I have my filter forward chain set up so that my son's machine can reques=
t=20
port 80 tcp, port 53 udp, and ESTABLISHED/RELATED rules (one inbound one=20
outbound to count each) to let him browse.  (He's 7, precocious, and his=20
WinXP machine is set up to block content without my password except about=
 10=20
sites I've approved - little stinker keeps telling me how much easier if =
I=20
just gave him the password...)  After the above four rules, I log everyth=
ing=20
else his machine sends, then accept, then have a drop policy for the chai=
n to=20
catch anything else.

We've had some activity on this list the past few days regarding forwardi=
ng=20
and NAT, and It occurred to me to take a look at my forward logs.

Well, in scanning logs I came across connections from his machine to a pu=
blic=20
IP at port 6667 and 28805.  Lock down time, with reject instead of accept=
 for=20
his last rule.  Worm or Virus, right?  Port 6667 at least matches a known=
=20
trojan port, while 28805 yields Crimson Skies, Asheron's Call, and Ashevi=
lle=20
NC addresses.  (neither installed)  VirusScan it.  Machine is clean.  (No=
t=20
surprising considering I wipe and reinstall it every few months, it has n=
o=20
email, and is limited to a dozen large commercial, IE disney.com lego.com=
=20
sites)

Well (again), where are the packets going?  207.46.203.33-35.  Before any=
one=20
bothers checking (although I'll bet someone recognizes this) these IPs ar=
e=20
owned by Microsoft.  WinXP phoning home, right?  Thought I'd shut all tha=
t=20
crap down...  double-check it.  Well, shit, I did shut it all down.

I set up a separate log and reject process for these packets, and watch. =
=20
Flurries of attempts here and there.  Wait, they seem to be only when he'=
s=20
actively using his machine.  Codec requests?  search.msn connections?  Wh=
at??

Well, I finally catch some of this activity as it's happening, and it tur=
ns=20
out he's discovered Internet Backgammon, Spades, and Checkers... (I wonde=
r=20
who his opponents were? :^)  I decided to add a new forward rule allowing=
=20
connection to that (/24) IP on those ports.  I also decided to keep the=20
default LOG & REJECT policy for his machine...

If you are a player of one of these games, then you have been warned.  Yo=
ur=20
next opponent could be a 7-year-old.  And no, he doesn't really seem to k=
now=20
how to play Backgammon.  (Hell, I don't... :^)

j


