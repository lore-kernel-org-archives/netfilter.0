From: Bernardo Vieira <bernardo.vieira@terrra.com.br>
Subject: Re: 2 subnets
Date: Thu, 21 Apr 2005 12:19:33 -0300
Message-ID: <4267C485.9030307@terrra.com.br>
References: <a3382a6979.a6979a3382@vsnl.net>
	<20050421142515.GA15572@epsilon.rdc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050421142515.GA15572@epsilon.rdc.pl>
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

Getting a ride on Mariusz's question, but probably deviating off topic:
I if a had the setup where the two subnets run off the same network card 
on virtual interfaces, i.e. not physically separeted, could I still run 
a DHCP server on them? How about bandwidth limiting? Could anyone give 
me some pointers?


Mariusz Kruk wrote:

>On Thu, Apr 21, 2005 at 07:18:33PM +0500, varun_saa@vsnl.net wrote:
>  
>
>>Hello,
>>      My server is on Mandrake10.1
>>eth0 is WAN with static IP connected to 512Kbps DSL.
>>
>>We have two subnets :
>>
>>   192.168.0.0/24
>>   192.168.21.0/24
>>    
>>
>[...]
>  
>
>>My question is having seperate network card 
>>for each subnets a better option.
>>
>>eth1 and eth2.
>>
>>Or eth1 and eth:1 is also fine
>>    
>>
>
>This depends on two things:
>1. Do you want to physicaly separate these two network segments?
>2. If you want to, for example, shape the traffic, you'll have a more
>complicated setup if you have separate interfaces.
>
>Therefore it's up to you and depends only on your needs in this matter.
>
>  
>

