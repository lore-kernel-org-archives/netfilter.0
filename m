From: Nemeth Denes <nemeth.denes@iit.bme.hu>
Subject: Re: sequence numbers in conntrack
Date: Sun, 10 Jan 2010 12:03:38 +0100
Message-ID: <4B49B40A.50403@iit.bme.hu>
References: <4B48F146.4040303@iit.bme.hu> <1263096654.2614.1.camel@vishesh-laptop> <4B49A698.6080005@iit.bme.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B49A698.6080005@iit.bme.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vishesh <linuxtovishesh@gmail.com>
Cc: netfilter@vger.kernel.org

Hi

It seems that I still had some typos is the text, sorry. I hope here is the
clear explanation of the situation:

The infrastructure:
   Host PRI (private IP) ----- <NAT>  ------ Host PUB (public IP)
   NAT(PRI) means the external mapping allocated for PRI by the NAT

A:
  (1) PRI -> PUB: SYN
  (2) PUB -> NAT(PRI): SYN-ACK (with invalid sequence number)
Question: What happens to packet (2)? If it is not filtered is is possible
to filter it?

B:
  (1) PRI -> PUB: SYN
  (2) PUB -> NAT(PRI): anything other than (SYN-ACK or SYN)
Question: What happens to packet (2)? If it is not filtered is is possible
to filter it?

C:
  Assuming that --random option is given to the POSTROUTING
  chain of the NAT box, and hosts like PRI open so many connections
  to the other side of the NAT (to hosts like PUB) that the high port
  space is used up (every port is allocated to a host behind the NAT).
Question: What will happen to a new connection?

Many thanks  for the help

 
Nemeth Denes wrote:
> Hi
>
> Sorry it was a typo it should be the following:
> (host H is behind the NAT ....)
>
> Thanks
>
> vishesh wrote:
>> On Sat, 2010-01-09 at 22:12 +0100, Nemeth Denes wrote:
>>  
>>> Hello,
>>>
>>> Could someone help me to explain what does the conntack module do
>>> in TCP connection negotiation in the following three cases: (host N is
>>> behind the NAT and host P is on the other side of the NAT)
>>>
>>> A:
>>> P sends a SYN to H and H replies with an SYN-ACK with an invalid
>>> sequence number (If this passes normally through is it possible to
>>> filter it out?)
>>>
>>> B:
>>> P sends a SYN to H and H replies with non SYN-ACK (3-way-handshake)
>>> or SYN (TCP simultaneous open) package
>>>
>>> C: If the "--random" option is given to the postrouting chain, what 
>>> happens
>>> if the clients use up all the ports?
>>>
>>> Many thanks,
>>> Denes Nemeth
>>>
>>>
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>     
>> Dear denes
>>  Do you mean N host where host H is mentioned ?
>> thnks
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>   
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

