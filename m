From: Egon Burgener <egon.burgener@terreactive.ch>
Subject: Re: conntrackd external cache does not contain NAT information
Date: Tue, 25 Aug 2009 13:39:21 +0200
Message-ID: <9FBB2D79-0F10-4C11-AEB5-E989C1C2086F@terreactive.ch>
References: <3E64FDDA-1B89-4548-8A52-B7D15BCF3E40@terreactive.ch> <4A8EAF08.9020807@netfilter.org>
Mime-Version: 1.0 (Apple Message framework v935.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A8EAF08.9020807@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi  Pablo

Yes, you are right. The NAT information is not displayed with  
conntrackd -e but is there and gets pushed into the conntrack table  
with conntrackd -c.
Therefore, my NAT sync problem is somewhere else. I have to debug  
further.

Thanks for your assistance
Egon


On Aug 21, 2009, at 4:28 PM, Pablo Neira Ayuso wrote:

> Hi,
>
> Egon Burgener wrote:
>> Hi
>>
>> I am building a firewall with
>>  kernel 2.6.29.6
>>  iptables 2.4.4
>>  conntrack-tools 0.9.13 (FTFW mode)
>>  heartbeat version 1
>>
>> conntrack synchronisation works fine except NAT traffic. If I do
>> conntrackd -i on the active node I see the NAT information in it:
>>
>> tcp      6 ESTABLISHED src=192.168.12.20 dst=12.129.147.65 sport=2403
>> dport=80 src=12.129.147.65 dst=84.73.54.61 sport=80 dport=2403  
>> [ASSURED]
>> [active since 48s]
>>
>> On the standby node I am missing the NAT information (conntrackd -e):
>>
>> tcp      6 ESTABLISHED src=192.168.12.20 dst=12.129.147.65 sport=2403
>> dport=80 [ASSURED] [active since 91s]
>>
>> Has anybody a hint?
>
> The NAT information is there but not listed when you do `conntrackd - 
> e'
> but it's built during the commit phase that occurs when your HA  
> manager
> calls `conntrackd -c' (see the primary-backup.sh script).
>
> You can verify this by invoking `conntrack -L' to see the result of  
> the
> commit. You should see the NAT information at that stage.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-----------------------------------------------------------------------------------------
addr://Kasinostrasse 30, CH-5001 Aarau   fon://++41 62 823 9355
http://www.terreactive.com                             fax://++41 62  
823 9356
------------------------------------------------------------------------------------------
Wir sichern Ihren Erfolg.                                 terreActive AG
------------------------------------------------------------------------------------------
