From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Streaming and online radio
Date: Tue, 18 Nov 2003 00:05:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311180005.hAI05nj22572@agate.rockstone.co.uk>
References: <00ba01c3ad62$9cfa1060$4a14000a@euroi.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ba01c3ad62$9cfa1060$4a14000a@euroi.intranet>
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

On Monday 17 November 2003 11:29 pm, Helder C Souza wrote:

> Hello,
>
> There is someway to block acess to online radio ( like Itunes ) and onl=
ine
> streaming ( WindowsMedia , Real, etc ). All this programs can go by 80 =
port
> and i can=B4t figure out how iptables can solve this . Thanks.

Very difficult to use netfilter to block a protocol using port 80, assumi=
ng=20
that you still want to allow http at the same time.

Netfilter is a packet filter - it can be set to block or allow TCP port 8=
0,=20
but it can't tell what sort of commands or responses are being sent on po=
rt=20
80.   Netfilter looks at OSI layers 3 & 4, but doesn't really know about=20
layer 7.

If you really want to control this sort of thing you need an application=20
layer filtering system (proxy) such as squid.

Antony.

--=20

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the =
list;
                                                           please don't C=
C me.

