From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Need help have some questions...
Date: Mon, 18 Aug 2003 13:13:33 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
References: <1061192932.1915.10.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1061192932.1915.10.camel@kermit>
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
Content-Transfer-Encoding: quoted-printable
To: Ralf Spenneberg <lists@spenneberg.org>, nf <netfilter@lists.netfilter.org>
Cc: cc@belfordhk.com

To Ralf, the netfilter team, and the whole of the OS community

How am I supposed to proxy apache? Why should I have to? Is it not a firewa=
lls
job to protect a system(and LAN behind it)? This is a very valid form of
protection I'm asking for here.

A more detailed explanation of what I need is this and I know I'm not alone=
 in
this as I have been corresponding with people who want the very same thing(=
cc
if ya our there lemme hear ya..post up with me here.)

Anyone who runs apache and logs(which is EVERYONE who runs apache unless th=
ey
are brain dead or don't care about security) is constantly BOMBARDED DAILY =
with
CODE/RED and NIMDA(and I'm sure other types of invalid requests they would =
like
to protect against).

Knowing this... and knowing that the discard service is a very nice and cle=
an
way to sort of send things like this to the great packet /dev/null , I do n=
ot
think it is too much to ask that iptables provide me a way to keep those
invalid requests AWAY from my web server. I should be able to route packets=
 to
the discard service without having to use the NAT table(although if that was
even an option I would use it.) All my services run on ONE machine NAT shou=
ld
not be nessecery.

  If this can not be done I would love for someone to give me a half techni=
cal
half lamen's terms explanation. I honestly don't think I'm asking so much of
the  iptables firewall that I should have to go proxying things and
circumventing things here and there.

Much Respect to the netfilter team and the OS Community
SBlaze



--- Ralf Spenneberg <lists@spenneberg.org> wrote:
> Am Sam, 2003-08-16 um 00.09 schrieb SBlaze:
> > How can I sepperate requests to a machine by a matched string? Once thi=
s is
> > done how can I then direct certain requests one way and certain request
> another
> > way(doesn't need to be another IP but does need to be another port)?
> Use a proxy.  They were made for application filtering.
>=20
> Cheers,
>=20
> Ralf
> --=20
> Ralf Spenneberg
> RHCE, RHCX
>=20
> Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
> IPsec-Howto				     http://www.ipsec-howto.org
> Honeynet Project Mirror:                     http://honeynet.spenneberg.o=
rg


=3D=3D=3D=3D=3D
"Winky is not knowing how sir, winky is not knowing how?" -=3DWinky / Harry=
 Potter and the Goblet of Fire=3D-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

