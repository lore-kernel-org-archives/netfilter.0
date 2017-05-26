From: Juergen Schmidt <abcdmail@freenet.de>
Subject: Re: regression: nf_conntrack_sip: kernel BUG at
 ../net/netfilter/nf_conntrack_helper.c:384! since linux 4.8
Date: Fri, 26 May 2017 06:14:54 +0200
Message-ID: <b5e81cf1-f6b8-2e0c-23c2-d0bae02c2a0e@freenet.de>
References: <a72bec87-be30-65ce-818b-b3e9d22ab867@freenet.de>
 <136ee9f0-1e80-01f2-8dc4-e7d2fc8e2269@freenet.de>
 <20170525184940.GA4772@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170525184940.GA4772@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 05/25/2017 at 08:49 PM Pablo Neira Ayuso wrote:
> Could you try this patch?

Works for me. Problem was, that the second port deleted the second array
entry and therefore the NULL checker came up later on.

Please include it to stable kernels as it is clearly a regression and
harms formerly working environments.

Could you please explain the acronym "BSS"?


What about the second patch?


Thanks,
Juergen.


> 
> commit da2f27e9e615d1c799c9582b15262458da61fddc
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Wed Mar 1 15:33:26 2017 +0100
> 
>     netfilter: nf_conntrack_sip: fix wrong memory initialisation
> 
> We can request inclusion of this patch to -stable kernels.
> 
> On Thu, May 25, 2017 at 07:50:57PM +0200, Juergen Schmidt wrote:
>> On 05/25/2017 at 10:51 AM Juergen Schmidt wrote:
>>> Hello!
>>>
>>> If you want to use more than one port (like
>>> modprobe nf_conntrack_sip 777,778), you get the following BUG (linux 4.9.x):
>>>
>>>

>> The second patch nf_conntrack_sip.port.patch makes it work like
>> documented. The helper -j CT e.g. can now be addressed via sip-$port and
>> not sip-$index (which is confusing).
>>
>>
>> Regards,
>> Juergen
> 


>> --- a/net/netfilter/nf_conntrack_sip.c	2016-12-11 20:17:54.000000000 +0100
>> +++ b/net/netfilter/nf_conntrack_sip.c	2017-05-25 07:46:56.000000000 +0200
>> @@ -1633,22 +1633,22 @@
>>  		memset(&sip[i], 0, sizeof(sip[i]));
>>  
>>  		nf_ct_helper_init(&sip[4 * i], AF_INET, IPPROTO_UDP, "sip",
>> -				  SIP_PORT, ports[i], i, sip_exp_policy,
>> +				  SIP_PORT, ports[i], ports[i], sip_exp_policy,
>>  				  SIP_EXPECT_MAX,
>>  				  sizeof(struct nf_ct_sip_master), sip_help_udp,
>>  				  NULL, THIS_MODULE);
>>  		nf_ct_helper_init(&sip[4 * i + 1], AF_INET, IPPROTO_TCP, "sip",
>> -				  SIP_PORT, ports[i], i, sip_exp_policy,
>> +				  SIP_PORT, ports[i], ports[i], sip_exp_policy,
>>  				  SIP_EXPECT_MAX,
>>  				  sizeof(struct nf_ct_sip_master), sip_help_tcp,
>>  				  NULL, THIS_MODULE);
>>  		nf_ct_helper_init(&sip[4 * i + 2], AF_INET6, IPPROTO_UDP, "sip",
>> -				  SIP_PORT, ports[i], i, sip_exp_policy,
>> +				  SIP_PORT, ports[i], ports[i], sip_exp_policy,
>>  				  SIP_EXPECT_MAX,
>>  				  sizeof(struct nf_ct_sip_master), sip_help_udp,
>>  				  NULL, THIS_MODULE);
>>  		nf_ct_helper_init(&sip[4 * i + 3], AF_INET6, IPPROTO_TCP, "sip",
>> -				  SIP_PORT, ports[i], i, sip_exp_policy,
>> +				  SIP_PORT, ports[i], ports[i], sip_exp_policy,
>>  				  SIP_EXPECT_MAX,
>>  				  sizeof(struct nf_ct_sip_master), sip_help_tcp,
>>  				  NULL, THIS_MODULE);
> 
