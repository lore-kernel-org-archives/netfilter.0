From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Performance vs. Rule Set Size
Date: Wed, 28 Jul 2004 22:51:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4107BD84.6000809@linuxmail.org>
References: <1090980688.22783.8.camel@dchws.tqmcube.com> <1090982111.2010.103.camel@grendel> <20040728102145.GO5826@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040728102145.GO5826@samad.com.au>
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
Cc: NetFilter List <netfilter@lists.netfilter.org>

Alexander Samad wrote:
> Hi
> 
> I have a BLOCKED chain that every packet go through (its before the
> EST/RELA rule) and have about 3000 lines and I can still get around
> 4x200Kbs tcp streams on Telstra cables (about the same with out the
> filtering) 

That does not give any real meaning since your load is going to very 
different from what David gets. Besides data throughput is very 
different from packet throughput in the eyes of filtering.
>>>Our server has been under very heavy attack over the last few weeks. I
>>>have been adding individual hosts who try to exploit either httpd or
>>>smtp. I now have an input rule set of several hundred lines. Does that
>>>seem terribly over-sized or is that fairly common?
>>

It really depends on how much cpu it is costing you.

I only have a few hundred rules and I DO NOT use connection tracking but 
my boxes get like something like over 2k packets per second. With the 
2.6 kernel, you can run into two issues. At the packet rate I have to 
handle, filtering costs me about 10% cpu usage. If I had connection 
tracking turned on, I get at least another 20% hit in cpu usage (I say 
at least because I no longer could tell how much more it would chew 
since system cpu usage hit 99% after I turn on connection tracking) and 
so I ain't gonna try connection track related modules.

David, if you are using a 2.4 kernel, you might find the ipset module 
useful to cut down the number of rules you put into your netfilter 
configuration.

