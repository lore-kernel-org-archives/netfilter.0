From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Problems after recompiling iptables 1.2.7 ..
Date: 20 Jan 2003 19:17:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043086669.668.24.camel@tux.rsn.bth.se>
References: <1043049590.1543.5.camel@rayw.knowledgefactory.co.za>
	 <200301201432.52665.fabio@gekolab.it>  <1043049940.4920.4.camel@knoppix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043049940.4920.4.camel@knoppix>
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
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-01-20 at 09:05, Ranjeet Shetye wrote:

> > Shouldn't be specified an output interface/address with the -o option? 
> > Moreover, I think that if you want to do source nat, you should do it in the 
> > POSTROUTING chain. Try this (the existence of another network card eth1 is 
> > presumed):
> > 
> > iptables -t nat -A POSTROUTING -i eth0 -o eth1 -s 192.168.0.0/24 -j SNAT
> > --to-source 196.4.160.2
> > 
> > -- 
> > Fabio Corneti
> > fabio@gekolab.it
> > 
> 
> You are right.
> 
> SNAT MUST be done in the POSTROUTING chain.
> 
> Also, it MUST take an outgoing interface.
> 
> The incoming interface MAY BE specified if you have specific needs.

This is incorrect.

It is correct that SNAT must be performed in the nat/POSTROUTING chain.
but it is OPTIONAL to specify an outgoing interface. And you can NEVER
specify an incoming interface in POSTROUTING.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

