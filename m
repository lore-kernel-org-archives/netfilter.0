From: Jared Cook <jared@vsahost.com>
Subject: Re: Using NAT to relay traffic
Date: Thu, 24 Mar 2005 08:29:46 -0600
Message-ID: <4242CEDA.3090209@vsahost.com>
References: <200503240844.j2O8i0NW024910@smtp26.wxs.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503240844.j2O8i0NW024910@smtp26.wxs.nl>
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

That is a good option for services such as http or ftp, but I run into 
an issue with mail clients that stay up 24 hours a day.  Outlook will 
cache DNS information, and wont look up again until the client has been 
restarted in my experience.  I think this can give me a decent 
transition period that will give me less support headaches.

Jared

Sietse van Zanen wrote:

> Indeed.
>
>It would make much more sense, that if you want a fast turnover, to lower
>the TTL of your DNS records to a few seconds.
>
>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Grant Taylor
>Sent: 24 March 2005 01:37
>To: Jared Cook
>Cc: netfilter@lists.netfilter.org
>Subject: Re: Using NAT to relay traffic
>
>The problem that you are having when you port forward traffic from Box A to
>Box B is that the returning traffic comes directly from Box B to the client
>that sent the traffic in the first place thus you have an incorrect
>communications path.  Ironically I just had to work on a situation sort of
>similar to this one.  What I did in my situation to accomplish this was to
>DNAT the traffic destined to Box A over to Box B, like you have done.  You
>also need to SNAT the traffic leaving Box A on it's way Box B to be from Box
>A's IP so that when Box B replies it will reply back to Box A which will in
>turn reply back to the client system.  Thus you no longer have a triangle of
>client to Box a to Box B to client but rather client to Box A to Box B to
>Box A to client.  Let me know what your network config looks like if you
>would like me to come up with some iptables rules for you.
>
>Reference my replies to "HELP! Transparent Proxy using bridging 2.6.9 and
>REDIRECT on	different subnet" thread for an example or email me and I'll
>try to provide more help.
>
>
>
>Grant. . . .
>
>Jared Cook wrote:
>  
>
>>I have two servers on two different networks.  I am running a service 
>>on box A that I am transitioning to box B.  While I wait on DNS to 
>>propagate, I would like to do some iptables magic to send traffic from 
>>box A to box B using NAT.  For instance, when pop3 email users connect 
>>to box A, I would like box A to send the request to box B 
>>transparantly.  Is this possible?  I have had success doing port 
>>forwarding to the local machine, but when I specify box B as the 
>>"--to", it doesn't work.  Any help would be greatly appreciated.
>>
>>Thanks,
>>Jared
>>
>>    
>>
>
>
>  
>


