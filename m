From: Allen Wayne Best <iptables@atoka-software.com>
Subject: Re: -m string --string cmd.exe
Date: Tue, 11 Jun 2002 09:50:45 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611165420.8E09248D7@lists.samba.org>
References: <Pine.LNX.4.21.0206111813280.14660-100000@dns.toxicfilms.tv>
Reply-To: iptables@atoka-software.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0206111813280.14660-100000@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>, Annette Meriste <annette.meriste@cablecom.ch>
Cc: netfilter@lists.samba.org

maciej, annette:

thanks for your input. after looking back at the prior discussion, i shou=
ld=20
have never ask the question, it appears.  8<{) i really don't want a bunc=
h of=20
open connections hanging around.  nor do i relish recompiling the kernel,=
 as=20
it has been impossible for me to recompile a kernel that would correctly =
do a=20
power down as the precompiled kernel does.=20

(slowly sinking into the lurk mode.....)

On Tuesday 11 June 2002 09:15 am, Maciej Soltysiak pronounced:
> > when i try to use this rule, i get the following error:
> >=20
> > iptables v1.1.1: Couldn't load match `string'
> You need to run:
> make patch-o-matic from the netfilter tree and patch your kernel with
> the string module.
>=20
> and then load the module :)
>=20
> But please, search the archives on discussion about the string match.
> It is not advised to use this match agains cmd.exe, etc.
>=20
> Best Regards,
> Maciej Soltysiak

--=20
regards,
allen wayne best, esq
"your friendly neighborhood rambler owner"
"my rambler will go from 0 to 105"
Current date: 57:46:9::161:2002

When we jumped into Sicily, the units became separated, and I couldn't fi=
nd
anyone.  Eventually I stumbled across two colonels, a major, three captai=
ns,
two lieutenants, and one rifleman, and we secured the bridge.  Never in t=
he
history of war have so few been led by so many.
- General James Gavin

