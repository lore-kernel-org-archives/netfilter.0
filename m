From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: TWO ROUTING
Date: Thu, 20 Nov 2003 11:16:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBCE8C8.6070100@Loudoun-Fairfax.com>
References: <E1AMU5R-0001oJ-Io@vishnu.netfilter.org> <3FBCC194.1080008@Loudoun-Fairfax.com> <200311201340.hAKDeN722163@onyx.rockstone.co.uk> <3FBCD315.3020902@Loudoun-Fairfax.com> <20031120164218.GA21892@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031120164218.GA21892@cannon.eng.us.uu.net>
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
To: netfilter@lists.netfilter.org

Ramin Dousti wrote:

>On Thu, Nov 20, 2003 at 09:43:33AM -0500, Jeffrey Laramie wrote:
>
>  
>
>>>I think he's simply asking whether Linux can use two default routes on one 
>>>machine at the same time.
>>>
>>>
>>>      
>>>
>>Oh, I see. I don't think that's possible at the routing level.
>>    
>>
>
>Yes, it is. Take a look at "Linux Advanced Routing & Traffic Control".
>  
>

Interesting. I take it you're referring to the "TEQL" device? Is this 
installed by a kernel module? From the iptables perspective (trying to 
stay at least marginally on topic!) if you used this would you use -i 
eth0 or -i teql0 to identify the interface?

Jeff


