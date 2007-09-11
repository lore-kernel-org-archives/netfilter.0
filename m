From: Martijn Lievaart <m@rtij.nl>
Subject: Re: How to combine a few  addresses?
Date: Tue, 11 Sep 2007 19:50:15 +0200
Message-ID: <46E6D557.7050204@rtij.nl>
References: <554137.97540.qm@web60322.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <554137.97540.qm@web60322.mail.yahoo.com>
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
To: Vitaly <vitaly_il@yahoo.com>
Cc: netfilter@lists.netfilter.org

Vitaly wrote:
> --- Martijn Lievaart <m@rtij.nl> wrote:
>
>   
>> Vitaly wrote:
>>     
>>> How I can combine a few addresses in one rule? For
>>> example, I'd like to add two IPs 10.10.10.1 and
>>> 10.10.10.2 to the same rule.
>>>
>>>   
>>>       
>> Either use ipset (needs a patched kernel), or
>> iprange (if the addresses 
>> are consecutive) or use a subchain, e.g:
>>
>> -A -s 10.10.10.1 -j CUSTOM
>> -A -s 10.10.10.2 -j CUSTOM
>> -N CUSTOM
>> -A CUSTOM <rest of rule>
>>
>>     
> Thank you!
> Subchains seem to be OK for my needs. But will
> subchains work in case when I need to *exclude* some
> IPs?
>
> For example, can I add 10.10.10.2 to this rule using
> subchain?
>
> iptables -I INPUT -p tcp --dport 80  ! -s 10.10.10.1  
> -m state --state NEW -m recent --set
>   

Yes.

-I INPUT -p tcp --dport 80  -j CUSTOM
-A CUSTOM -s 10.10.10.1 -j RETURN
-A CUSTOM -s 10.10.10.2 -j RETURN
-A CUSTOM -m state --state NEW -m recent --set


HTH,
M4



