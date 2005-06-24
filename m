From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 17:12:03 +0200
Message-ID: <fad9d48405062408123229f6d1@mail.gmail.com>
References: <fad9d48405062403562537f546@mail.gmail.com>
	<200506240826.14769.rob0@gmx.co.uk>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506240826.14769.rob0@gmx.co.uk>
Content-Disposition: inline
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: NetFilter <netfilter@lists.netfilter.org>

On 6/24/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Friday 24 June 2005 05:56, Kenneth Kalmer wrote:
> > I've built several iptables-based firewalls for some clients and
> > personal use. Some of them are horrors, now that I look back on
>=20
> I can identify with that. :) But none of my firewalls (the ones that
> worked, I mean) were as bad as the ones they replaced.

Certainly true

>=20
> I was forced to learn iptables, because some of the sites I managed
> couldn't get by with something off-the-shelf. Slowly over the years,
> the light came on for me.
>=20
> > them... I want to build my own 'all-in-one' firewall for the most
> > common network setups I use...
>=20
> I wrote a pretty simple one aimed at home SNAT/MASQ users. I also wrote
> a grotesque, complex one which tried to implement DNAT support and a
> *relatively* simple config file.
>=20
> > I've used various other GPL'ed scripts
> > for references in past firewalls and they do tend to open one's eyes
>=20
> Some of them are good. Some are horrid, ipchains-style, or worse.
> Unfortunately Sourceforge and Freshmeat do not have a "Clue filter" to
> prevent incompetent people from posting their wares.
>=20
> > a bit, thanks for everyone who released their scripts under the GPL.
>=20
> Thanks to those who released GOOD scripts. :)

Even the bad ones, it helps to learn from other peoples mistakes...

>=20
> > I understand iptables, so that's covered. I'm constantly researching
> > security cause it's so damn interesting to see the precautions some
> > people take, and the level of protection you yourself would never
> > even have dreamed about...
>=20
> The nice thing about iptables is that a very strong firewall can be
> quite simple. Deny everything by default, allow in just what you want.

Who would do it otherwise... :)

>=20
> > Now, these are the features (independent of implementation) that I've
> > considered to put into my firewall:
> > - Support for multiple interfaces on both LAN & WAN
>=20
> Is this common? It's very complex. I have 3 sites now with dual
> redundant and load-balanced external interfaces. At these sites I've
> abandoned the idea of maintaining a script. I built the initial rules
> with a script and then edited the iptables-save(8) output to suit.
>=20
> I find this much easier to manage. A slight drawback is that some DNS
> names might resolve to different IP's, and iptables-save uses IP's
> only. But iptables-restore(8) can use hostnames, so I just change them
> in the rules file.

Point taken, I experimented with some clever bash scripting since my
earlier post on specifically this one, and ouch... I think I'm still
bleeding...

>=20
> > - NAT & DMZ
>=20
> Yes.
>=20
> > - Black lists for inbound & outbound traffic
>=20
> We don't do much of this. We *do* use DNS poisoning for certain known
> "ratware"/virus domains such as gator.com.

Clever, I must admit... Using a squid redirector is another way, but
not nearly as effective as this...

>=20
> > - Host services (global or per interface, allows seperation between
> > LAN & WAN services)
>=20
> Separation is important. My older firewalls didn't do that.
>=20
> > - Access control on MAC, IP, or MAC-IP pairing
> > - Administrative services (SSH) access control on MAC or MAC-IP
> > pairing
>=20
> I have dabbled in this, but it's not worth a lot of effort. Determined,
> capable attackers can easily bypass this, security through obscurity
> notwithstanding. An incompetent attacker is easily defeated with either
> MAC or IP controls.

It's so simplistic, I know... But it stops the script kiddies, and for
most guys I think doing a nmap and not seeing the SSH at all might put
them off... I know, there's always exceptions...

>=20
> > - Managed logging
>=20
> I do little or no logging, usually only for specific temporary
> debugging. Too much noise, even with --limit.

Hence, "managed". A simple on/off flag to help you test and maybe turn
it on when suspecting some alien activity...

>=20
> > - Expansion through custom chains*
> >
> > * Expansion through custom chains might help those often found
> > scenarios that render your standard firewall inoperable. By creating
> > say, a PREINPUT chain or POSTINPUT chain, another script can modify
> > that chain for any function not covered by the standard firewall
> > features.
>=20
> Even so, misplaced rules could be ignored, or worse, break it. :)

Understandably, allthough my idea was that I'd be the one configuring
the additional rules on a per-site basis. But you do have a point.

>=20
> > Please remember, this discussion is intended to be about features,
> > not implementation. I'll cross that bridge when I get there...
> >
> > Any suggestions & advice would be appreciated.
>=20
> Perhaps I'm not really understanding what you're after. Personally, I
> gave up on the idea of one-size-fits-all firewalls. I haven't been
> there in a long time, but I used to read news:comp.os.linux.networking,
> and the number of users whose problems would be solved by "service
> iptables stop" was very high.

To be honest, since my post and several experiments in the last of
hours I've actually been put off this. I'm rather going to spend my
time now working on a framework for the basics and with some sound
notes on security issues. From this framework I can then assemble a
unique firewall for each site, tailor made...

It's amazing how great something sounds, until you go ahead and try it...

Thanks for your reply, it's been most helpful!


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com

Folding@home stats
http://vspx27.stanford.edu/cgi-bin/main.py?qtype=3Duserpage&username=3Dkenn=
eth%2Ekalmer

