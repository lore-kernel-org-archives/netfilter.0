From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: STATELESS
Date: Wed, 17 Sep 2003 12:00:58 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309171156180.3253@oskar-lap.agatha>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>  <200309161256.15286.gdh@acentral.co.uk>
  <1063716386.31093.160.camel@raylinux.internal>  <20030916131153.GA16559@cannon.eng.us.uu.net>
  <1063720447.31093.166.camel@raylinux.internal>  <20030916141505.GB16559@cannon.eng.us.uu.net>
  <plopm3isnshj1n.fsf@drizzt.kilobug.org>  <20030916155001.GE16559@cannon.eng.us.uu.net>
  <1063731433.784.25.camel@elendil.intranet.cartel-securite.net> 
 <1063736564.2429.44.camel@ranjeet-pc2.zultys.com>
 <1063737473.786.73.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063737473.786.73.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Ranjeet Shetye <ranjeet.shetye2@zultys.com>, Ramin Dousti <ramin@cannon.eng.us.uu.net>, =?ISO-8859-1?Q?Ga=EBl?= Le Mignot <kilobug@freesurf.fr>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tue, 16 Sep 2003, Cedric Blancher wrote:

>
> See documentation at :
>
> 	http://www.suse.de/~mha/linux-ip-nat/diplom/nat.html
>
> With 2.2 kernels, one was able to achieve simple NAT with iproute, but
> it was far from flexible.
>

Yupp, not as flexible, but much faster than netfilter NAT. It doesn't rely
on any kind of connection tracking at all, which is part problem, part
good thing. Good thing is, you get much lower overhead (and hence can
shovel more packets through), bad thing is, it gets less flexible, and it
isn't secure per se (doesn't track, and hence no knowledge about 3-way
handshakes, and no filtering).

Of course, it may suite much better on a router I assume, and if you want
filtering like that, you may as well run netfilter NAT anyways.

> I must admit that, even if this option is activated into my kernel, I
> don't use it at all.
>

----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net

