From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: iptables suddently stop working
Date: Thu, 7 Nov 2002 10:54:10 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3607.192.168.7.41.1036626850.squirrel@iw.k1k2.com>
References: <20021106223940.UUGR292.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021106223940.UUGR292.mta03-svc.ntlworld.com@there>
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

> On Wednesday 06 November 2002 9:57 pm, Luis Fernando Barrera wrote:
> 
>> My output is the following:
>>
>> (right now everything is working)
>>
>> # wc -l /proc/net/ip_conntrack
>>     	156 /proc/net/ip_conntrack
>> # cat /proc/sys/net/ipv4/ip_conntrack_max
>> 	65424
>>
>> My box has 1GB RAM.
> 
> Okay, so this means you have 156 connections being tracked through your
>  firewall (seems a perfectly reasonable number for 200 users), with
> capacity  for up to 65424 connections before the box gets overloaded.
> 
> If you ever got more than 65424 connections from 200 users it would
> indicate  a serious problem (eg Nimda on the machines...) - I would
> never expect that  to happen.

Never heard of CounterStrike?
Only takes a few users to do a 'get server list' at the same time to
fill a conntrack table that size.

Is the maximum you can set the limit really only about 65535?
I'd hope it isn't that short-sighted as a well know fool in the
past ... Bill Gates 640K :-)

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


