From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: ready to cry over NATting!
Date: Tue, 20 May 2003 15:35:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030520193502.GB33081@justpickone.org>
References: <20030520102957.GA98543@justpickone.org> <1053440382.1993.117.camel@kermit.spenneberg.de> <20030520155813.GA33081@justpickone.org> <1053451097.27975.136.camel@kermit.spenneberg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1053451097.27975.136.camel@kermit.spenneberg.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>
Cc: Ralf Spenneberg <lists@spenneberg.org>


--8NvZYKFJsRX2Djef
Content-Type: multipart/mixed; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ralf, et al --

=2E..and then Ralf Spenneberg said...
%=20
% Dear David,
%=20
% > % >   iptables -A FORWARD -i eth1 -o eth1 -j REJECT
% > % What are you trying to achieve?
% > % These rules do not allow any traffic through your firewall (Forward
% > % REJECT).
% >=20
% > As I said, I was lifting from the HOWTO :-)  I thought that that rule
% > rejected anything coming in on eth1 (external interface) that was due to
% > go back out on eth1.
% Sorry my mistake. You are right. I apparently assumed you meant -i eth1
% -o eth0.

Well, either that or you believed what I wrote :-)


%=20
% > I'm not sure why I want to do postrouting going out the LAN interface; I
% > thought that NAT was for internal machines trying to get out.  I *think*
% > that what I want is SNAT =3D=3D source translation, and the NAT HOWTO d=
oesn't
% > talk about DNAT =3D=3D destination translation so I don't know that it's
% > needed -- but, of course, also don't really know about what I'm speakin=
g.
%=20
% >=20
% > [Oh, phooey -- I just realized that I had a typo, and you're obviously
% > going from what I wrote!  eth0 is the LAN and eth1 is the WAN; sorry!]
% Ok. lets get this straight. You are protecting internal clients which
% want to access the internet. You need Source NAT and the NAT rules are

Yep.


% applied in the Postrouting chain on the external interface:

OK...


%=20
% EXTIF=3Deth1

Quite helpful :-)


% iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

OK.  So this is stuff going out on the external interface that needs to
be readdressed.  And I turn on forwarding in the kernel, and packets come
to the internal interface bound for something on the external side, and
so the kernel knows to just forward them, right?


%=20
% > This is one test case that I didn't try since the firewall was otherwise
% > locked up.
% What do you mean be locked up?

I couldn't connect to it at all.  Upon reflection I realize that that is
a lousy term, since it was probably running happily even if without any
network access.


% >=20
% > % OUTPUT only filters packets originating on the local machine
% > % FORWARD only sees those packets not covered by INPUT and OUTPUT being
% > % forwarded by the firewall.
% >=20
% > OK.  But this FORWARD is different from the NAT forward, right?
% There is no nat FORWARD chain. The nat table only has: PREROUTING and
% OUTPUT for Destination NAT and  POSTROUTING for Source NAT.=20

Ahhh...


% Defining a rule in POSTROUTING only defines the NAT not the filterrules

OK.  So do we need filter table rules to allow packets through, then?
Just turning on NAT isn't enough, right?  Or is the default policy to
accept everything and so it's allowed?


% >=20
% > I'm close, I think.  I'd start with
% >=20
=2E..
% >   # returning connections through
% >   iptables -t filter -A FORWARD -m match --match RELATED,ESTABLISHED -j=
 ACCEPT
% Do not forget to turn routing on:
% echo 1 > ...

Oops.  Thanks :-)


% >=20
% > to allow things like pings to go out and in.  Then I'd need
% >=20
% >   # incoming to
% >   iptables -t filter -A INPUT ACCEPT
% >=20
% > to just let everything going to the box -- like my ssh -- get there.  N=
ot
% > yet secure, but a start, right?
% Yes. But if you just want to allow ssh and web do the following:

Well, so far it's ssh, telnet, web, mysql, and maybe ftp.  It's a pretty
short list, though.  Hmmm...  Maybe DNS queries out, and ping bouncing
both from the box and through the box.


% # Allow ssh and web access to the firewall box
% iptables -t filter -A INPUT -i $EXTIF -m match NEW,RELATED,ESTABLISHED
% -j ACCEPT
% # Allow the firewallbox to answer
% iptables -t filter -A OUTPUT -o $EXTIF -m match RELATED,ESTABLISHED -j
% ACCEPT

I don't get it...  How does this allow only those few?  It seems as
though the lack of a dport specifier would allow anything inbound (but
not through bound 'cuz that's rule FORWARD) on the external interface...


%=20
% # Block everything else
% iptables -t filter -P INPUT DROP
% iptables -t filter -P OUTPUT DROP
% iptables -t filter -P FORWARD DROP

That's the last thing to add :-)

So the current attempt is attached; please take a peek at it.


%=20
%=20
% Cheers,


Thanks again & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=script

#!/bin/sh

EXTIF=eth1
INTIF=eth0

# load module
modprobe ipt_MASQUERADE

# flush everything
iptables -F; iptables -t nat -F; iptables -t mangle -F

# turn on NATting & forwarding
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

# accept returning ext packets
iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# accept anything originating inside ("not ext")
iptables -t filter -A INPUT -m state --state NEW -i ! $EXTIF -j ACCEPT

# allow ssh & telnet
### and web and mysql? and anything?
### EXTIF plus INTIF 'cuz we might connect from inside... so skip the -i/-o?
iptables -t filter -A INPUT -i $EXTIF -m match NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A OUTPUT -o $EXTIF -m match RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A INPUT -i $INTIF -m match NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A OUTPUT -o $INTIF -m match RELATED,ESTABLISHED -j ACCEPT

# drop everything else
## iptables -t filter -P INPUT DROP
## iptables -t filter -P OUTPUT DROP
## iptables -t filter -P FORWARD DROP

# what do we have?
echo "---"
iptables -L
echo "---"
iptables -t nat -L
echo "---"


--EuxKj2iCbKjpUGkD--

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+yoNmGb7uCXufRwARAicFAKDKIt+pyzYYu1H61mZ1tliz2su1cwCgqeNL
Mw1+oyhfjxR9HUIMMa/9/BM=
=ukr4
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--

