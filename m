From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Broadcast
Date: Mon, 1 Mar 2004 13:37:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011337.58132.Antony@Soft-Solutions.co.uk>
References: <200403011009.55740.igor@garant.koenig.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403011009.55740.igor@garant.koenig.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 01 March 2004 8:09 am, =D0=98=D0=B3=D0=BE=D1=80=D1=8C =D0=9F=D0=
=BE=D0=BF=D0=BE=D0=B2 wrote:

> I have a question, if my iface receive a broadcast packet in what chain=
 it
> will go in INPUT or FORWARD?

INPUT.

Broadcasts do not get routed - they are (obviously) restricted to one sub=
net.

Antony.

--=20
If builders made buildings the way programmers write programs, then the f=
irst=20
woodpecker to come along would destroy civilisation.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


