From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables rule for ovh
Date: Sat, 31 Jul 2010 13:10:12 +0200
Message-ID: <4C540494.40006@plouf.fr.eu.org>
References: <4C51450F.7070906@gmail.com> <4C514A38.1010702@plouf.fr.eu.org> <4C53EBAF.8030207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C53EBAF.8030207@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Portedaix <portedaix@gmail.com>
Cc: netfilter@vger.kernel.org

Portedaix a =E9crit :
> Thanks for the answer. I know now what choice I have : compile=20
> patch-o-matic-ng or go for a new kernel.

Actually you don't compile the patch-o-matic ; you use it to patch the
kernel source and then you compile a new kernel, or the new module if
applicable.

> Probably the second option is the wisest.

Depends on lots of things. A much more recent kernel may not be
compatible with installed software, requiring other upgrades.
