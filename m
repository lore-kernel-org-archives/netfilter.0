From: Jason Opperisano <opie@817west.com>
Subject: Re: using with big ban lists (peerguardian and so).
Date: Thu, 20 Jan 2005 15:29:12 -0500
Message-ID: <1106252952.5024.25.camel@hubcap.ljm.dom>
References: <1106251621.41f00f65147cb@imp6-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106251621.41f00f65147cb@imp6-q.free.fr>
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

On Thu, 2005-01-20 at 15:07, jdf [zionarea.org] wrote:
> Hi,
> 
> I was intended to use peerguardian ban list inside my iptables rules.
> I've done a program in C++ to read this file and to put iptables
> commands (using the system function).
> However it is very very very slow (1 hour picked up a very few of
> all the machines). It might be due to the fact that I don't use
> the iprange. Is it true ?
> Is there any way to do that in a fast manner without using iprange ?
> 
> I mean:
> 
> when I have addresses like 4.1.2.0-4.1.3.255, I need to call as much
> iptables command as there are computers. iprange seems to be best
> but I'm not sure if I will encounter speed up.
> 
> Thank you.

you may want to add network summarization capabilities to your program;
as your example "range" can be summarized as:  4.1.2.0/23...which
results in 1 rule instead of 512 rules.

i use the perl NetAddr::IP module to do things like this.

-j

--
"The only monster here is the gambling monster that has enslaved your
 mother! I call him Gamblor, and it's time to snatch your mother from
 his neon claws!"
	--The Simpsons


