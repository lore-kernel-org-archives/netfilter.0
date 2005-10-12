From: Barry Fawthrop <barry@ttienterprises.org>
Subject: Re: IP Vs DNS
Date: Tue, 11 Oct 2005 20:00:15 -0400
Message-ID: <434C520F.4050308@ttienterprises.org>
References: <434C28FB.3000805@ttienterprises.org>
	<20051011231030.GA18418@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051011231030.GA18418@salty>
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


Jim Laurino wrote:

>> Greetings all
>>
>> with an IPTABLES ruleset you can specify an IP address to be 
>> allowed/blocked
>> iptables INPUT -s 12.12.12.12 -j ALLOW
>>
>> But can this be done with a DNS name
>> iptables INPUT -s www.name.com -j ALLOW
>
>
> IPTABLES accepts DNS names, but the DNS lookup is performed
> when the rule is placed in the kernel,
> not when the rule is evaluated against a packet.
> The kernel (netfilter) rules use ip address only.
>
> To achieve what you want, I think you would have to
> update the rule whenever the DNS mapping changed.
>
How can this be done on a per packet basis, where the IP is checked 
regularly
or can the table be flushed and reloaded every hour.
What would be the negative of doing a reload each hour??

Thanks in Advance


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.344 / Virus Database: 267.11.14/129 - Release Date: 10/11/2005


