From: Karina =?iso-8859-1?Q?G=F3mez?= Salgado <kgs@acabtu.com.mx>
Subject: Re: Slow performance - Trouble with IPtables rules
Date: Wed, 03 Jul 2002 17:01:05 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D237421.3BEF05BD@acabtu.com.mx>
References: <3D234545.D34413B9@acabtu.com.mx> <20020703190025.HRSB16050.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

I tought to restrict  IP Class subnets in the interfaces, but i tought to d=
o it
later.

What i want to implement is a simple gateway to the Internet for the intern=
al
network, i don't want masquerading or a complex firewall. I only want to gi=
ve
internet access to the LAN, and force a Squid transparent proxy.  (i have t=
he
redirect rule commented , but i tested before and it seems to work).

So basically ,and before the squid redirection,  i want to give internet ac=
cess
to my lan without masq, without filters. This rules seems to work but not  =
in the
optimal way because there are delays in the display of the web pages, the e=
mail
downloading etc., even with only 1 or 2 computers connected in the lan.

I hope that i could to explain it .

Thanks for all your help,

KarinaI



Antony Stone wrote:

> On Wednesday 03 July 2002 7:41 pm, Karina G=F3mez Salgado wrote:
>
> > The rules i'm using are these:
> > --------------------------------
> >
> > $IPTABLES -P INPUT DROP
> > $IPTABLES -P OUTPUT DROP
> > $IPTABLES -P FORWARD DROP
> >
> > $IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j ACCEPT -v
> >
> > $IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j ACCEPT -v
> >
> > $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT -v
> >
> > $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT -v
>
> So, you're setting a default policy of DROP on INPUT, FORWARD and OUTPUT -
> very good.
>
> Then, you're allowing absolutely everything in, from anywhere, you're
> allowing absolutely everything out, to anywhere, you're forwarding everyt=
hing
> from the outside to the inside, and you're forwading everything from the
> inside to the outside.
>
> This is not a firewall, this is a complex way to plug the Internet into y=
our
> network.
>
> What do you want to allow, and what do you want to block ?   These rules =
ar
> doing nothing for you.
>
>
>
> Antony.

--
Karina G=F3mez



