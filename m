From: Kevin Mulcahy <k.mulcahy@galleryglobalnetworks.com>
Subject: Re: OUTPUT ACCEPT, but can't see out
Date: Fri, 5 Mar 2004 10:02:32 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04EE2E4D-6E30-11D8-ABF4-0003930BEFFC@galleryglobalnetworks.com>
References: <40468233.1040702@galleryglobalnetworks.com> <>> <40468F30.7010405@galleryglobalnetworks.com> <200403040803.56158.Alistair Tonner <>>
Mime-Version: 1.0 (Apple Message framework v612)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403040803.56158.Alistair Tonner <>>
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
Cc: netfilter@lists.netfilter.org


On 05/03/2004, at 12:03 AM, Alistair Tonner wrote:

> On March 3, 2004 09:06 pm, Kevin Mulcahy wrote:
>>>> $IPTABLES -A INPUT -i $INTERFACE -p ALL -m state --state
>>>> ESTABLISHED,RELATED -j ACCEPT
>>>> #Note - this appears to generate an error
>>>> # iptables: No chain/target/match by that name
>>>> # but would that affect OUTPUT ???
>>>> $IPTABLES -A INPUT -i $INTERFACE -p ALL -j RETURN
>>>>
>>>> $IPTABLES -A OUTPUT -o $INTERFACE -p ALL  -j ACCEPT
>>>
>>> 	Remove the -p ALL from your established related line.
>>> 	dont put one it ...covers all.
>>
>> Done. But I still get the error.
>> I've read that loading in the appropriate module will solve this, but
>> unfortunately my hosting company has built their own monolithic 
>> kernels
>> which don't support loadable modules.
>> Is there any way around this?
>>
>
> 	Uck.
> 	state matching is the heart and soul of connection tracking.
> 	it strikes me as weird that it isn't included.  ipt_state 	
> 	and ip_conntrack are the symbol names that should be
> 	found in the kernel (grep System.map and /proc/kysms or 
> /proc/kallsyms)
> 	if not found you are going to have to explicitly allow connections by 
> port
> 	which just plain .... is awful.

grep on ipt_state and ip_conntrack turned up nothing in System.map.
neither /proc/kysms nor /proc/kallsyms exist!
>
> 	One other thing that can cause this issue is if the kernel version 
> that the
> 	userspace application was built against does not match the running 
> kernel.
> 	the resolution is to rebuilt the userspace application against the 
> current kernel.
>
> 	What kernel version and iptables version are you working with?

iptables v1.2.5
kernel 2.4.24 #1 SMP

Kev.

> 	


