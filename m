From: Daniel David Benson <dan@spoontail.com>
Subject: Re: Leaking ICMP and UDP packets
Date: Mon, 19 Apr 2004 09:54:04 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0404190949530.2276-100000@dudester.spoontail.com>
References: <20040419163159.GE10272@home.manuelm.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040419163159.GE10272@home.manuelm.org>
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
To: Frank Gruellich <frank@home.manuelm.org>
Cc: netfilter@lists.netfilter.org


Here's the catchall rule:

$EXT_IFACE = eth0
$EXT_IP = Some Internet Routable Public IP.

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE -j SNAT --to-source $EXT_IP

Here's what I am doing with tcpdump (eth0 is the public interface):

tcpdump -vvv -i eth0 net 10.0.0.0/8

Unfortunately I can't send any of the packets captured via tcpdump....as 
I get about 5-10 a day and I killed the screen that had last weeks packets 
-- I'm recording them better now :)

-Dan


On Mon, 19 Apr 2004, Frank Gruellich wrote:

> * Daniel David Benson <dan@spoontail.com> 19. Apr 04:
> > I essentially have everything go out as a global nat,
> 
> What exactly is you rule?
> 
> > but every now and then a tcpdump on the frontside interface is showing
> > some ICMP and UDP packets not getting natted.
> 
> What exactly do you tcpdump?  (Cmdline, please.)  What exactly is the
> output of it?
> 
> > Anyone ever seen this before?
> 
> No.
> 
> > It's not a major deal as we are are having our front edge router
> > handle these ugly packets, but I'd like to tighten it up.
> 
> I am just curious: does it NAT, too?  (This has nothing to do with your
> problem, whatever it may be.)
> 
>  Regards, Frank.
> 


