From: Martijn Lievaart <m@rtij.nl>
Subject: Re: iptables block samba or not?
Date: Fri, 25 Jan 2008 20:02:26 +0100
Message-ID: <479A3242.4060304@rtij.nl>
References: <200801251653.m0PGr8Qe010047@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801251653.m0PGr8Qe010047@indigo.cs.bgu.ac.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eial Czerwacki <eial@cs.bgu.ac.il>
Cc: mouss <mouss@netoyen.net>, netfilter@vger.kernel.org

Eial Czerwacki wrote:
> what I meant is that I want that ssh input will be accepted only from an ip that I've initiated the connection to.
> On Fri 25 Jan 18:13 2008 mouss wrote:
>   
>> Eial Czerwacki wrote:
>>     
>>> works with it and without that, one more question, is there a way to approve a input only if I initiated the connection?
>>>   
>>>       
>> that's what your "accept all previously established connections" does if 
>> you don't add other INPUT rules.
>>     

[ Please don't toppost ]

Yes, you need the recent module for this. Add the source of outgoing 
connections to a recent table and accept on source address in that table.

Something like this (untested!):

# Don't let established packets trigger the recent match below....
-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -o $EXTERNAL_IF -m recent --set --name tcpout --rdest
-A INPUT -i $EXTERNAL_IF -m recent --rcheck --seconds 100 --name tcpout 
--rsource -m tcp  --dport 22 -j ACCEPT

HTH,
M4


