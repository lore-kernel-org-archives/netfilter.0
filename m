From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 16:35:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111635.37659.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <200212111514.55539.roy@karlsbakk.net> <1039616794.20561.83.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039616794.20561.83.camel@tux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

> > cd /usr/src
> > tar xzf packed/linux-2.4.19.tar.gz
> > ln -s linux-2.4.19 linux
> > cd netfilter/patch-o-matic
> > ./runme pending
> > ./runme extra
>
> I have no idea, you say you use p-o-m from cvs and that you apply all
> pending patches... after doing that the pptp patch works fine here.

that's exactly what I'm doing. with kernel 2.4.19 and 2.4.20.
doesn't work
so.
can I just add the required patches manually without going for the whole=20
bunch?
if so - which ones do i need?
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


