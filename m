From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: Recommended hardware for iptables based firewall/router
Date: Sun, 09 Nov 2014 15:52:25 +0100
Message-ID: <545F7FA9.40704@conversis.de>
References: <CAL-yc88QPD5w8wLbm6u0skP-6DpMfsFdu0EvQi+6NY7ZYZGUow@mail.gmail.com> <545F74B5.3050401@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <545F74B5.3050401@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stig Thormodsrud <stig@ubnt.com>, netfilter@vger.kernel.org

On 09.11.2014 15:05, Dennis Jacobfeuerborn wrote:
> On 09.11.2014 06:15, Stig Thormodsrud wrote:
>> On 09.11.2014 01:49, Yucong Sun wrote:
>>> Dennis Jacobfeuerborn <dennisml@conversis.de>
>>>
>>> The EdgeRouter 's asic couldn't handle all use cases ,  Having some
>>> special rule will make it go to "offload" disabled mode.  You should
>>> research if that's the problem.
>>
>> I'm a developer on this product.  I'd be interested in the test cases
>> that it couldn't handle.
> 
> This isn't a test case the system is already in live use.
> 
> We are only using zone based firewalling, NAT and network/port groups so
> basically just iptables+ipset and a couple of vlan interfaces.
> 
> In its default configuration both cpus are pegged at 95% soft-irq usage.
> Enabling vlan offloading reduces that quite a bit...but apparently make
> the system reboot itself about once every two days.
> 
> Right at this moment on the wan interface I see 34.273 rx pps and 57.232
> tx pps which is going to increase a bit in the coming hours but gives a
> good picture about the the system has to handle right now.
> 
> Regards,
>   Dennis

Here you can find a sanitized version of the config we have running
right now:
http://community.ubnt.com/t5/EdgeMAX/CPUs-show-incredibly-high-softirq-usage/m-p/1079417#U1079829

Regards,
  Dennis
