From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: more iptables nitpicking
Date: Wed, 29 Oct 2003 21:13:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031029211339.473df0f4.netfilter@schuetter.org>
References: <Pine.LNX.4.44.0310291443240.28375-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310291443240.28375-100000@localhost.localdomain>
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

On Wed, 29 Oct 2003 14:46:06 -0500 (EST)
"Robert P. J. Day" <rpjday@mindspring.com> wrote:

>=20
>   putting together a tutorial on this stuff has made me really
> read the docs closely, so another couple of nits to pick:
>=20
> 1) the man page opens with a list of options, including=20
>    iptables -[ADC] ...
>=20
>    what's with the "-C"?  i know of no such option, and
>    "iptables -h" doesn't mention it.

what version of iptables you are running? The verion on my firewall
(v1.2.6a) has the flag -C
"--check   -C chain            Test this packet on chain"
but it isn't implemented:
# iptables -C INPUT -s 192.168.7.33 -d 173.99.1.21 -p tcp -i eth0
"iptables: Will be implemented real soon.  I promise ;)"

Gru=DF
  J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


