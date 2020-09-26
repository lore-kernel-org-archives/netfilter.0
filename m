From: sean darcy <seandarcy2@gmail.com>
Subject: Re: rate limit SIP INVITES
Date: Sat, 26 Sep 2020 16:34:45 -0400
Message-ID: <rko8l5$1282$1@ciao.gmane.io>
References: <rko3n2$jjm$1@ciao.gmane.io> <rko84s$9ir$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <rko84s$9ir$1@ciao.gmane.io>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 9/26/20 4:26 PM, sean darcy wrote:
> On 9/26/20 3:10 PM, sean darcy wrote:
>> nftables-0.9.6
>>
>> I'm running a VOIP server. There are lots of script kiddies who will 
>> bang away with 10/sec SIP INVITES or REGISTERS .
>>
>> In iptables you can match on the string:
>>
>> -A SIP   -i eth0 -p udp -m udp --dport 5060 -m string   --string 
>> "INVITE" --algo bm --from 23 --to 28 -m comment --comment "Catch SIP 
>> INVITEs" -j SIPINVITE
>>
>> -A SIP   -i eth0 -p udp -m udp --dport 5060 -m string   --string 
>> "REGISTER" --algo bm --from 23 --to 30 -m comment --comment "Catch SIP 
>> REGISTERs" -j SIPREGISTER
>>
>> I'm looking at RAW to do the same:
>>
>> meta l4proto udp udp dport 5060 @th,184,224 0x494e56495445 counter
>>
>> where 184 = 23*8, and 224 = 28*8. INVITE is 0x494e56495445 in hex
>>
>> I have a prerouting chain:
>>
>> table ip filter-asterisk {
>>      chain output-asterisk {
>>          ..................
>>      }
>>
>>      chain prerouting {
>>          type filter hook prerouting priority raw; policy accept;
>>      }
>> }
>>
>> but no joy when I try to add the rule:
>>
>> nft add rule filter-asterisk prerouting meta l4proto udp udp dport 
>> 5060 @th,184,224 0x494e56495445 counter
>> Error: Could not process rule: Value too large for defined data type
>> add rule filter-asterisk prerouting meta l4proto udp udp dport 5060 
>> @th,184,224 0x494e56495445 counter
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
>>
>>
>> Any help appreciated.
>>
>> sean
>>
>>
> 
> Closer reading of the man page:
> 
> # nft add rule filter-asterisk prerouting meta l4proto udp udp dport 
> 5060 @th,184,96 0x494e56495445 counter
> #
> 
> The 3rd parameter of the raw expression is bit length (16 * the six 
> characters in INVITE , correct?).
> 
> Now let's see if it works.
> 
> sean
> 
> 
Or better 192,  32 * the 6 characters in INVITE. It seems there are 2 
hex numbers for each ascii character.

