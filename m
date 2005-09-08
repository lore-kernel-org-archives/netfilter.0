From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: macro & iptables
Date: Thu, 8 Sep 2005 23:08:52 +0200
Message-ID: <fad9d484050908140817c727d5@mail.gmail.com>
References: <20050831035552.99400.qmail@web53305.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050831035552.99400.qmail@web53305.mail.yahoo.com>
Content-Disposition: inline
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
To: Agung <duppeh@yahoo.com>
Cc: netfilter@lists.netfilter.org

Agung, Edmundo & Rob

I know the question has been answered but I've got the urge to add my
2c as well.

As a quick background, I've used iptables for several months now and
am quite comfortable in my abilities. This list has helped me a lot,
even just by reading the majority of the posts every day.

I'm learning pf now, been using it for a couple of days only. The
differences between iptables and pf are quite significant. In the past
couple of days if really learned to love pf, over iptables, exactly
for reasons like it's macros and ease of configuration.

For an experiment I tried replacing a very reliable iptables firewall
on a DSL connection with a pf one, and man did I have troubles.

So where pf is easier to configure, with gimmicks like macros and
lists, iptables has unbelievable flexibility even though it is only
executed command by command.

I must admit that I have my own shell scripts that make configuring an
iptables firewall 10 times easier and quicker than a pf one, but yet I
know iptables way better than pf.

Stick to what you know and are comfortable with. Never risk security
for nice features. Both applications are world class, and netfilter
has excellent support!

HTH to clear the air a bit...

Enjoy the weekend

On 8/31/05, Agung <duppeh@yahoo.com> wrote:
> hi there,
>=20
> is it possible using macro *like pf did* with iptables
> ?? while i'm googling i found nothing about this, any
> suggestion ?? :-)
>=20
>=20
> regards,
> Agung
>=20
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com

Folding@home stats
http://vspx27.stanford.edu/cgi-bin/main.py?qtype=3Duserpage&username=3Dkenn=
eth%2Ekalmer

