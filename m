From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
Date: Mon, 16 Jan 2012 16:58:09 +0100
Message-ID: <20120116155809.GC16285@1984>
References: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Jan 16, 2012 at 12:22:02PM +0100, Andres Velasco Garcia wrote:
>=20
> I could not find=A0a netfilter_queue RPM for Centos 6.2 so went to co=
mpile it (after=A0successfully installing=A0nfnetflink RPMs).=20
> =A0
> The error I got was:
> =A0
> make[1]: Entering directory `/home/dev/software/libnetfilter_queue-1.=
0.1/src'
> =A0 CC=A0=A0=A0=A0 libnetfilter_queue.lo
> In file included from ../include/libnetfilter_queue/libnetfilter_queu=
e.h:19,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from libnetfilter_qu=
eue.c:34:
> ../include/libnetfilter_queue/linux_nfnetlink_queue.h:8:42: error: li=
bnfnetlink/linux_nfnetlink.h: No such file or directory
>=20
>=20
> I solved it by modifying the following header:
> =A0
> libnetfilter_queue-1.0.1/include/libnetfilter_queue/linux_nfnetlink_q=
ueue.h
> =A0
> as follows:=20
> =A0
> //#include <libnfnetlink/linux_nfnetlink.h>
> #include <linux/netfilter/nfnetlink.h>
> =A0
> Am I missing something?

You have to install libnfnetlink. Make sure the headers are installed
in a place where libnetfilter_queue can find them.

Alternatively:

=2E/configure --prefix=3D/usr

usually provides the expected result.
