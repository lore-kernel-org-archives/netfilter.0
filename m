From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NEW vs INVALID
Date: 01 Oct 2002 13:19:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033471182.878.146.camel@elendil>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de>
		<3D98620B.2070707@fugmann.dhs.org> <1033462154.878.17.camel@elendil> 
	<3D996546.3070408@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D996546.3070408@fugmann.dhs.org>
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
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: netfilter@lists.netfilter.org

Le mar 01/10/2002 =E0 11:05, Anders Fugmann a =E9crit :
> Cedric Blancher wrote:
> > By the way, I was wondering why --syn was "only" equivalent to :
> > 	--tcp-flags SYN,ACK,RST SYN
> > And not to :
> > 	--tcp-flags SYN,ACK,RST,FIN SYN
> The tcp-flags would then not match packets with the SYN & FIN bits set,=
=20
> which is actually connection request, with should be closed immdiatly=20
> after opening.

Well, as SYN,FIN packet is quite nonsense, for a FIN is destined to
close an established connection (both parts) or spot a connection
establishment (client) and thus should not be received on CLOSED, LISTEN
or SYN-SENT, for while connection is not established, server sends RST.

But RFC does not cover the SYN,FIN case. Well, in fact, if we're in
LISTEN state, we are likeley to stop processing flags when we see SYN
set (and RST,ACK not set), and so do not check FIN bit value. But it
tells that a FIN should be discarded if received on CLOSED, LISTEN or
SYN-SENT state.

| eighth, check the FIN bit,
|
|      Do not process the FIN if the state is CLOSED, LISTEN or SYN-SENT
|      since the SEG.SEQ cannot be validated; drop the segment and
|      return.

> The syn-fin is widly used to scan hosts, and should be=20
> dropped.

Yeah it surely should ;) By the way, this harmless, for there's no valid
application for SYN,FIN packets.

> But still - it is a connection request and should therfore be=20
> caught by --syn.

I do not agree on the meaning of such a packet, but it is true that RFC
does not explicitly forbid this kind of flags setting, although it is
clear that a --syn packet must have RST and ACK set to 0 (for RST and
ACK value are checked _before_ SYN one). So, it can be understood this
way, and this should close the debate.

Ahhhh, the art of understanding RFCs :))))

--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

