From: lst_hoe01@kwsoft.de
Subject: Re: Firewall did not block SSH - what is wrong
Date: Wed, 23 Feb 2005 08:42:59 +0100
Message-ID: <1109144579.421c34033a74f@webmail.kwsoft.de>
References: <17870.1109099790@www17.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17870.1109099790@www17.gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Zitat von ju0815nk@gmx.net:

> Hi,
>
> thanks for your help. Actually, I wanted to block all incoming traffic =
that
> is not related to connections originating from my machine. Should a def=
ault
> policy of dropping all packets plus allowing only related packages be
> sufficient ?
>
> e.g.
>
> $IPTABLES -P INPUT DROP
> $IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
>  ESTABLISHED,RELATED -j ACCEPT

I would loose the "-d $EXTIP" because you want ESTABLISHED and RELATED al=
so on
your internal IFs. Traffic coming in your external IF for your internal n=
et or
your internal IF should be checked in the FORWARD chain.

> Is there any way to test iptables-based firewalls without access to a s=
econd
> machine ?
> I installed the rule you told me and commented out the one allowing
> connections to the firewall - but how can I test that it works for me
> (except testing if my email/mozilla works)?

There are many online scanners available at the net. For example
http://scan.sygatetech.com/. Choose one and see what's happening.

Regards

Andreas


