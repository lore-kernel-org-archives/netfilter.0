From: gummi7@simnet.is
Subject: Re: Measuring traffic that goes thrugh a specific IP
Date: Tue, 11 Feb 2003 23:34:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <isapiwc.433ab781.5571.3e498870.68801.cd@postur.simnet.is>
References: <isapiwc.433ab781.5d1d.3e3d9787.496f4.ad@postur.simnet.is>
 <200302060039.58779.netfilter@newkirk.us>
 <isapiwc.433ab781.55d.3e425613.69620.b1@postur.simnet.is>
 <200302091932.11514.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302091932.11514.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Oh, yes, traceroute was it.
I know that traceroute can't measure traffic but I was thinking of something like this.
Connect to IP -> traceroute %IP -> grep "The-specified-ip-I-want-to-measure-the-my-traffic-trough" -> if(!grep-returned-none) then measure-traffic.
I know that this is not a shell script nor a program but this is a kind of a flowchart that explains what I want to do and the programs that I know that could be used. This methood is possible, right?
The only problem then is to get a program to pass the IP i'm connecting to, to traceroute. But what can be used to measure then traffic that the "if" tells it to measure. Can I use iptables to do that, or is there another program for linux that does that?

btw, for those of you who don't know the line "if(!grep-returned-none)" means: if grep does _not_ return none

> On Thursday 06 February 2003 07:33 am, gummi7@simnet.is wrote:
>> "If you mean that the specific IP is simply a router somewhere that
>> the traffic 'might happen' to pass through in its travels" That's
>> exactly what I want to do :(
>> I can always find out if a packet passes trough that specifec IP(the
>> one I want to measure, therefore being internatoinal) by using a tool
>> like DOS's "tracert", doesn't that help? Do you know of a program for
>> linux that does what I am trying to do?
> 
> "traceroute" is the Linux equivalent of "tracert".  It will trace a route 
> to a given IP, and note all the IP's along the way.  It doesn't let you 
> measure traffic from your box that flows through a given IP, though, and 
> doesn't assure that your traffic actually follows that exact route.
> 
> j
> 

