From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: alias
Date: Mon, 3 Jun 2002 14:57:51 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603215751.1543.qmail@web9903.mail.yahoo.com>
References: <3CFBD80F.5080105@technosoft.ro>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFBD80F.5080105@technosoft.ro>
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

Hello

is that label thing supposed to be addad when setting
the interface with ifconfig ?

No option called label there (slackware 8)

/J=F6rgen=20

--- Alin Nastac <mrness@technosoft.ro> wrote:
> There is a solution:
>     ip addr add w.x.y.z/bits dev eth0 label eth00
>=20
> and use -i/-o eth00 in iptables.
>=20
> In fact, I believe you could use any alphanumeric
> characters after=20
> 'eth0'. I'm not sure.
>=20
> J=F6rgen Danielsson wrote:
>=20
> >Hello
> >
> >I have a little question that perhaps someone knows
> >the answer to.
> >
> >Is it inpossible to use a alias in a rule. With
> that I
> >mean refer to a interface called eth1:0.
> >
> >I get this from every version of iptable i have
> tried
> >(1.2.2, 1.2.4, 1.2.6a):
> >
> >Warning: wierd character in interface `eth1:0' (No
> >aliases, :, ! or *).
> >
> >/J=F6rgen
> >
> >__________________________________________________
> >Do You Yahoo!?
> >Yahoo! - Official partner of 2002 FIFA World Cup
> >http://fifaworldcup.yahoo.com
> >
>=20
>=20


__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com

