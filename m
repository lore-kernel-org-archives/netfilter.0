From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: 23 Oct 2002 01:21:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035328874.10494.38.camel@elendil>
References: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le mar 22/10/2002 =E0 22:10, Robert P. J. Day a =E9crit :
> On 22 Oct 2002, Cedric Blancher wrote:
> > Once you have accepted the fact that your box can get compromised, yo=
u
> > easily understand why you should filter outgoing traffic. Moreover,
> > maximum security relies on the "lesser privilege rule" which specifie=
s
> > that an object must not be allowed to do more than he has to. Accordi=
ng
> > to this, you have to filter network output.
>=20
> i understand that, for extra security, you should also filter on=20
> the OUTPUT chain.  but someone suggested to me that, if i get hacked
> because someone gets through my INPUT filter rules, they have a good
> chance of being able to change my ruleset anyway and remove the
> filtering.

This suppose attacker is able to gain superuser access to your box. This
is not always that easy.

> this is why this person suggested that i should concentrate
> my efforts on hardening my INPUT filter, and not worry a whole lot
> about the OUTPUT ruleset.  in other words, if i get hacked, i'm=20
> pretty much toast anyway, and can't trust *anything* about my
> system anymore.

Yes you have to concentrate on your INPUT rule, it's true. But that does
not mean you do not have to harden OUTPUT, just to contain the attack.

> i realize it sounds like having sloppier security not worrying
> about the OUTPUT ruleset.  i guess it would help me if someone
> could provide *specific* examples of how OUTPUT filtering adds to
> security beyond what would be provided by a well-designed INPUT
> ruleset.  a pointer to an FAQ or some other link would be fine.

Simple. Consider this.

During a pentest, we broke into a box through vulnerable PHP scripts
(one to upload files, and another one to include them and have commands
executed). At this point, we are able to execute commands and upload
binaries, but we do not have a remote shell. So, we launched a netcat
piped to a shell to connect on, because input flows were not filtered
properly. Imagine they were, but output policy was to be accept
anything. We could just get our shell in having our "piped shell" netcat
connect to the attacking box. So, output stuff would have allowed our
remote shell just like if there were not much filtering.

This means, that with proper output filtering, we couldn't have achieve
this this easy, and must have find something else to gain our remote
shell. That would have make the intrusion far more difficult.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

