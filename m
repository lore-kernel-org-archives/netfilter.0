From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: alias
Date: Mon, 3 Jun 2002 15:03:45 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603220345.61683.qmail@web9904.mail.yahoo.com>
References: <200206032037.g53KbHA20127@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206032037.g53KbHA20127@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org

Running a firewall with 6 diff networks, and using a
default policy that is drop, then as far as i know you
have to add -i and -o option to forward rules in order
for them to work. Or am I wrong there (quite new to
this, hehe)?

/J=F6rgen


--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Monday 03 June 2002 8:59 pm, "J=F6rgen" Danielsson
> wrote:
>=20
> > Is it inpossible to use a alias in a rule. With
> that I
> > mean refer to a interface called eth1:0.
>=20
> Correct.
>=20
> Why do you want to refer to the name ?   If you want
> to specify the interface=20
> a packet is coming in on, use the plain name (eg
> eth1).   If you want to=20
> specify the address a packet was going to, use -d
> aa.bb.cc.dd
>=20
> I can't think of another reason you should need the
> interface name.
>=20
>=20
> Antony.
>=20


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

