From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Using -m limit to stop outbound portscanning viruses
Date: Sat, 5 Feb 2005 17:49:55 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502051748230.352-100000@darkstar.sysinfo.com>
References: <42054ABB.5040700@tiedyenetworks.com>
Mime-Version: 1.0
In-Reply-To: <42054ABB.5040700@tiedyenetworks.com>
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


Why are you letting this traffic traverse your perimiters in the first
place?  If there is a need to pass windows related problematic protocols
across perimiters, they should be tunnels in a secure connection.

Thanks,

Ron DuFresne

On Sat, 5 Feb 2005, Mike Ireton wrote:

> Howdy list,
> 
> I'm concerned about portscanning viruses which have infected customer 
> machines and are using all of that subscribers outbound to scan for 
> (say) open port 445's all over the net. This isn't good for the wireless 
> and tends to use up substantial resources in disproportion to the amount 
> of data actually being moved. I have control over all my subscriber's 
> CPE gear (running a custom embedded linux distro) and I am considering 
> including an outbound firewalling feature to slow the rate at which new 
> connections can be established. Basiclly, I want to ratelimit outbound 
> syn's to some sane number (5/sec to start). I already have qos and 
> bandwidth control in place at the cpe side, but this job is more 
> 'packets per second' oriented than 'bytes per second'.
> 
> I've looked at various cookbook examples of using '-m limit 5/s' and did 
> rules like '-p tcp --tcp-flags SYN -m limit --limit 5/s -j DROP', but I 
> effectively cut myself off and couldn't make any connections at all. 
> Does anyone have a code snippet that could share which would do this job 
> for me?
> 
> Thanks.
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


