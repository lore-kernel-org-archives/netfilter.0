From: Peter <petermatulis@yahoo.ca>
Subject: RE: 2 basic iptables questions
Date: Tue, 25 Jul 2006 18:09:43 -0400 (EDT)
Message-ID: <20060725220943.83368.qmail@web60019.mail.yahoo.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582901679B2@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582901679B2@pxtbenexd01.pxt.primeexalia.com>
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
To: netfilter <netfilter@lists.netfilter.org>


--- "Gary W. Smith" <gary@primeexalia.com> wrote:


> > 2) I have inherited an iptables firewall and I'm trying to grok its
> > ruleset.  Here are the beginning lines of the output of 'cat
> > /etc/sysconfig/iptables':
> > 
> > *filter
> > :INPUT ACCEPT [0:0]
> > :FORWARD ACCEPT [0:0]
> > :OUTPUT ACCEPT [0:0]
> > :log_and_drop - [0:0]
> > :service_chain - [0:0]
> > [0:0] -A INPUT -d 127.0.0.1 -j ACCEPT
> > [0:0] -A INPUT -s 127.0.0.1 -j ACCEPT
> > [0:0] -A INPUT -i lo -j ACCEPT
> > [0:0] -A INPUT -j service_chain
> 
> Here is where you chain is called.  Basically you are telling the
> input
> chain to jump to the service_chain at that point.  I find it helpful
> to
> create buckets (like your service_chain) which handle certain
> processes
> (such as a bucket for http servers, a bucket for email spoolers,
> etc).
> I then call them on my input (or forward) chain.  This way if I have
> a
> email spooler on a particular IP I can just forward it to the
> specific
> chain that will already take care of what it needs to do.


I know that much.  What about my question?


> > [0:0] -A log_and_drop -j LOG --log-prefix "FWSERVER (Blocked
> > Connection)"
> > [0:0] -A log_and_drop -j REJECT --reject-with icmp-port-unreachable
> > [0:0] -A service_chain -p icmp -j ACCEPT
> > [0:0] -A service_chain -p icmp -j log_and_drop
> > .
> > .
> > .
> > { many more '[0:0] -A service_chain' lines }
> > COMMIT
> > 
> > My question here is how is the last rule ever matched?  If ICMP is
> seen
> > it will be accepted and the evaluation stops.  What is the meaning
> of
> > this line?  My guess is that it is there to log and then block
> unwanted
> > traffic (via the log_and_drop chain) but I do not see how it works.
> > The ruleset is full of these line patterns.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

