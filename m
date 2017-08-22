From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: IPv6: unknown packet logged ...
Date: Tue, 22 Aug 2017 17:40:39 +0200
Message-ID: <287d31fb-3e70-0b44-523d-e93b9807d884@pkfnet.co.za>
References: <f1a8f3cdd11c6f2fa7a5946a0cf4c66f.1503412939@squirrel.mail>
 <3c69b7a5-7e01-de66-02be-acd6029be63a@pkfnet.co.za>
 <2209fd5722f46870a684a9f6604fd12e.1503413970@squirrel.mail>
 <5d75f004-0072-7e6a-f098-c20f8364ee05@pkfnet.co.za>
 <599C4F65.8080906@mathemainzel.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <599C4F65.8080906@mathemainzel.info>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Walter H." <Walter.H@mathemainzel.info>
Cc: netfilter@vger.kernel.org


On 22/08/2017 17:36, Walter H. wrote:
> On 22.08.2017 17:08, Mark Coetser wrote:
>> On 22/08/2017 16:59, Walter H. wrote:
>>> On Tue, August 22, 2017 16:47, Mark Coetser wrote:
>>>> On 22/08/2017 16:42, Walter H. wrote:
>>>>> Hello,
>>>>>
>>>>> I have these rules at the beginning of /etc/sysconfig/ip6tables
>>>>>
>>>>> # Filter all packets with state INVALID
>>>>> -A INPUT -m state --state INVALID -j DROP
>>>>> -A FORWARD -m state --state INVALID -j DROP
>>>>> -A OUTPUT -m state --state INVALID -j DROP
>>>>>
>>>>> and on bottom these rules:
>>>>>
>>>>> # Log all other
>>>>> -A INPUT -j LOG --log-prefix "IPv6[IN]: " --log-level 7
>>>>> -A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7
>>>>> -A OUTPUT -j LOG --log-prefix "IPv6[OUT]: " --log-level 7
>>>>>
>>>>> which rule would have catched these logged packets:
>>>>>
>>>>> [70223.386265] IPv6[FWD]: IN=sit1 OUT=br0
>>>>> SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 
>>>>> TC=0
>>>>> HOPLIMIT=60 FLOWLBL=617912 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
>>>>> RES=0x00 ACK PSH URGP=0
>>>>> [70232.150311] IPv6[FWD]: IN=sit1 OUT=br0
>>>>> SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 
>>>>> TC=0
>>>>> HOPLIMIT=60 FLOWLBL=949795 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
>>>>> RES=0x00 ACK PSH URGP=0
>>>>> [70249.740932] IPv6[FWD]: IN=sit1 OUT=br0
>>>>> SRC=2a00:1450:4001:081a:0000:0000:0000:200e DST=myipv6addr LEN=123 
>>>>> TC=0
>>>>> HOPLIMIT=60 FLOWLBL=811062 PROTO=TCP SPT=443 DPT=59073 WINDOW=1171
>>>>> RES=0x00 ACK PSH URGP=0
>>>>
>>>> those logged packets are from packets traversing your filter FORWARD
>>>> chain obviously no rule is matching which is why its triggering the 
>>>> last
>>>> rule which is
>>>>
>>>> -A FORWARD -j LOG --log-prefix "IPv6[FWD]: " --log-level 7
>>>>
>>> of course, and which rule would I have to add bevor this rule, so that
>>> these are not logged ...?
>>
>> It depends on what you want to allow, if you want to allow all traffic 
>> between interface sit1 and br0
>>
>> -I FORWARD -i sit1 -o br0 -j ACCEPT
>>
>> although the logged packets above show the source port being tcp/443 
>> which means this connection came in br0 and out sit1 so you are 
>> probably missing an established/related rule. 
> this rules are after dropping invalid and before logging
> 
> # Enable forwarding to IPv6-Tunnel interface
> -A FORWARD -i br0 -o sit1 -j ACCEPT
> # Enable established, related packets back through
> -I FORWARD -i sit1 -o br0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> so I have the problem, that I cannot really know, why these packets were 
> logged ...
> 
> 

without seeing your whole ruleset its pretty hard to tell or at least 
see your filter forward rules as for the estabalished/related rule you 
dont have to specify the input/output interfaces
