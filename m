From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Sat, 12 Dec 2015 20:10:19 +0100
Message-ID: <20151212191019.GA10759@salvia>
References: <n4g4s8$4pr$1@ger.gmane.org>
 <566BEF33.7090501@gmail.com>
 <alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
 <566C09F5.6080606@gmail.com>
 <alpine.DEB.2.10.1512121259340.14295@blackhole.kfki.hu>
 <566C0E75.6080800@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <566C0E75.6080800@familie-kuntze.de>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Remzi =?iso-8859-1?Q?AKY=DCZ?= <linuxliste@gmail.com>, =?iso-8859-1?Q?D=E2niel?= Fraga <fragabr@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sat, Dec 12, 2015 at 01:09:25PM +0100, Noel Kuntze wrote:
[...]
> -m state has been deprecated for some time though.
> Please try using -m conntrack instead. It offers more
> functionality and is not considered deprecated.

For the record, -m state is *not* deprecated.

This syntax is still supported and will always be.
