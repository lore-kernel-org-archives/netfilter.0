From: Jason Opperisano <opie@817west.com>
Subject: Re: Host blocking
Date: Thu, 19 May 2005 14:38:34 -0400
Message-ID: <20050519183834.GA8500@bender.817west.com>
References: <20050518150826.GA4863@bender.817west.com>
	<000901c55c28$c1840870$d40aa8c0@winxp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c55c28$c1840870$d40aa8c0@winxp>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 19, 2005 at 07:10:56AM +0300, Wennie V. Lagmay wrote:
> Hi Jason,
> 
> Thank you very much, I was able to block it but I do it this way:
> 
> iptables -A FORWARD -s 192.168.10.0/24  -d "ISP ISP ADDRESS" -j REJECT
> iptables -A FORWARD -d 192.168.10.0/24  -s "ISP ISP ADDRESS" -j REJECT
> iptables -A FORWARD -s 192.168.10.0/24 -j ACCEPT
> iptables -A FORWARD -d 192.168.10.0/24  -j ACCEPT
> 
> Even though it is working, I want to know if I've done it right? and what 
> is the --syn in your sysntax?

i'm not so sure that rules 2 and 4 are really necessary, but i guess ya
never know...

--syn is an alias for:  --tcp-flags SYN,RST,ACK SYN

i.e. i write my rules such that i allow ESTABLISHED,RELATED packets
first, and then my rules only allow the TCP SYN to start new
connections.

-j

--
"Joe Swanson: Peter, it's over.
 Peter: Over? What are you talking about? What kind of talk is that? It's
 un-American. Did George W. Bush quit even after losing the popular
 vote? No! Did he quit after losing millions of dollars of his father's
 money in failed oil companies? No! Did he quit after knocking that girl
 up? No! Did he quit after he got that DUI? No! Did he quit after he
 got busted for drunk and disorderly conduct at a football game? No! Did
 he quit... 
 Joe Swanson: I get the message, Peter."
        --Family Guy

