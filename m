From: Oskar Andreasson <blueflux@koffein.net>
Subject: RE: Iptables bandwidth limit
Date: Fri, 20 Sep 2002 21:46:37 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha>
References: <Pine.LNX.4.44.0209201534250.6328-100000@webdev.ines.ro>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209201534250.6328-100000@webdev.ines.ro>
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
To: Andrei Ivanov <andrei.ivanov@ines.ro>
Cc: netfilter@lists.netfilter.org


First of all, the limitation was created since you should not use other 
TOS values than specified in the RFC's. You may get extremely strange 
problems if you start doing random TOS matches on packets. 

Anyways, iptables _is_ actually able to do irregular TOS matching with the
ftos patch applied to the kernel (I _think_ it may still be in
patch-o-matic, but I don't know for sure). It should also be available 
somewhere on the www.paktronix.com site.

Have a nice day,



On Fri, 20 Sep 2002, Andrei Ivanov wrote:

> 
> What amazes me is that iptables doesn't know to match packets by a tos 
> value other then the ones in ip.h... this really SUCKS.
> 
> On Fri, 20 Sep 2002, Rob Sterenborg wrote:
> 
> > > You can almost do this with the limit module, but you should 
> > > better use
> > > HTB or CBQ (QOS) which are really done for this.
> > > 
> > I first accomplished it with CBQ, but later I switched to HTB which is a lot
> > easier to configure.
> > 
> > 
> > Rob
> > 
> 
> 
> 

-- 
----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net




