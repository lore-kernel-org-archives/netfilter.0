From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: disabling conntrack ...
Date: Fri, 26 Aug 2005 12:37:51 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCF6A@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Kerryn Wood <Kerryn.Wood@tideway.com>, netfilter@lists.netfilter.org

Someone else will probably jump on this who knows more than I do...

1. Going to assume that your firewall is set up with at least two NICs
and thus is a router or a bridge of some kind. What this means is that
the packets you care about most (i.e., those going through the firewall)
are going through the FORWARD chain in the filter table, not INPUT and
OUTPUT. You are accepting all FORWARD traffic. You are not filtering on
it at all (unless this is being done in mangle or nat tables...?). That
would explain the hideous number of connections you are getting. All
those filtering rules ought to be using the FORWARD chain (i.e., -A
FORWARD -j MY_RULE-FORWARD). You will still need some rules for INPUT
like allowing SSH and RELATED,ESTABLISHED connections.

2. Your INPUT and FORWARD chains should have a default DROP policy.
Whether the OUTPUT chain should is a matter of great debate. For a
beginner I'd say use ACCEPT for OUTPUT. The default DROP policy does the
same thing that your -j REJECT statements are doing, except that it
simply drops the connection, which reduces the load on your system by
not sending "this port closed" messages to millions of zombie machines.

3. Your stateful filtering needs a lot of work. Things are working
because you are allowing any connection higher than port 1023 (for
INPUT; FORWARD accepts anything). What you need is something like this:

-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

as your first FORWARD rule. Why? The vast majority of legitimate packets
that will traverse through your system (provided you are using
connection tracking) will be accepted by this rule. Because a packet
will traverse a chain until it hits a rule that it matches, for
performance reasons you should have the most "popular rules" as high as
possible in the chain. Next you should only accept NEW packets into your
specific ports. You can either create a custom chain for this or append
'-m state --state NEW' to the rest of your FORWARD rules. It's to your
advantage (both for typing and firewall performance) to create a custom
chain.

Example:

-A FORWARD -m state --state NEW -j MY_RULE
-A MY_RULE-FORWARD -p tcp ...[accept port whatever]...

