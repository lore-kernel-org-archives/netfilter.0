From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 17:46:58 +0300
Message-ID: <1272293218.3750.15.camel@casper.meteor.dp.ua>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Peter Zieseniss <peter@zconsulting.net>
Cc: netfilter@vger.kernel.org

=F7 =F0=CE=C4, 26/04/2010 =D7 16:09 +0200, Peter Zieseniss =D0=C9=DB=C5=
=D4:
> Hello All,
>=20
> This is my first time posting; i am rather new to iptables, so please=
 excuse the ignorance in my question.
>=20
> My personal CentOS-based webhost is under constant ssh attack from an=
 interminable list of different IP addresses (just to give you an idea,=
 my latsb data file grows by ~100MB every week!!).
> i've noticed that they all seem to come from East-Asia (mainly China,=
 Taiwan, Malaysia, Korea--both).
>=20
> i found this website which provides a list of IP addresses on a per-c=
ountry basis:
> http://ipinfodb.com/ip_country_block_iptables.php
>=20
> it seems quite reliable, but the list, for just the countries above, =
is about 3700 lines long..
> on the other hand, i found a list of just 40 lines for *all* of the A=
PNIC countries (http://bgp.potaroo.net/ipv4-stats/allocated-apnic.html)=
=2E
>=20
> i'd rather use a per-country list so as to not block non-offending co=
untries like Japan and Australia. Indeed, my Mom, Dad, and i use this w=
ebhost for our small businesses, and although we've never had interlocu=
tors from APNIC countries, i'd rather not block Australia outright, jus=
t in case someone has their webhost there and tries to send us email...
>=20
> My question, therefore, is this:
> Is it wise to use a 4000-line long block-list for iptables? Or will d=
oing so bring my server to a crawl (which it already is because of thes=
e darn brute-force ssh attacks) because for each TCP packet it has to s=
pend 5 minutes going through the entire list?
> Should i just forget about Australia and Japan, and block all APNIC c=
ountries with just a 40-line list instead?
>=20
>=20
> Again, i apologize for the long, and probably lame question, but i wo=
uld *greatly* appreciate any help you might provide..

Regarding big number of iptables rules, it is better to use ipset to
this kind of rules because it uses hashing. And this is in case you
really need such big number of rules.

Regarding ssh and Brute-force attacks to other services, there is bette=
r
way to avoid that wothout using huge number of rules.

Personally I limit POP and IMAP to only allow 2 connections from
particular IP. This is not good idea for SSH, because you should be abl=
e
to have as many sessions open as you want. So I limit number of new SSH
connection to 5 per minute. This way I can open 5 connection imediatell=
y
and then 1/minute. This is acceptable to me, but not for brute-force.

This is my rules:

# Blocking Brute-force attacks on Cyrus POP and IMAP by limiting number
of connections to 2
-p tcp --dport 110 -m state --state NEW -m connlimit --connlimit-above =
2
-j DROP
-p tcp --dport 143 -m state --state NEW -m connlimit --connlimit-above =
2
-j DROP

# Blocking Brute-force SSH attacks, limiting connection speed to 5 per
minute
-p tcp --dport 22 -m state --state NEW -m hashlimit --hashlimit-mode
srcip --hashlimit-name LIM_SSH --hashlimit-above 5/minute -j DROP

Brute-forces try to open as many connection as they can, and when they
get very slow because of those rules they give up.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

