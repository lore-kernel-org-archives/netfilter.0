From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: IDS better than hardcore iptables rules?
Date: Thu, 3 Feb 2005 19:32:29 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502031928130.26558-100000@darkstar.sysinfo.com>
References: <20050203230355.GA31433@spawar.navy.mil>
Mime-Version: 1.0
In-Reply-To: <20050203230355.GA31433@spawar.navy.mil>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org

On Thu, 3 Feb 2005 seberino@spawar.navy.mil wrote:

> Many people on this list including Jason O. are masters
> at creating very detailed careful iptables rules that
> DROP packets that have anything peculiar about them.
> 
> (e.g. FIN without ACK, etc.)
> 
> My iptables script just filters based on port
> number and protocol.  I was wondering if instead
> of diving into TCP education to duplicate the
> fine work Jason and others have done,
> if an IDS (Intrusion Detection System)
> like Snort would serve the same purpose???
> 
> I assume Snort **ALSO** knows what TCP flag combos
> typically signify a port scan and other nasties?
> 

And there are many that have delved into combining the two applications to
work together, but, IDS is a beat unto itself, takes perhaps a bit more
thought and work just to tune the IDS *behind* the firewall to get the
proper set of true alarms working such that it's not just another whining
app that gets ignored pretty much as much as most system logs tend to be.

And TCP education is require as much for IDS setup and design as proper
firewalling.  There are no shortcuts, one needs to gain the basic
knowledge levels to tackle more then the basics of network design as in
any other venture one wishes to put their efforts into.  Afterall, there
were no real cheap shortcuts to your phd, correct?

Thanks,

Ron DuFresne
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


