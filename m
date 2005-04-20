From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 17:13:32 -0500
Message-ID: <4266D40C.6050707@riverviewtech.net>
References: <1113994155.31280.29.camel@localhost.localdomain>
	<426685FB.4040607@riverviewtech.net> <4266C1E7.8020103@fugmann.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4266C1E7.8020103@fugmann.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Anders Peter Fugmann <afu@fugmann.net>
Cc: netfilter@lists.netfilter.org

> If the system cannot reboot (by bios), then this is avoided. But indeed=
,=20
> root have total control, and can bypass even the most complex trip wire=
s=20
> if experienced enough.

One thing that could be done even in the situation where an attacker coul=
d reboot the system would be to netboot (or boot the router off of a CD-R=
OM) the router in question (though this implies that you have something t=
o netboot it off of) where the attacker would not have any access to the =
medium where the actual firewall script is stored.  Though if they did br=
each security on the firewall chances are decent that they could breach t=
he system that was netbooted off of.  But again this is just something el=
se to slow down the attacker.

> True. Software cannot give what extra hardware gives in terms of=20
> security - And I'm not suggesting that. What I=F8m looking for is some =
way=20
> to trip the attacker, by causing the system to panic it the attacker=20
> tries to modify the rules. If the attacker tries to reboot the system=20
> (after modifying the startup scripts), monitoring systems will usually =

> detect this, and can generate an alert. This is what I'm looking for.

Something devious that you could do would be to not call the iptables bin=
ary directly, but rather another binary that looks as much like iptables =
as possible that is really a farce that would panic the system.  You woul=
d end up wanting to call a script that aliased iptables to the real comma=
nd, run your firewall script (as a child process to inherit the alias?) a=
nd then unalias the iptables command.  This would certainly slow down a l=
ot of script kiddies.

> This is not always an option to install extra hardware. For one you nee=
d=20
> to administer the system, and I guess that it would be hard to find=20
> hardware that can run 24/7 for 50 bucks. Also in some companies it will=
=20
> not be possible to setup an extra machine for firewalling (by policy,=20
> not rationale). I actually thought of running all services in user mode=
=20
> Linux first, but then got the idea to lock the rules - which is less=20
> secure, but a whole lot simpler.

Quite true.  Red tape seems to be everywhere these days.  I'll tend to di=
sagree with you on hardware that will run 24/7.  I have turned MANY an ol=
d discarded workstation in to an extremely robust firewall.  Granted this=
 might not be politically acceptable but it does work.  How many people h=
ere on this mail list use an old system at their house for a firewall tha=
t has been up for a number of days that is 3 digits long? (my hand goes u=
p in the air now (multiple times for a lot of my clients))

> The question is not to make an unbreakable system, but to make a system=
=20
> that is harder to break than your neighbours.

This might be the normal case, but not for some of my clients.  I have a =
client that is one of the major prescription drugstores here in town.  I =
think they might be a bit more of a target than the average cable modem. =
 But yes the point of your statement is very correct.

> Also, clueless script-kiddies usually offers the greatest security risk=
=2E=20
> They, in contrast to professionals, usually just want to exploit the=20
> system. Professional crackers most oftenly crack systems to challenge=20
> themselves - not to destroy or exploit data on the systems found.

Is this so much the script kiddies or more the owned / infected systems r=
unning bots (controlled by said script kiddies).  <rant>I REALLY wish tha=
t ISPs would start doing egress filtering, at least as far as to make sur=
e that traffic leaving their network was valid, i.e. not spoofed or malfo=
rmed.</rant>

> Thinking more about how to implement the system, I don't thank that it =

> is nessesary to hide the address of the bit locking the rules in the=20
> kernel, as I guess that it would be just as simple to find the head of =

> the lists containing the rules, and zero them out (putting a null in=20
> place of the list head). If anyone is interested, I can make the patch,=
=20
> and post it on the devel list. Any comments on this?

I personally do not see much of a point in doing this as I tend to do oth=
er things for this security.  However that being said I'd be interested i=
n seeing how such a feature would be implemented and put it on the shelf =
of known things that I could possibly used at some of my clients.  So don=
't go to too much effort, but I'd be interested in hearing your thought p=
rocess on how to implement this (on or off the mail list does not matter =
to me).



Grant. . . .


