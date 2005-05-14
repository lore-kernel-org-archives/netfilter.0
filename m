From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: Internal PC/external Gateway
Date: Sat, 14 May 2005 19:20:33 +0300
Message-ID: <1116087634.18707.2.camel@debianbox>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050514153608.GA24455@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

The Multi routing doc is another scenario that includes sharing or load
balancing between 2 providers to the same machine, that's not what i
want.

I tried using iproute2 and iptables (SNAT), but i just don't know what
to set as default gw for PC2, since PC2 can't see Provider 2 unless the
gateway of PC2 is the Linux GW (since it got ipforward).

thanks

On Sat, 2005-05-14 at 11:36 -0400, Jason Opperisano wrote:
> On Sat, May 14, 2005 at 11:59:36AM +0300, Sadus . wrote:
> > Hello,
> > So here's my current setup at home.
> > I control Provider 2. (which is not more than a simple box taking
> > internet from provider 1 and that internet sharing enabled, restricted
> > to the box' internal network and my IP which is on the external
> > interface).
> > I also control the Linux GW.
> > 
> >                                                                  
> >                                           +------------+        
> >                                           |            |       |
> >                                       ----+ Provider 1 +-------
> >         __                            |   |            |     /
> >   PC1__/  \_         +------+-------+ |   +------------+    |
> >   _/        \__      |              | |                    /
> >  /             \     |              | |                    |
> > | Local network -----+Linux GW  eth0|-                     |Internet
> >  \_           __/    |              | |                    |
> >    \__     __/       |              | |                    \
> >   PC2 \___/          +------+-------+ |   +------------+    |
> >                                       |   |            |     \
> >                                       ----+ Provider 2 +-------
> >                                           |            |       |
> >                                           +------------+        
> 
> how about following the instructions in the document you copied that
> ASCII art from [1]?
> 
> to paraphrase the openbsd folks, "don't ask how to do something, explain
> to us what you've done and where you got stuck."
> 
> -j
> 
> [1]:  http://lartc.org/howto/lartc.rpdb.multiple-links.html
> 
> --
> "Stewie: For God's sake, shake me. Shake me like a British nanny."
>         --Family Guy
> 


