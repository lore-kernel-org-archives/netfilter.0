From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: time module
Date: Mon, 10 Nov 2003 15:53:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031110155331.5bef6bb0.netfilter@schuetter.org>
References: <000501c3a652$e1987520$050314ac@rip>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c3a652$e1987520$050314ac@rip>
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

Hallo Tomas,

On Sun, 9 Nov 2003 00:48:59 +0100
"Tomas Charvat" <eaglecz@tiscali.cz> wrote:

> greeting folk
>=20
> im just testing rule
>=20
> [0:0] -A FORWARD -s 62.84.131.35 -m time  --timestart 07:00 --timestop
> 00:38 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat -j shape

have you tryed to break the rule up in to rules?
... --timestart 07:00 --timestop 23:59 ...
... --timestart 00:00 --timestop 00:38 ...


J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


