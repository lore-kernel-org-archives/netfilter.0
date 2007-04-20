From: Nagy Zoltan <nagy.zoltan@cit.hu>
Subject: Re: NAT Issue
Date: Fri, 20 Apr 2007 22:54:41 +0200
Message-ID: <46292891.80004@cit.hu>
References: <46289F30.9030800@embeddedinfotech.com>	<200704201125.l3KBPGSw018412@toshiba.co.jp>
	<4628AD71.7060101@embeddedinfotech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4628AD71.7060101@embeddedinfotech.com>
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

Kiran Murari wrote:
>>>
>>> Is there a way to flush the conntrack entries that have been created 
>>> during a specific interval.
>>
>> -- Yasuyuki Kozakai
>>   
> Yeah I have seen the 'conntrack'.
> But this requires linnetfilter_conntrack and libnfnetlink support.
> I am running a 2.6.14 on an Xscale processor.
> 
> So is there a means to flush the entries, other than porting the 
> 'conntrack' to Xscale.
> 
> - Kiran
> 
> 


i've just a minimal coding experience with conntrack,
but i think you need something like 'removing conntrack entries which 
routes are invalid' - as a kernel level feature - i think in this case 
when the wan interface is down you dont have a valid default route...so 
the logic would match on it - and remove them
i think this can be implemented and it would be logical to remove 
invalid routes from the conntrack anyway - i've tried on my 
desktop(2.6.19-gentoo-r5) and it won't removed anything


kirk

