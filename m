From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Does iptables support VLANs
Date: Thu, 05 Apr 2007 22:00:16 +0200
Message-ID: <46155550.2020009@rtij.nl>
References: <676738.22206.qm@web56208.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <676738.22206.qm@web56208.mail.re3.yahoo.com>
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
To: Elvir Kuric <omasnjak@yahoo.com>
Cc: netfilter@lists.netfilter.org

Elvir Kuric wrote:
> --- Martijn Lievaart <m@rtij.nl> wrote:
>
>   
>> Elvir Kuric wrote:
>>     
>>> Hi all, 
>>>
>>> I hav short question does iptables support VLAN
>>>       
>> target
>>     
>>> ?
>>>   
>>>       
>> Yes, no problem. Just use eth0.0 etc.
>>     
> I put eth0.0 in place of classical network interfaces
> and that will be ok?
>
>   

Yes, works like a charm.

M4


