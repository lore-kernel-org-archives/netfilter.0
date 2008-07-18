From: Brian <brian@standarduniversal.com.au>
Subject: Re: MARK and CONNMARK
Date: Sat, 19 Jul 2008 00:32:23 +1000
Message-ID: <4880A977.4040100@standarduniversal.com.au>
References: <200807161046.39247.vladislav.kurz@webstep.net> <alpine.LNX.1.10.0807161156560.26724@fbirervta.pbzchgretzou.qr> <200807161233.51463.vladislav.kurz@webstep.net> <487E0F3B.3070904@riverviewtech.net> <487EED34.7000304@standarduniversal.com.au> <alpine.LNX.1.10.0807170916180.18697@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807170916180.18697@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

still I am having some unexpected results

if I do


iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A POSTROUTING -m mark  --mark 3 -j ACCEPT
iptables -t mangle -A POSTROUTING -o eth41  -j MARK --set-mark 3
iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark

then

iptables -t mangle --list
yields

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
CONNMARK   0    --  anywhere             anywhere            CONNMARK 
restore
ACCEPT     0    --  anywhere             anywhere            MARK match 0x3
MARK       0    --  anywhere             anywhere            MARK set 0x3
CONNMARK   0    --  anywhere             anywhere            CONNMARK save

so it looks like it is ignoring the -o eth41 in the mark statement. It 
appears to be working right, but looks not right...

how can  I see the -o eth41 in the iptables -t mangle --list command or 
can I not



regards

Brian


Jan Engelhardt wrote:
> On Thursday 2008-07-17 08:56, Brian Austin wrote:
>
>   
>> Hi,
>>
>> sorry to hijack the thread a little bit... Just say I want to mark the
>> connections based on the network they are coming from/going to... does this
>> look appropriate?
>>     
>
> See http://dev.medozas.de/NF-Cookbook.txt (item 5) for a cooked 
> approach.
>   
