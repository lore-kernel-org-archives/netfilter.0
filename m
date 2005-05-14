From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: Internal PC/external Gateway
Date: Sun, 15 May 2005 02:52:44 +0300
Message-ID: <1116114764.20275.0.camel@debianbox>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
	<1116087634.18707.2.camel@debianbox>
	<20050514164144.GA24669@bender.817west.com>
	<1116090083.18707.6.camel@debianbox>
	<20050514172613.GA24810@bender.817west.com>
	<1116095410.18707.14.camel@debianbox>
	<20050514190005.GA25010@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050514190005.GA25010@bender.817west.com>
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

When i run this:
ip rule add from 192.168.1.3 table T2

i get this error:
RTNETLINK answers: Invalid argument


On Sat, 2005-05-14 at 15:00 -0400, Jason Opperisano wrote:

> On Sat, May 14, 2005 at 09:30:10PM +0300, Sadus . wrote:
> > Before continuing, thanks alot for your help.
> > 
> >                                            +------------+        
> >                                            |            |       |
> >                                        ----+ Provider 1 +-------
> > 192.168.1.2                          |   | 10.2.2.1  |     /
> >    PC1__/  \_         +------+-------+ |   +------------+    |
> >    _/        \__      |              | |                    /
> >   /             \     | 10.2.2.253 | |                    |
> >  | Local network -----+Linux GW  eth0|-                     |Internet
> >   \_           __/    |192.168.0.141 |                   |
> >     \__     __/       |              | |                    \
> >    PC2 \___/          +------+-------+ |   +------------+    |
> > 192.168.1.3                          |   |            |     \
> >                                        ----+ Provider 2 +-------
> >                                            |192.168.0.173     |
> >                                            +------------+        
> > 
> > so a little reminder. i just want 192.168.1.3 to take Internet from
> > 192.168.0.173
> > my GW has as you see has 2 IPs in eth0, and i can reach both of my
> > Providers with that setup.
> > 
> > btw, is there any article to read about the priority of rules while
> > writing an iptables script?
> 
> yeah--first match wins for all terminating targets.  a good tutorial in
> general is:
> 
>   http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> 
> so it looks like we need:
> 
>   iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.2 \
>     -j SNAT --to 10.2.2.253
>   iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.3 \
>     -j SNAT --to 192.168.0.141
> 
>   echo 202 T2 >> /etc/iproute2/rt_tables
> 
>   ip route add default via 192.168.0.173 table T2
> 
>   ip rule add from 192.168.1.3 table T2
> 
>   ip route flush cache
> 
> hope this helps...
> 
> -j
> 
> --
> "Spectator #1: Oh my God. I'm so offended. I'm going to do something
>  about this.
>  Spectator #2: Mike, there's not really anything you can do.
>  Spectator #1: Wow, you're right. I guess I'm just going to have to
>  develop a sense of humor, huh?"
>         --Family Guy
> 
