From: Jason Opperisano <opie@817west.com>
Subject: Re: server in DMZ
Date: Wed, 01 Sep 2004 23:24:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094095481.1824.102.camel@wolfpack.ljm.dom>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902031755.GA11485@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 23:17, Payal Rathod wrote:
> On Wed, Sep 01, 2004 at 11:04:56PM -0400, Jason Opperisano wrote:
> > i assume the squid proxy can already fetch content from the web server
> > in the DMZ for your LAN--if this is not the case; please post your
> > current rules:
> 
> Yes, it can access the DMZ using public IP right now. Now I want something
> very simple, I want to allow only the client to access the machine.
> 
> > iptables -A FORWARD -i $extIf -o $dmzIf -p tcp --syn \
> >   -s 1.2.3.4 --sport 1024:65535 -d 10.10.10.3 --dport 80 \
> >   -j ACCEPT
> 
> Can you make this a bit simpler? I am not too worried about security of 
> designs (no need for VPN). I just want only the client's IP to access it.
> Right now I have,
> -A PREROUTING -d 5.6.7.8 -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.10.10.3

i can simplify it to:

  -A FORWARD -p tcp -s 1.2.3.4 -d 10.10.10.3 --dport 80 -j ACCEPT

the rules i post in my responses mimic the rules that i actually use on
my firewalls--i don't mean to over-complicate things...

> 5.6.7.8 is my external IP of the DMZ machine.
> 
> I am afraid if I give it as,
> -A PREROUTING -s 1.2.3.4 -d 5.6.7.8 -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.10.10.3
> 
> it will block access from my local LAN also via. the squid proxy and yes 
> the gateway (squid proxy) machine does have 3 cards.

yes--you're probably right that it would break access from the local LAN
in your current configuration

-j

-- 
Jason Opperisano <opie@817west.com>


