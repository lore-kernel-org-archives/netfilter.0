From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Sun, 13 Feb 2005 04:13:23 +0200
Message-ID: <420EB7C3.7040303@hotpop.com>
References: <1dceb012050211233357e23dd4@mail.gmail.com>	<1dceb01205021123483860fb86@mail.gmail.com>	<1108216901.4462.27.camel@hubcap.ljm.dom>
	<4f3930a705021214026db11902@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4f3930a705021214026db11902@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Josh Nerius wrote:

>>>that has nothing to do with iptables. 
>>>      
>>>
>
>This could have everything to do with iptables, depending on his
>configuration. If there is a redirector being used, the connection
>that a child redirector process makes to the squid daemon can be
>affected by iptables rules. The fact that it has difficulty binding to
>the assigned port may be due to other errors related to this child
>process communication causing the squid process to die before it
>finishes starting.
>
>As to trying to bind to a privileged port from an unprevileged
>account, he already stated that he's binding to the standard 3128.
>
>  
>
>>>(ps - google is your friend)
>>>      
>>>
>
>It may do you good to keep that in mind. 
>
>  
>
>>>>Why my iptables rule blocking squid to open HTTP port.
>>>>        
>>>>
>
>I'm currently searching for the exact information from the squid
>documentation, but when I had a similar problem about 6 months ago, I
>recall adding rules to the INPUT and possibly OUTPUT chains to accept
>traffic coming from the loopback interface to/from the squid (or
>possibly redirector) port.
>
>  
>
>>it isn't.
>>
>>-j
>>    
>>
>
>Jason, please do your homework. You have a good knowledge of
>netfilter/iptables but please leave subjects you don't understand to
>those who do.
>
>Josh Nerius
>
>  
>
hello josh.

I stand 100% with Jason O.'s opinion ..
netfilter/iptables has nothing to do with squid binding to some/any port.
whoever had to do his homework ... i beleive has done it.
Accessing that port is something different (-i lo -j ACCEPT), but i 
beleive that's not the case.


regards,
Georgi Alexandrov

