From: Kiran Murari <kmurari@embeddedinfotech.com>
Subject: Re: NAT Issue
Date: Fri, 20 Apr 2007 17:39:21 +0530
Message-ID: <4628AD71.7060101@embeddedinfotech.com>
References: <46289F30.9030800@embeddedinfotech.com>
	<200704201125.l3KBPGSw018412@toshiba.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704201125.l3KBPGSw018412@toshiba.co.jp>
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
To: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Cc: netfilter@lists.netfilter.org

Yasuyuki KOZAKAI wrote:
> From: Kiran Murari <kmurari@embeddedinfotech.com>
> Date: Fri, 20 Apr 2007 16:38:32 +0530
>
>   
>> After little bit of experimenting, I could see that if I flush all the conntrack entries,
>> as soon as my WAN is enabled, the PING session continued.
>>
>> But flushing all the conntrack entries, doesn't look like a feasible one.
>>
>> Is there a way to flush the conntrack entries that have been created during a specific interval.
>>
>> Any thoughts.
>>     
>
> Why don't you flush table with tool 'conntrack' just after bringing up your
> WAN ?
>
> http://www.netfilter.org/projects/conntrack/index.html
>
> -- Yasuyuki Kozakai
>   
Yeah I have seen the 'conntrack'.
But this requires linnetfilter_conntrack and libnfnetlink support.
I am running a 2.6.14 on an Xscale processor.

So is there a means to flush the entries, other than porting the 
'conntrack' to Xscale.

- Kiran

