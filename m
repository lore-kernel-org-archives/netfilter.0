From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: External IP addresses on internal network
Date: Thu, 28 Aug 2003 15:24:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4E5700.8030700@Loudoun-Fairfax.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au> <3F4C0519.8000109@Loudoun-Fairfax.com> <Pine.LNX.4.53.0308270944480.7868@simba.math.ucla.edu> <3F4CFD8C.5020404@Loudoun-Fairfax.com> <20030828145632.GC3447@cannon.eng.us.uu.net> <3F4E2844.2050108@Loudoun-Fairfax.com> <20030828181717.GA3993@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030828181717.GA3993@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Hey all,

You guys must hate me by now. I've had a handful of good responses and 
been responding and cc'ing the list trying to keep everyone current, but 
with the list lag it isn't working very well. If your box isn't full 
yet, it will be. Sorry.

Ramin Dousti wrote:

>On Thu, Aug 28, 2003 at 12:05:24PM -0400, Jeffrey Laramie wrote:
>  
>
>>>Could it be that the client machine dials up to AOL, receives that IP
>>>address and later it needs to resolve a name and vecause of the DNS
>>>settings on the client machine it tries the query 192.168.0.24 with
>>>its source 172.144.233.136?
>>>
>>>      
>>>
>>Thanks for the suggestion. That was my first thought since one of the LAN
>>clients is a notebook with dialup ability, but with a DSL connection through
>>the LAN it's not used now. I did check it though to see if it still had an
>>AOL IP assigned to it or an AOL server listed for DNS. It didn't, and the log
>>timestamp indicates that these packets are occuring when a different client
>>(with no dialup) is checking AOL mail.
>>
>>    
>>
>
>What about this theory (although I don't know anything about the AOL stuff)
>that the client connects to AOL. AOL sets up a tunnel with this client
>and assigns 172.144.233.136 to it. Then due to the static DNS settings
>on the client, a DNS query is made to your named on the firewall, instead
>of using AOL's DNS server?
>
I don't know much about tunneling, but this sounds possible. Almost like 
a remote shell where the server session runs on client hardware, except 
here the DNS call gets mis-handled and sent to the client nameserver 
instead?

Chris had a very good theory too:  (quoted here in case you didn't get 
it yet)

> This obviously is not a legit DNS request because the source port is 
> wrong (should be 53 or >1023). My guess is a brain dead Windoze system 
> or even more likely, a load balancer.
>
>> The firewall host is also a DNS server for my LAN so this would be a 
>> normal request coming from the LAN **except** for the client IP address.
>
>
> I've seen this before. An internal client goes to access a Web site 
> (say www.fubar.org) and the authoritative NS is actually a load 
> balancer. It spews suspicious looking traffic at the requesting NS in 
> order to generate performance metrics to figure out what IP to serve 
> back (assumption being the client is close to the NS).
>
> So if this is the case, you should see a query for a host within the 
> AOL domain (owner of the address space) just prior to this traffic.

This is good stuff, thanks guys. I'll let you know if I find out 
anything definative.

Jeff


