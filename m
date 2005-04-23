From: Jason Opperisano <opie@817west.com>
Subject: Re: blocking all traffic except selected ports
Date: Sat, 23 Apr 2005 18:50:47 -0400
Message-ID: <20050423225047.GA9128@bender.817west.com>
References: <a3f524e05042301477b3598d3@mail.gmail.com>
	<426A13FB.2030507@crazeecanuck.homelinux.net>
	<20050423145444.GA8083@bender.817west.com>
	<426AB6F9.2030808@crazeecanuck.homelinux.net>
	<426ACDDF.5090604@crazeecanuck.homelinux.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <426ACDDF.5090604@crazeecanuck.homelinux.net>
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

On Sat, Apr 23, 2005 at 06:36:15PM -0400, Ed wrote:
> Actually (after having a pot of coffee) I just looked at `iptables -m
> multiport --help` on my box, and saw the following:
> 
> 
> multiport v1.3.1 options:
>  --source-ports [!] port[,port:port,port...]
>  --sports ...
>                                 match source port(s)
>  --destination-ports [!] port[,port:port,port...]
>  --dports ...
>                                 match destination port(s)
>  --ports [!] port[,port:port,port]
>                                 match both source and destination port(s)
> 
> 
> It seems multiport has been updated to use port ranges after all.
> 
> (Note to self: don't reply to messages right after waking up either.
> UGH! I thought there was a reason that I switched from mport to
> multiport on my router...)
> 
> https://lists.netfilter.org/pipermail/netfilter-devel/2005-January/017977.html
> 
> # uname -r && iptables --version
> 2.6.11.7
> iptables v1.3.1

this brings out an interesting point--as i was speaking from an iptables
1.2.11 perspective (i have not updated a single box to 1.3.x)...we're
probably going to have to start specifying iptables version on almost
every post to keep from confusing the hell outta people.

-j

--
"Chris: Dad, there's a guy outside who says I can't go to school.
 Peter: Yeah? Him and what army?
 Chris: The U.S. Army.
 Peter: ...that's a good army."
        --Family Guy

