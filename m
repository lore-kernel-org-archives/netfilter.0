From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: Wed, 11 Dec 2002 15:14:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212111514.55539.roy@karlsbakk.net>
References: <200212091226.23888.roy@karlsbakk.net> <200212111249.53924.roy@karlsbakk.net> <1039615426.20573.80.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039615426.20573.80.camel@tux>
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

> IIRC the pptp patch doesn't apply if you've applied tcp-windowtracking
> patch, that patch is quite invasive.
>
> I just tried applying _all_ patches that come before the pptp patch in
> p-o-m to 2.4.19 and then applying the pptp patch, no problem, worked
> fine.

Then what am I doing wrong???

cd /usr/src
tar xzf packed/linux-2.4.19.tar.gz
ln -s linux-2.4.19 linux
cd netfilter/patch-o-matic
=2E/runme pending
=2E/runme extra

roy

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


