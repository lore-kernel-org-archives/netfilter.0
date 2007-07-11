From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: per socket nfmark
Date: Wed, 11 Jul 2007 09:25:05 -0500
Message-ID: <4694E841.40906@riverviewtech.net>
References: <16.19-30594-1397228818-1184162778@seznam.cz>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <16.19-30594-1397228818-1184162778@seznam.cz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 07/11/07 09:06, tomasnull@seznam.cz wrote:
> I would like to bring up the question, if there is a way to associate 
> a nfmark with a socket. It would be very helpful as it saves the 
> matching against iptables rules which would have to than match the 
> packet and associate the nfmark.

The closest that I can think of is the (apparently depreciated?) owner 
match.  At least if you could say that there was one owner to a socket, 
you could then associate that with the traffic (to? /) from said socket 
/ owner.  However it is my understanding that the owner PoM extension 
will not apply to kernels newer than 2.6.15, or there abouts.

> The same question was already posted here: 
> http://lists.netfilter.org/pipermail/netfilter/2002-October/039074.html

Hum, it does not look like there was an answer to that question.  With 
regards to that question, one thing that comes to mind is turning your 
server in to some sort of re-director of sorts.  I'm not even sure that 
would work.  Consider using separate IP / port pairs for the different 
sites, probably something other than port 80.  Then put some sort of 
reverse proxy on port 80 that will redirect to the back end servers on 
their individual ports.  This would allow you to do a source / 
destination port match on tc rules and know that you are only applying 
to the traffic for that given server / service.  Hopefully, this rate 
limiting would also apply through the proxy.  Or, if you could get some 
sort of association / mark / etc through the proxy you could apply your 
tc rules outside of the proxy based on the association / mark / etc that 
was put on the traffic before it went through the proxy.  Just a 
thought.  I know that this is far from a solution, but it is at least 
something to think about.



Grant. . . .