4. Since you weren't using FORWARD you aren't validating which packets
are inbound and which are outbound. Some people do this with just source
or destination addresses; I prefer to do it with interfaces as well. My
(and others I'm sure) way requires knowing which interface is
Internet-facing and which is internally-facing but it ties the packet to
a physical source rather than a potentially faked virtual one. Let's say
that eth0 is your Internet-facing interface and eth1 is your
internal-facing interface. Your filtering rules should look something
like this:

# For allowing inbound HTTP to a specific server.
-A MY_RULE-FORWARD -p tcp -i eth0 -o eth1 -d 192.168.1.5 --dport 80 -j
ACCEPT

# For allowing outbound HTTP to the Internet
-A MY_RULE-FORWARD -p tcp -i eth1 -o eth0 --dport 80 -j ACCEPT

5. Just allowing a specific port without qualifying what IPs have a
valid server for it will still let in a ton of unnecessary packets. Your
mail server doesn't have a web server? Then don't allow inbound HTTP to
it.

I suggest a thorough reading of Oskar Andreasson's iptables tutorial at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html which will
help to enlighten you from a very technical perspective. This tutorial
was the difference for me between hacking random scripts I found on the
Internet and actually understanding iptables.

Derick Anderson

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Kerryn Wood
> Sent: Friday, August 26, 2005 10:42 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: disabling conntrack ...
>=20
> *bows head in shame*
>=20
> I'm relatively new to iptables (landing the role of=20
> administrator because nobody else wanted it!) so was trying=20
> different options, albeit the wrong ones :)
>=20
> The scenario is this:
> I'm running a machine that's generating a HUGE amount of traffic.=20
>=20
> I was seeing many of the "ip_conntrack: table full, dropping packet"
> errors and this I suspected was causing major problems with=20
> the software I was running on the machine. (It looks like it=20
> may be because the machine at the time was working on a=20
> network in the US so timeouts (etc
> ...) were taking longer.) I've increased the hashsize=20
> substantially because as far as I understand the default=20
> hashsize is configured (max) for 2GB of RAM where the machine=20
> is running with 12GB. The error messages just took longer to appear.
>=20
> As the dropping packets are currently the top of the "what's=20
> causing our problems" list I was (mistakenly apparently :D)=20
> investigating disabling connection tracking (we're not=20
> NAT'd), but based on your response I'm guessing it was the=20
> wrong way to go about it!
>=20
> I think the rules file that iptables-restore was trying to=20
> read is /etc/sysconfig/iptables which I've included at the=20
> end of the mail. Line
> 57 (I've removed all the superfluous documentation lines) is=20
> the COMMIT.
>=20
> Thanks for the help,
> Kerryn
>=20
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :MYRULE-INPUT - [0:0]
> -A INPUT -j MYRULE-INPUT
>=20
> -A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,PSH FIN,SYN,PSH=20
> -j LOG -A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,PSH=20
> FIN,SYN,PSH -j REJECT --reject-with icmp-port-unreachable
>=20
> -A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport=20
> 199 -j ACCEPT -A MYRULE-INPUT -m state --state NEW -m udp -p=20
> udp --dport 161 -j ACCEPT -A MYRULE-INPUT -p udp -m udp=20
> --sport 123 --dport 123 -m state --state RELATED,ESTABLISHED=20
> -j ACCEPT -A MYRULE-INPUT -m state --state NEW -m tcp -p tcp=20
> --dport 80 -j ACCEPT -A MYRULE-INPUT -m state --state NEW -m=20
> tcp -p tcp --dport 443 -j ACCEPT -A MYRULE-INPUT -m state=20
> --state NEW -m tcp -p tcp --dport 22 -j ACCEPT -A=20
> MYRULE-INPUT -i lo -j ACCEPT
>=20
> -A MYRULE-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT=20
> -A MYRULE-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT -A=20
> MYRULE-INPUT -p udp -m udp --dport 0:1023 -j REJECT -A=20
> MYRULE-INPUT -p udp -m udp --dport 2049 -j REJECT -A=20
> MYRULE-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT=20
> -A MYRULE-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT
>=20
> COMMIT
>=20
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
> Sent: 26 August 2005 14:17
> To: netfilter@lists.netfilter.org
> Subject: Re: disabling conntrack ...
>=20
> On Friday 2005-August-26 07:20, Kerryn Wood wrote:
> > I need to disable connection tracking and, although I've seen an old
>=20
> Oh my, what a strange need this is! Tell us why you think you=20
> need it, and we can answer your questions more effectively=20
> (likely explaining why you are wrong.)
>=20
> > I *think* I've removed all the connection tracking modules from=20
> > /lib/modules/<kernel version>/kernel/net/ipv4/netfilter/ (I removed=20
> > all ip_conntrack* files).
>=20
> Ouch. This is a reckless approach to system administration.=20
> Do not delete files whose purpose you do not understand.
>=20
> > When I try and start iptables again I get an error from=20
> > iptables-restore. The error message is: "line 57 failed".
>=20
> The rule on line 57 of your iptables-restore rules (check=20
> your OS documentation to find out where that file is) depends=20
> on connection tracking. My crystal ball tells me it's a=20
> MASQUERADE rule.
>=20
> > I'm running FC3, kernel version 2.6.10-1.766 with iptables version=20
> > 1.2.11.
>=20
> As was suggested already, use the raw table NOTRACK target to=20
> bypass connection tracking for the traffic you specify.
>=20
> > Is there a FAQ or information documented on how to do this (that's=20
> > I've missed and will be wholly embarrassed when you point it out)?
> > Does anyone have any experience doing this they could share?
>=20
> Good heavens no! Connection tracking is the jewel in=20
> netfilter's crown.=20
> Why would I want to disable it?
> --=20
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>=20
>=20
>=20

