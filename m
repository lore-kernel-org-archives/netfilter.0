From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Newbie - problem with PREROUTING on nat - I'm missing
	something obvious?
Date: Thu, 18 Mar 2004 06:42:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079610133.2009.19.camel@localhost>
References: <1079484547.5206.18.camel@bluespi.orb.co.nz>
	 <1079493229.2026.14.camel@localhost>
	 <1079605653.5606.14.camel@bluespi.orb.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079605653.5606.14.camel@bluespi.orb.co.nz>
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
To: al clethero <aclethero@ihug.co.nz>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-03-18 at 18:27, al clethero wrote:
> Folks
> 
> Well I guess I haven't made this too clear :) but I've battled on and
> tried some experimentation and I've found that I can redirect a packet
> to a different port in  the nat table with a PREROUTING rule if the
> packet comes through on eth0 from another machine, but NOT if the source
> of the packet is 127.0.0.1 port 80 and the destination is 127.0.0.1 port
> 8080 ( i.e. a browser on my gateway machine connected to the internet
> sends to port 80 and needs to be redirected to port 8080 ). 
> 
> The reason I'm trying this is so that the browser on the gateway machine
> is forced to use port 8080 whether a proxy server is defined or not in
> the browser.
> 
> Is there a reason for 127.0.0.1 not using prerouting? Can anyone confirm
> this for me?
> 
> John, I didn't fully understand your final point :
> 
> I believe you must ensure that traffic can flow to interface lo on
> the INPUT chain as well as doing the redirect . . . but it has been a
> long time since I configured Squid so I may be wrong
> 
> can you elaborate?
> 
<snip>
I'm stretching back in my rusty memory here but I believe that when you
redirect the packet to Squid, there is an internal socket connection to
Squid, in other words, the system talks to itself as if it was talking
to another network connection except that then network connection is on
127.0.0.1.  If your INPUT chain does not allow traffic to pass on the lo
interface, these internal socket connections will be dropped. Thus, one
must allow these internal socket connections by ACCEPTing traffic from
lo on the INPUT chain.
These were guesses that I made to make it work and I have never looked
at the netfilter code so please believe someone else if they tell you
differently.

I also believe that locally generated packets do not pass through -t nat
PREROUTING but rather through -t nat OUTPUT.  Again, this is not a
configuration I usually use so I am not 100% sure.  That may explain why
locally generated http connections are not routed through squid. Hope
this helps and is accurate.

My apologies for all the cautious phrasing but I am always very
suspicious that I am being given advice on a mail list from someone who
is well meaning but not authoritative.  Thus, I try to make it clear
that I am not authoritative :-)
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


