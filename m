From: "Diana Asnani" <sakal_woman@hotmail.com>
Subject: Re: newbie at routing !!
Date: Wed, 07 Jun 2006 18:46:39 +0800
Message-ID: <BAY19-F1075A5A2BEA2CCF5AFFE059E8A0@phx.gbl>
References: <448692B3.6080907@multitech.co.in>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <448692B3.6080907@multitech.co.in>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi Vinod,

thanks for the reply...the gateway for my 192.168.202.1 PC is 192.168.202.14 
which is the vlan router which enables me to ping the 192.168.206.1 vlan 
address...for the route in the network device control, the destination 
network is 192.168.206.0, the subnet mask 255.255.255.240 and the gateway as 
192.168.202.14...this is what i have done so far...i am not too sure on how 
i should configure a default gateway ot static route...

>From: Vinod Chandran <vinod_chandran@multitech.co.in>
>To: Diana Asnani <sakal_woman@hotmail.com>
>Subject: Re: newbie at routing !!
>Date: Wed, 07 Jun 2006 14:17:47 +0530
>
>Hi,
>
>You need to have a route configured to reach 202.184.41.0/24 network.
>Check ur routing table
>May be u need to configure a default gateway or a static route.
>
>Regards,
>Vinod C
>
>Diana Asnani wrote:
>
>>Hi,
>>
>>I need help!! My VLAN IP is 192.168.202.1. I can ping another PC with the 
>>VLAN IP of 192.168.206.1 but i can't ping the 202.184.41.41 address in 
>>that PC. Am i supposed to do some sort of routing configuration? I am 
>>using FC3 as my OS. What am i supposed to do to ping 202.184.41.41? Thanks
>>
>>_________________________________________________________________
>>Get your mobile ringtones, operator logos and picture messages from MSN 
>>Mobile http://msn.smsfactory.no/
>>
>>
>

_________________________________________________________________
Find just what you are after with the more precise, more powerful new MSN 
Search. http://search.msn.com.my/ Try it now.


