From: Dave Cinege <dcinege-mlists-dated-1112996463.b4727a@psychosis.com>
Subject: Re: Captive DNS REDIRECT problems. Need a stateless/fast timeout udp
	connection.
Date: Sun, 3 Apr 2005 17:40:57 -0400
Message-ID: <200504031740.57517.dcinege-mlists@psychosis.com>
References: <200504030138.03902.dcinege-mlists@psychosis.com>
	<20050403172007.73c0089f.harold.a.burchey@uts.edu.au>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050403172007.73c0089f.harold.a.burchey@uts.edu.au>
Content-Disposition: inline
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
To: Harold Burchey <harold.a.burchey@uts.edu.au>
Cc: netfilter@lists.netfilter.org

On Sunday 03 April 2005 03:20, Harold Burchey wrote:
> On Sun, 03 Apr 2005 01:38:03 -0500
>

To all: I'm fixing this by setting ip_conntrack_udp_timeout_stream to 0 or a 
very low amount. (Not ip_conntrack_udp_timeout as I said in my original 
post.) Again, I don't want to do this, because I only want the 'statlessness'
to effect these DNS redirection connections. 

Is there anyway to purge a connection from /proc/net/ip_conntrack from 
userland? If I could do that, my rule generation engine can handle clearing 
that out the moment the host changes un/authorized states. 

> Let's say your existing ethernet device is eth0. Is is possible to
> physically add a second ethernet device, say eth1? Then you could route
> everything from eth0 to eth1 and put the dummy redirections on eth1.
> Then whenever you want to override the dummy redirections you insert
> iptables rules on eth0.

I sort of see what you are saying and that won't work for me. First, the unit 
is a commercial product not a single gateway that's I'm building......so I 
can't really hack my way around this. Next it does dynamic gateway 
management...sometimes only to ppp devices, which aren't present until the 
ppp connection is active. Tying rules to 'dummy' devices will be very 
difficult the manage. With that said some trickery with an ip alias on the 
loopback (or vlan), may work, but I'd prefer a cleaner solution. 

Dave



