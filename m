From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT Helper or UPnP?
Date: Mon, 5 Jul 2004 08:29:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407050829.20128.Antony@Soft-Solutions.co.uk>
References: <289009493.05497@eyou.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <289009493.05497@eyou.com>
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

On Monday 05 July 2004 7:38 am, =C1=B7=CA=E9=B3=C9 wrote:

> HI,
>
>     I really wonder the future of nat helper mechnism because of the UP=
nP.
>
>     UPnP can do all the things that nat helper can do.

Securely?

> Using UPnP, If we want to provide nat traversing in gateway we won't ne=
ed to
> survey any application protocol and just need to support the upnp.

How about you only want to support one protocol, and not the others?

>     Then anyone can tell me a more detailed comparision between nat hel=
per
> and UPnP and give the advantage of nat helper mechnism comparision the
> UPnP.

I know this is by no means a detailed reply, but I would say it comes dow=
n to=20
one word - "security".

Everything I have read / heard about uPnP suggests that it is not a secur=
e=20
mechanism, and therefore is not supported through firewalls in the same w=
ay=20
that RPC isn't, for example.

Regards,

Antony.

--=20
Microsoft may sell more software than any other company, but McDonald's s=
ell=20
more burgers than any other company, and I think the other similarities a=
re=20
obvious...

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


