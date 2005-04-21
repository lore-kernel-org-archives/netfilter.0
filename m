From: Jason Opperisano <opie@817west.com>
Subject: Re: TTL Examples
Date: Wed, 20 Apr 2005 21:29:14 -0400
Message-ID: <20050421012914.GA26252@bender.817west.com>
References: <060601c54572$90801ab0$09603fca@southern>
	<4266D877.3030201@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4266D877.3030201@riverviewtech.net>
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

On Wed, Apr 20, 2005 at 05:32:23PM -0500, Taylor, Grant wrote:
> If you 
> REALLY want to put a system in place and have it try to guess if there are 
> multiple clients behind a system you should probably look at the sequence 
> numbers that are coming out in packets too as a single system should have 
> sequence numbers that are incrementing higher, not necessarily in 
> sequential as in 123, 124, 125, as in the current sequence number should be 
> higher than the previous and the next sequence number should be larger than 
> the current.  The sequence numbers should not jump all over the scale as 
> this is another sign that there are multiple systems behind the firewall.  
> In fact quite often if you have enough sequence numbers you can even guess 
> fairly close as to how many systems are behind the firewall.

which is why many firewalls nowadays (the one we lovingly discuss on
this list not included) will randomize ISNs on the packets passing
through it.

-j

--
"Pillsbury Doughboy: Nothing says "I Love You" quite like
 Pill... hey! What the hell are you doing you crazy bitch?"
        --Family Guy

