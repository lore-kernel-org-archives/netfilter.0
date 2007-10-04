From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Re: conntrack ctstate - multiple ISP links
Date: Thu, 04 Oct 2007 16:53:28 +0200
Message-ID: <4704FE68.5000706@darkstar.nom.za>
References: <4704A472.5080609@darkstar.nom.za> <4704C15E.9090203@plouf.fr.eu.org> <4704EB43.2000902@darkstar.nom.za> <4704F180.5000200@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704F180.5000200@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>

Pascal Hambourg wrote:
> [Please send your reply on the list so everyone can see it]
>
>> The incoming packets are not leaving out of the correct interfaces, 
>> someone else has suggested that I need to use iptables as below:
>>
>> iptables -t mangle -N alreadyestablished
>> iptables -t mangle -A alreadyestablished -j CONNMARK --restore-mark
>>
>> iptables -t mangle -A PREROUTING -m connmark ! --mark 0 -j 
>> alreadyestablished
>> iptables -t mangle -A PREROUTING -m ctstate --conntrack NEW -i eth1 
>> -j CONNMARK --set-mark 11
>> iptables -t mangle -A PREROUTING -m ctstate --conntrack NEW -i eth2 
>> -j CONNMARK --set-mark 12
>>
>> and then iproute2 to route based on the 'mark'.
>> Would this be the correct solution?
>
> The principle is correct.
>
>> I am trying to get ctstate working so that I can test this
>
> The syntax is wrong. The correct syntax is "-m conntrack --ctstate NEW".
> Besides, this just does the same as "-m state --state NEW".
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Would I have to do a CONNMARK --save-mark on the POSTROUTING for this to 
work?
I have also followed this: 
http://andthatsjazz.org:8/lartc/MultihomedLinuxNetworking.html
When I dont use the above rules the connection is made but the packets 
leave the wrong interface, with the above rules the connection is not 
made at all.

Paulo
