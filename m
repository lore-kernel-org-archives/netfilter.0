From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: Iptables issue with EPSV FTP
Date: Mon, 3 Nov 2003 23:57:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031103235737.0bb8b430.netfilter@schuetter.org>
References: <659503E2-0E4F-11D8-9512-0050E425B26F@yourhost.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <659503E2-0E4F-11D8-9512-0050E425B26F@yourhost.com>
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

Hallo Matt,

On Mon, 3 Nov 2003 14:45:17 -0800
Matt Kotich <matt@yourhost.com> wrote:

> Hello,
>=20
> I'm running into some problems with FTP when I fire up my iptables on=20
> RedHat 7.3.. basically, here's what happens:
>=20
> 220 server.yourhost.com FTP server ready
> Name (server.yourhost.com:matt): matt
> 331 Password required for matt.
> Password:
> 230 User matt logged in.
> Remote system type is UNIX.
> Using binary mode to transfer files.
> ftp> ls
> 500 EPSV not understood
> 227 Entering Passive Mode (xxx,xxx,xxx,xxx,xxx,xx).
> -------System hangs here until I Ctrl+C
>=20
[...]
>=20
> I can't figure out why these would break for just OS X, my only guess=20
> is that it doesn't like the EPSV, however, I thought the "sate=20
> RELATED,ESTABLISHED" would fix that.. i'd even tried adding a rule for=20
> allowing "! --syn" but that didn't help either... Any idea what I could=20
> be doing wrong here?

modprobe ip_conntrack_ftp


J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


