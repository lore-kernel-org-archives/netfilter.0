From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: alias
Date: Mon, 3 Jun 2002 15:15:58 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603221558.71090.qmail@web9907.mail.yahoo.com>
References: <200206032209.g53M9DA25322@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206032209.g53M9DA25322@Networker.rockstone.co.uk>
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

The problem is that on 2 of the nics have to have 2
ip's each, and the only way to have more than one ip
on a nic is by using alias, as far as i know, and then
they get names like eth1:0 and so on. I have not seen
any other possibility for names in slack.

But would it work if i specify it as eth1 in the rule
and use the ip aswell, sounds weird if that would
work.

/J=F6rgen

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Monday 03 June 2002 11:03 pm, "J=F6rgen" Danielsson
> wrote:
>=20
> > Running a firewall with 6 diff networks, and using
> a
> > default policy that is drop, then as far as i know
> you
> > have to add -i and -o option to forward rules in
> order
> > for them to work. Or am I wrong there ?
>=20
> Well, you don't *have* to, but it's a good idea.
>=20
> However, I still think you can do everything you
> want to just by calling them=20
> eth1, and not trying to use eth1:0, eth1:1 etc.
>=20
>=20
> Antony.
>=20


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

