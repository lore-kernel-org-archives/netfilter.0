From: Nox <pheusion@snet.net>
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Fri, 19 Sep 2003 11:15:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063984503.782.564.camel@shaolin.gridlocksecurity.com>
References: <20030919144311.55129.qmail@web13310.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030919144311.55129.qmail@web13310.mail.yahoo.com>
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
To: Alpha Technologies <alphaside@yahoo.com>
Cc: netfilter@lists.netfilter.org

Your connections are staying in the table,
Ive read this before=20

You can flush conntrack entries for masqueraded connections
by doing either a down/up or ip addr add/del on the associated
interface.  This probably won't help you in this case though
because the problem conntrack is not masqueraded.  I don't
know of any other ways of flushing conntracks.

But Im not sure if that will work for you,
the only other way I know is to Unload & reload the ip_conntrack module

Hope that helps

Nox
GenMicro Sytems

On Fri, 2003-09-19 at 10:43, Alpha Technologies wrote:
> Recently I am having this messages on my system: "ip_conntrack: table
> full". Please i need help. what is happening?
> =20
> This is my info:
> =20
> RedHat 9.0
> Kernel: 2.4.20-18.9
> =20
> I really apreciate any help.
> =20
> Thanks=20
> =20
> Pablo Tamayo
> =20
>=20
>=20
>=20
> ______________________________________________________________________
> Do You Yahoo!?
>  Todo lo que quieres saber de Estados Unidos, Am=E9rica Latina y el
> resto del Mundo.
> Vis=EDta Yahoo! Noticias.


