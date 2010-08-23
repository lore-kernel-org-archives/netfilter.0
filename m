From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: routing VPN users through transparent Squid using iptables
Date: Mon, 23 Aug 2010 10:29:06 +0200
Message-ID: <4C723152.5080201@plouf.fr.eu.org>
References: <4C70FE76.1060204@andrewsmail.co.uk> <4C714C43.2050203@plouf.fr.eu.org> <70df47e691bedf9a4877f68170159563@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <70df47e691bedf9a4877f68170159563@thom.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

=46ran=E7ois Legal a =E9crit :
> I think the problem comes from SQUID as it has to be listening on the
> interface (here ppp+) for transparent proxying to work.
> If SQUID is started before the pptpd connection comes up, then this i=
s
> not the case.

I thought about this kind of issue. But then redirected HTTP connection=
s
would fail.

>> Jack Andrews a =E9crit :
>>>
>>> But this doesn't seem to work (I'm also hoping ppp+ is the correct
>>> formatting for a wildcard?).  Http traffic is never redirected and
>>> bypasses the proxy.

