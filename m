From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Simple question
Date: Thu, 6 May 2004 22:45:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405062245.51694.Antony@Soft-Solutions.co.uk>
References: <001501c432b5$7a5c5f80$a704a8c0@mpro4167> <409927D7.7040705@rtij.nl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <409927D7.7040705@rtij.nl>
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

On Wednesday 05 May 2004 6:43 pm, Martijn Lievaart wrote:

> Oriol Magran=E9 wrote:
> >     Hello!
> >     Just one question...
> >     I have a firewall with the INPUT, OUTPUT and FORWARD policies set
> > to DROP, and now I want to allow connections from localhost to
> > localhost (any port). Which chains are implied here? INPUT? OUTPUT? B=
oth?
> >     How should the needed rule(s) be?
>
> This should do it:
> -A INPUT -i lo -j ACCEPT
> -A OUTPUT -i lo -j ACCEPT

Actually, I would suggest instead:

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

:)

Antony.

--=20
"When you talk about Linux versus Windows, you're talking about which=20
operating system is the best value for money and fit for purpose. That's =
a=20
very basic decision customers can make if they have the information avail=
able=20
to them. Quite frankly if we lose to Linux because our customers say it's=
=20
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


