From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Tue, 11 Jan 2005 13:16:47 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501111313200.7610-100000@darkstar.sysinfo.com>
References: <20050111162914.GA14045@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050111162914.GA14045@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org



it's also quite possible these connetions his counter catches are not
related to the NAT c0onnections at all, but, are the result of other
systems scanning his or trying to find a way through his FW rulebase. My
cash is on these counters incrementing due to kiddies and others merely
scanning the ethers with new toys and trinkets they have found at various
links and sec websites on the net.  But,this can be confirmed with
comparing these INPUT hits with his FORWARDED NAT hits in the logs, yes?

thanks,

Ron DuFresne

On Tue, 11 Jan 2005, Jason Opperisano wrote:

> On Tue, Jan 11, 2005 at 04:03:11PM +0100, Marius Mertens wrote:
> > Hi again,
> > 
> > I just subscribed to this list in order to save the moderator some work and 
> > minimize the delays in our discussion ;-)
> > So no need to cc anymore.
> 
> we greatly appreciate that.
> 
> > On Tuesday, January 11, 2005 1:27 AM,
> > R. DuFresne wrote:
> > 
> > >[...]
> > >validate your conclusions, adding a LOG rule prior to the drop might
> > >help track down 'why' you are seeing that 'counter' increment.
> > 
> > Below are the packets logged by
> > iptables -A INPUT -i ppp0 -p tcp --dport 4664 -j LOG --log-level 
> > 6 --log-prefix "SUSPICIOUS: "
> > after running some minutes.
> 
> you could easily be creating this situation yourself with your "testing"
> methodology.  if you are:
> 
> 1) starting firewall
> 2) allowing connections to establish
> 3) stopping firewall, which includes removing ip_conntrack
> 4) starting firewall
> 
> all the packets that were part of the established connections in step 2
> will no longer have a conntrack entry that ties them to the DNAT, and
> they will end up in INPUT and get dropped.
> 
> i'm not saying this is what you are doing--but it's an explanation for
> what you're seeing--the DNAT functionality in netfilter works properly
> in my experience.
> 
> -j
> 
> --
> "To alcohol: the cause of, and solution to, all of life's problems."
>         --The Simpsons
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


