From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Need help have some questions...
Date: Fri, 15 Aug 2003 15:09:42 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030815220942.21924.qmail@web40208.mail.yahoo.com>
References: <1060941756.1712.21.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060941756.1712.21.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

Just as I suspected. This is not good news for what I would like to do. Why=
 is
it that iptables does not allow "fowarding" on the imput line? Is it becuase
the filter table is not capable of this?

I have been able to succesfully PREROUTE the service I wanted with a redire=
ct
line. However this is only HALF the implimentation I need...

Given the fact that matches are almost always useless in PREROUTING. Since =
only
the first packet is examined(I'm fairly certain that what I need to check f=
or
is not in that first packet). I would like to propose a question to the
netfilter community(seeing as I am at a complete loss for a soloution here).

How can I sepperate requests to a machine by a matched string? Once this is
done how can I then direct certain requests one way and certain request ano=
ther
way(doesn't need to be another IP but does need to be another port)?

I will post what I have been testing with and perhaps everyone else out the=
re
can help me build and actually bring about a soloution.

#iptables -A INPUT -p tcp -m string --string ".exe" -j LOG --log-prefix "CO=
DE
RED "
#iptables -A INPUT -p tcp -m string --string ".exe" -j REJECT --reject-with
tcp-reset

In the begining I tested these lines. The desired effect was nice! I could =
both
log and reject connections. The downside to this is it causes kernel panics.
NOT ACCEPTABLE!

# Works
#iptables -t nat -A PREROUTING -p tcp --dport 81 -j REDIRECT --to-ports 80
# Does not work!
#iptables -t nat -A PREROUTING -p tcp --dport 81 -m string --string "exe" -j
REDIRECT --to-ports 80

Keeping in mind that these rules are for complete testing and not pratical =
use,
I used them to see if the REDIRECT worked and it does. However the string
matching does not.(Leading me to believe what I need to match is not in the
first packet.)

Someone out there must know a way to work around this and it would be most
handy for more than just me if this technique could be implimented.


Thanks so much to Ralf Spenneberg for answering the first mail. I hope othe=
rs
and him can help me resolve this issue. IT'S PLAUGING MY THOUGHTS!!!!

SBlaze



--- Ralf Spenneberg <lists@spenneberg.org> wrote:
> Hi,
>=20
> Am Fre, 2003-08-15 um 11.29 schrieb SBlaze:
> > I've been toying around with the idea of redirecting unwanted traffic to
> the
> > discard surface. I'm having trouble understanding some concepts though.
> Could
> > anyone please explain this in more detail or perhaps suggest a way to
> > accomplish this.
> >=20
> > On the filter tables using IMPUT there is no way to change or alter the
> > destination of packets and cause them to be sent to another port?
> No. You cannot change the source or destination in the filter table. Use
> the nat table for this. In the nat table you can change the source
> (POSTROUTING) and the destination (PREROUTING, OUTPUT)
>=20
> >=20
> > Using the POSTROUTING chain in the nat table is impoosible to effective=
ly
> > filter traffic via specific matches due to the fact that POSTROUTED pac=
kets
> are
> > sort of "lumped together" for lack of a better way to explain it?
> You want the PREROUTING chain since you want to redirect (change the
> destination).
>=20
> And yes, when using NAT you only see the first packet of each connection
> in the nat table. All other packets are automatically natted
> identically.
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

