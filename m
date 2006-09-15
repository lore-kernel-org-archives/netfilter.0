From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: need help with ipset
Date: Fri, 15 Sep 2006 09:46:12 -0700
Message-ID: <450AD8D4.7040008@mailinator.com>
References: <4504CC74.3040607@mailinator.com>	<Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu>	<450AD4EE.3050205@mailinator.com>
	<450AD69F.9000506@candlefire.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <450AD69F.9000506@candlefire.org>
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

Mr Ritter wrote:
> Mike Wright wrote:
> 
>> Now I want to add a rule to iptables.
>>
>>   "iptables -A INPUT -m set --set BADIPS src -j DROP"
> 
> 
> How about:
> 
> iptables -t filter -A INPUT -m set --set BADIPS src -j DROP
> 

Thanks for the reply.  No joy.  Also tried specifying a protocol 
thinking it might require one but that had no effect either.  Other 
insights?

:m)


> 
> -- 
> Ritter
> 
> 
> 
> 


