From: Jason Opperisano <opie@817west.com>
Subject: Re: not sure if 'iptables -Z' needed/useful/superfluous here..
Date: Fri, 14 Jan 2005 11:47:31 -0500
Message-ID: <20050114164731.GA26437@bender.817west.com>
References: <20050114060327.GA8917@spawar.navy.mil>
	<1105712325.3661.14.camel@hubcap.ljm.dom>
	<20050114164402.GC8203@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050114164402.GC8203@spawar.navy.mil>
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

On Fri, Jan 14, 2005 at 08:44:02AM -0800, seberino@spawar.navy.mil wrote:
> Jason
> 
> Thanks for your help.  If I understood you correctly I can do 'iptables -Z'
> to zero out all tables at the same time or I can do
> 
> iptables -t filter -Z
> iptables -t mangle -Z
> iptables -t nat    -Z
> 
> to do tables one at a time right?

  iptables -Z

will only zero out the filter table.  you need to specify "-t nat" and
"-t mangle" if you want to zero those as well.  since this is all
usually done in a script--i use:

  for t in mangle nat filter; do
    iptables -t $t -F
    iptables -t $t -X
    iptables -t $t -Z
  done

but that's just me...i have much love for the loops.

-j

--
"I hope I didn't brain my damage."
        --The Simpsons

