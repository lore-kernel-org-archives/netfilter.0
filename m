From: Jason Opperisano <opie@817west.com>
Subject: Re: MARK
Date: Wed, 23 Mar 2005 08:57:46 -0500
Message-ID: <1111586266.4513.19.camel@hubcap.ljm.dom>
References: <42409559.7080001@uplink-verein.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42409559.7080001@uplink-verein.ch>
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
To: netfilter@lists.netfilter.org

On Tue, 2005-03-22 at 16:59, Moritz Gartenmeister wrote:
> hi all
> 
> i got an problem with the MARK target:
> 
> $IPTABLES -t mangle -A PREROUTING -p ICMP -s 0/0 --icmp-type 8 -j MARK --set-mark 1 # ECHO
> 
> gives the following error:
> iptables: Invalid argument

the syntax of that rule is fine.

> ipt_MARK is loaded. (and also ipt_mark, just in case ;-) )
> 
> i once was running this target without any problems. but i changed to connmark (not my best idea).
> 
> so do i have a typo? it seems for me exactly the way as the docu and the source want it to be...
> iptables 1.2.11
> 
> btw, it runs perfectly with:
> 
> $IPTABLES -t mangle -A PREROUTING -p ICMP -s 0/0 --icmp-type 8 -j CONNMARK --set-mark 1 # ECHO

my guess would be that if you've been patching and compiling here and
there, that you may have ended up with and iptables utility that doesn't
know about the MARK target; i.e., you have no libipt_MARK.so file...on
my machine here it's in /lib/iptables/...might be diff depending on your
specific distro.

-j

--
"Do you want to change your name to Homer Junior? The kids can call
 you Hoju!"
	--The Simpsons


