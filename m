From: Jason Opperisano <opie@817west.com>
Subject: Re: conntrack records not going away?
Date: Wed, 22 Dec 2004 08:43:05 -0500
Message-ID: <1103722984.7337.42.camel@hubcap.ljm.dom>
References: <876ef97a041220111947fbeff5@mail.gmail.com>
	<1103596432.6589.8.camel@hubcap.ljm.dom>
	<876ef97a041222043743ee9a5c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a041222043743ee9a5c@mail.gmail.com>
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

On Wed, 2004-12-22 at 07:37, Tobias DiPasquale wrote:
> I wasn't able to get a capture that expressed this particular problem.
> Every time I did a capture, the FINs were sent properly and the
> conntrack records were removed. But I have another question: is what
> you're telling me above that the kernel will sometimes not correctly
> close a socket that a process has open when it gets killed? Where is
> the code in the kernel that governs that behavior?
> linux/net/ipv4/tcp_*?

um--requesting the socket to be closed is the job of the application. 
when apps crash, processes die, cables get unplugged, power goes
out--connections do not get shut down gracefully and get stuck in your
firewall connection table.  i'm not telling you the kernel isn't doing
its job.  i was saying that either the application isn't doing its job
or a person between the application and the firewall isn't letting the
application do its job.

-j

--
"Getting out of jury duty is easy. The trick is to say you're
 prejudiced against all races."
	--The Simpsons


