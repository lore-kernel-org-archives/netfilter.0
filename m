From: =?utf-8?q?Fr=C3=A9d=C3=A9ric=20Gonzatti?= <fred99@libertysurf.fr>
Subject: Re: Firewall IP change
Date: Mon, 2 Aug 2004 16:12:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408021612.41826.fred99@libertysurf.fr>
References: <40FEE340.8090907@ctwa.com> <200408021407.07897.fred99@libertysurf.fr> <200408021326.52657.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408021326.52657.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org


Sorry, my external interface is eth2 (it's just an error when I wrote the=20
mail).
Some pages takes lots of time to appear when I'm using the first line in my=
=20
script. When I'm using the second one they appear immediately.
My DNS server is on my LAN with a private IP address 172.16.2.200.

Regards,

=46rederic

> On Monday 02 August 2004 1:07 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:
> > If I replace in my iptables script :
> > iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to my_public_IP
> > by
> > iptables -t nat POSTROUTING -o eth1 -j MASQUERADE
> >
> > ...I can access to the internet faster !
> >
> > Have you got any idea ?
>
> Which is your external interface?   eth1 or eth2?
>
> How are you measuring "faster"?
>
> Where are your DNS servers?
>
> Regards,
>
> Antony.



