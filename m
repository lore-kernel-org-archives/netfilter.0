From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: INVALID state
Date: Sun, 28 Feb 2010 12:15:27 +0100
Message-ID: <4B8A504F.6060803@chello.at>
References: <4B8A3643.6070000@iit.bme.hu> <4B8A410A.7050003@chello.at> <4B8A4AEE.8080007@iit.bme.hu>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8A4AEE.8080007@iit.bme.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 28.02.2010 11:52, netfilter-owner@vger.kernel.org wrote:
> Mart Frauenlob wrote:
>> On 28.02.2010 10:31, netfilter-owner@vger.kernel.org wrote:
>>
>>> Dear all
>>>
>>> Could someone help me to identify the difference between
>>> the following 3 rules.
>>>
>>> 1. iptables -t mangle -A PREROUTING -p tcp ! --syn -m state --state
>>> INVALID -j DROP
>>> 2. iptables -A INPUT -p tcp ! --syn -m state --state INVALID -j DROP
>>> 3. iptables -A INPUP -p tcp ! --syn -m conntrack --cstate INVALID -j
>>> DROP
>>>
>>
>>
>> take a look at this picture, to see, that mangle/PREROUTING may catch
>> different things than filter/INPUT:
>> http://jengelh.medozas.de/images/nf-packet-flow.png
>>
>> Generally filtering (ACCEPT/DROP/REJECT) should be done in the filter
>> table, unless there is a good reason (and understanding) to do it
>> otherwise (i.e. the nat table does not allow DROP).
>> The mangle table is generally meant for packet manipulation. i.e.
>> marking, changing ip settings, etc...
>>
>> conntrack supports all states that the state match does, plus some more.
>>
>>
>> More in general:
>> imho the '! --syn' is quite unnecessary, correct me if I'm wrong.
>>

> Thanks for the help.
> 

np, but please switch to bottom posting...

> Assuming that the a packet reach the 1,2,3 rules is there a
> difference regards matching between "-m state --state INVALID"
> applied in 1 and 2 rules or the "-m conntrack --cstate INVALID"
> statements?
> 

requoting myself:
> conntrack supports all states that the state match does, plus some more

so, no difference.
