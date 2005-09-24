From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: Strange behaviour of REDIRECT/ipt_recent
Date: Sat, 24 Sep 2005 15:56:41 +0300
Message-ID: <43354D09.40103@gmail.com>
References: <20050922211815.GA3701@diesel.geggus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050922211815.GA3701@diesel.geggus.net>
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
To: Sven Geggus <sven@gegg.us>, netfilter@lists.netfilter.org



Sven Geggus wrote:
> Hi there,
> 
> the following rule works fine so far
> (redirect any connection to a given IP to Port 22):
> 
> iptables -t nat -A PREROUTING  -p tcp ! --dport 22 -d $SSHIP -j REDIRECT \
> --to-port 22
> 
> But now I need to restrict Connections to 3 accesses per minute to prevent
> DOS-Attacken by means of Portscans:
> 
> iptables -A INPUT -i eth0 -p tcp -d $SSHIP -m state --state NEW -m recent \
> --set --name SSH
> iptables -A INPUT -i eth0 -p tcp -d $SSHIP -m state --state NEW -m recent \
> --update --seconds 60 --hitcount 4 --rttl --name SSH -j REJECT \
> --reject-with tcp-reset
> 
> Unfortunately this does not work as expected :(
> 
> It just works on port 22 but not on any other port.
> 
> I suspect that the redirect rule may change the destination IP to the
> default IP of eth0, but I would consider this to be a bug.
> 
> Can you confirm this? workarounds?
> 
> Sven
> 
> P.S.: Please CC me in the reply, because I am not subscribed to the list.
> 
if you want to access your ssh server from behind a transparent squid
proxy, try https (443) and messenger's ports. for yahoo it is 5050. i
did that successfully. i build a ssh tunnel and routed my default gw in
it. it worked like magic.
but beware to add a static route to your previos default gateway,
otherwise you will lose the connection to your sshd server host.
if there are some LANs behind the squid transparent proxy that you need
too access, set static routes for that too. you can put the script to
set up routes and iptables forwarding rules (if you want to be the
gateway for your friends in pain, and have them make you the default
gateway - you will need to set some bandwidth management for them) in
pppd config directory.

