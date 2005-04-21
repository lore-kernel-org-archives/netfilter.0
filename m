From: christopher.f.ulherr@exgate.tek.com
Subject: RE: logging of successful tcp connections
Date: Thu, 21 Apr 2005 15:28:39 -0700
Message-ID: <F97948CF897D7B46802A18845A8B9BFD471BB9@us-rich-m01.global.tektronix.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: gtaylor@riverviewtech.net
Cc: netfilter@lists.netfilter.org

 
> No, I don't think there is a ""trivial way to do this.  What 
> initially comes to mind is to use the recent match extension 
> for the history mechanism that is needed in this scenario.  I 
> think you will need to so something along these lines to come 
> even close to what you are after:
> 
> 1)  Put all traffic in a NEW state in to a recent list 
> (recent_NEW) and continue to handle it like you normally would.
> 2)  Put all traffic in an ESTABLISHED state in to a 
> (different) recent list (recent_ESTABLISHED) and continue to 
> handle it like you normally would.
> 3)  If traffic is ESTABLISHED that is on the recent_NEW list 
> but not on the recent_ESTABLISHED list you know that this 
> connection recently (as in this connection) transitioned from 
> the NEW state to the ESTABLISHED state and thus would be 
> added to the recent_ESTABLISHED list.  I would be tempted to 
> jump to a new sub chain where you could log and do any other 
> actions on the packet that you wanted to.
> 4)  If traffic is ESTABLISHED that is on the 
> recent_ESTABLISHED list and has the FIN flag set in the 
> header you know that this connection recently (as in this 
> connection) transitioned from the ESTABLISHED state to a 
> closing (FIN) state and thus would be added to the recent_FIN 
> list.  I would be tempted to jump to a new sub chain where 
> you could log and do any other actions on the packet that you 
> wanted to.
> 
> You would also want to watch for any traffic that came in 
> with the RST flag set as well as traffic that never goes 
> through a FIN state.
> 
> Keep in mind that this is all theoretical and had not even 
> been cooded out (IPTables script written) and thus should be 
> taken as what I would try first to set something like this 
> up.  If you would like to give me some network config that 
> you are working with I would be happy to see if I could not 
> come up with working examples for you to use.


Hrmm... I've looked over the recent patch, but I'm not certain how to
implement this 'and' logic "if it's in list A, but not in list B".. etc.

There must be some place in the connection tracking code where a simple
log can be placed. I'm not that familiar with the internals, but it
would seem that just before updating the state, you could just printk a
log. Am I way off here?

Chris

