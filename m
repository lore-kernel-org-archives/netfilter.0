From: Joel Newkirk <netfilter@newkirk.us>
Subject: my firewall
Date: Wed, 4 Dec 2002 13:09:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212041309.09722.netfilter@newkirk.us>
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

I've been threatening for a while, and here it is.  Anyone interested in=20
looking at my script, and commenting/criticizing, it can be found (for a =
few=20
days at least) at http://newkirk.no-ip.org:83/firewall .  It supports qui=
te a=20
few parameters, since I manually invoke it (shell alias fw=3D'service=20
firewall', then ie "fw list" from root console) to open/close Unreal=20
Tournament ports, p2p fileshare ports, etc.  It is fairly tight, IMHO=20
(excessively so in some instances, like ping and traceroute :^), with dro=
p=20
policy on all filter chains, liberal logging (some optional, like the xlo=
g=20
parameter logging ALL traffic) and is moderately commented.  It's still n=
ot=20
complete (probably never will be - like many things in life it is really =
a=20
process, evolving as needed to suit changing uses) but everything in it w=
orks=20
AFAIK.

Some parts, like the UT section, are not really precise.  UT, for example=
, has=20
to deal with running both as a client and a server, and I ended up probab=
ly=20
opening more ports than necessary.  Rather than using excessive logging t=
o=20
determine precisely which ports I really need (or repeatedly checking pac=
ket=20
counts) I just open up the various port ranges that UT uses, then close t=
hem=20
when I'm not running the game.  Eventually I will tighten up those rules,=
 and=20
other manual-invokation parts like the p2p section, but since I only open=
=20
those ports when needed, I haven't felt any urgency there.

Any comments or criticisms are welcome.  If anyone wants to rip a chunk o=
ut of=20
it for their own use, (apart of course from resale, like anyone would wan=
t to=20
resell my firewall!) be my guest.  (but if doing so opens your network up=
 and=20
you end up with some hacker hosing every machine, I disclaim any and all=20
liability :^)

This script lives in /etc/rc.d/init.d/ on a RedHat 7.3 system, linked to =
run=20
in rc3.d and rc5.d immediately following initialization of my ADSL=20
connection, since I need to feed the IP address to the script for SNAT=20
(masquerade) purposes.  My system is really double-dual boot, since I hav=
e=20
two hard drives, one with RH7.3/XPpro, the other RH8/XPpro, and this fire=
wall=20
is used on both RH installs.  (Actually I have 7 hard drives for this=20
machine, but currently have the 80gb and 40gb permanently installed, and=20
sometimes swap the cabling on the 40 to a removable HD frame where I can =
slot=20
in any of the others.)

Everything after the "___end of main firewall rules___" comment is immate=
rial=20
to normal function.  Each of the functions above that point is invoked in=
=20
sequence on start or restart while all functions beyond that point are on=
ly=20
invoked manually.

BTW, since this script isn't run at boot until S42 (S41 is ADSL start whe=
re I=20
get the ppp0 IP needed for SNAT, S43 sends my updated dynamic IP to=20
no-ip.com's DNS) I have also modified /etc/rc.d/init.d/S07iptables to set=
=20
DROP policy on INPUT, OUTPUT, and FORWARD filter chains, in BOTH start an=
d=20
stop functions, before networking is started.

Hmmm.  Seems that I REALLY over-use parentheses.  (even more so than usua=
l :^)

j


