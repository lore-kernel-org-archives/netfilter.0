From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Can iptables or other firewall solutions can do this for me?
Date: Mon, 12 Feb 2007 18:48:07 +0100
Message-ID: <000a01c74ecd$f416ddf0$0101000a@tanjian>
References: <b66ddc900702120716p6c9f1d5dibb6ad85ea4fc8df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b66ddc900702120716p6c9f1d5dibb6ad85ea4fc8df@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org <> wrote:
> Let me tell the background first...
> 
> We have a web server, recently received a lot of requests from oversea
> proxy. The requests are to spam our applications (i.e. leave
> comments). They don't success, since they never get the correct
> captacha. 
> 
> But the problem is: They are doing requests & requests forever (even
> with no success). This lead to:
> 
> 1. Waste of CPU time of our web server
> 2. Waste of oversea bandwidth
> 
> 
> Can iptables or related tools or packages can do this for me?
> 
> p.s. Since they are changing proxy all the time, so might be need a
> automatic solutions, 

Not directly, but this would be a solution I would think of:

You could modify the comment-script so that it logs the IP from the
hosts that attempt to leave a comment but fail doing so (if the script
doesn't do this already).
After that you can write a script that parses and clears the logfile
every x minutes to filter the largest offenders. You can enter these
offending IP's in a user defined blocking-chain which is called in the
INPUT chain (or FORWARD chain, depending on your setup) to block further
requests from these IP's.


Grts,
Rob


