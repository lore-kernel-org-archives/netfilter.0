From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Using -m limit to stop outbound portscanning viruses
Date: Sat, 5 Feb 2005 18:51:18 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502051828070.352-100000@darkstar.sysinfo.com>
References: <42055159.6000102@tiedyenetworks.com>
Mime-Version: 1.0
In-Reply-To: <42055159.6000102@tiedyenetworks.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Ireton <mike-netfilter@tiedyenetworks.com>
Cc: netfilter@lists.netfilter.org


Then you would likely be better off putting in a rules to drop traffic in
the forward, input and output chains for those port/protocol combos that
should not be passing the perimiter.  The reason for the input rules is
there are tons of sites that filter egress poorly and tons of totally
unfiltered machines on the net, so there's no reason to have the firewall
even look at such traffic besides just dropping it outright as it's
forward rules <inside going out, and outside coming in>.  For the most
part, traffic I'm not allowing to pass I tend to not log as well, why
clutter the logs with what is effective, the interesting stuff is in what
is allowed to pass afterall.

All the rate-limiting things folks are putting into some of the posted
firewall scripts on the netfilter and realted sites are interesting to
look at, but add to the complexity, and in many cases processing latencies
of traffic traversal of the  firewall.  Afterall, it's job is to limit.
Too often we tend to gorfet the fundmentals, like KISS...
It's often much more effective and processing sweet to just be broad and
bold with traffic at the perimiter then try to get fancy and 'play' with
offenders on either side of the perimiter.  AS I mentioned in
the previous, if these nasties need to be passed, then a VPN, preferably
through an intelligent proxy, rather then a mere plug is the way to go
<most proxies tend to be mere plugs we;ve found>. The only place I'd look
at rate limiting in this contaxt might be  a '*routing* firewall' in front
of a honey pot setup for trickery, fun and analysis.  Of course YMMV...


Thanks,

Ron DuFresne

On Sat, 5 Feb 2005, Mike Ireton wrote:

> 
> I'm not, and that's the point. I aim to put a condom on the customer 
> side of the link so that they _can't_ engage in this behavior, no matter 
> what virus or stealth zombie ddos tool they have been infected with. 
> This gets me out of having to play traffic cop and is one more way I 
> ensure that the service can't be (easilly) abused.
> 
> R. DuFresne wrote:
> 
> >Why are you letting this traffic traverse your perimiters in the first
> >place?  If there is a need to pass windows related problematic protocols
> >across perimiters, they should be tunnels in a secure connection.
> >
> >
> >  
> >
> 
> 

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


