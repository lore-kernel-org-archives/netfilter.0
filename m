From: joerg@schuetter.org
Subject: Re: how to negate a limit match?
Date: Wed, 29 Oct 2003 20:12:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031029201201.630de190.joerg@schuetter.org>
References: <Pine.LNX.4.44.0310291330000.27971-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310291330000.27971-100000@localhost.localdomain>
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
To: netfilter@lists.netfilter.org

Hallo Robert,

On Wed, 29 Oct 2003 13:31:10 -0500 (EST)
"Robert P. J. Day" <rpjday@mindspring.com> wrote:

>=20
>   it's not clear from the man page how to reverse the meaning
> of a limit match.  if i want to accept everything *over* a given
> limit, i'm supposed to use the "!".  but where?  is it like
> this?
>=20
>   -m ! limit -- limit ... etc etc ...
-m limit ! --limit ...
>=20
Take a look at http://iptables-tutorial.frozentux.net/ . There will you
find a good tutorial for iptables.


Gru=DF
  J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


