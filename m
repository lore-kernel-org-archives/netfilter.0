From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Forward Chain: is Inbound traffic on eth0 not also Outbound 
 depending on your view?
Date: Mon, 09 Nov 2009 11:00:32 +0100
Message-ID: <4AF7E840.3060801@chello.at>
References: <ac5c74140911080311g21df128fte32b05d90b233a33@mail.gmail.com>	 <33be4bb30911080621w42e006a3n2f228f77699a277e@mail.gmail.com> <ac5c74140911080644t3f028a38jcf06d2992a59242c@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74140911080644t3f028a38jcf06d2992a59242c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

paddy joesoap wrote:
> Hi guy's
>
> I was just reading through the links Mart provided to try and get a
> handle on things.
>
> Suppose this is the scenario:
>
> Internet -- Firewall -- Web server where the firewall has eth0 =
> External and eth1 = Internal
>
> My understanding of seeing examples on the web (please correct me if I
> am wrong) is that access to a web server can be permitted as follows:
>
> Scenario 1:
> iptables -A FORWARD -i eth0 -s anyIP --sport anyPort -d webServIP
> --dport 80  -j ACCEPT
> iptables -A FORWARD -o eth1 -s webServIP --sport 80 -d anyIP --dport
> anyPort  -j ACCEPT
>
> I was just wondering must I also include 2 other rules:
>
> Scenario 2:
> iptables -A FORWARD -i eth0 -s anyIP --sport anyPort -d webServIP
> --dport 80  -j ACCEPT // external in on eth0
> iptables -A FORWARD -o eth1 -s anyIP --sport anyPort -d webServIP
> --dport 80  -j ACCEPT // new rule. external out on eth1 toward web
> server
> iptables -A FORWARD -o eth1 -s webServIP --sport 80 -d anyIP --dport
> anyPort  -j ACCEPT
> iptables -A FORWARD -i eth0 -s webServIP --sport 80 -d anyIP --dport
> anyPort  -j ACCEPT // new rule
>
> >From what I can gather of the iptables tutorial, I don't have to worry
> about the 2 new rules. Perhaps they are redundant, in the sense that
> traffic is being filtered in one direction of each interface and
> filtering the same kind of traffic in both directions on each
> interface maybe considered duplication.
>
> But then again what about the default policy of Drop. Would not having
> these two new rules mean http traffic fails? My guess is after traffic
> has been processed (from the netfilter flow diagram Maart sent)
> in one direction it is the automatically routed to the second
> interface without filtering. So the answer is yes, http traffic will
> still get by. Correct?
>
> This now makes me as the question why bother with filtering eth1 at
> all in Scenario 1? Could the rules equally have been written as:
>
> Scenario 3: (note single interface used, filter in both directions on eth0)
> iptables -A FORWARD -i eth0 -s anyIP --sport anyPort -d webServIP
> --dport 80  -j ACCEPT
> iptables -A FORWARD -o eth0 -s webServIP --sport 80 -d anyIP --dport
> anyPort  -j ACCEPT
>
> Again apologies for the obvious stupidity on my part.
>   

As soon a packet matches a rule and the target is terminating, like the 
ACCEPT target is, there is no more filtering on the packet - it is ACCEPTED.
Hence your rules would be redundant.
As i already told you, you can use -i eth0 and -o eth1 for FORWARD 
rules, if you desire/and or need that.

regards

Mart
>
> On Sun, Nov 8, 2009 at 2:21 PM, Oskar Berggren <oskar.berggren@gmail.com> wrote:
>   
>> You seem to be over-thinking in the wrong direction. :)
>>
>> iptables by itself is not concerned with what you as administrator
>> consider "outbound" or "inbound" traffic to/from your "network".
>>
>> -i <interfacename> simply mean: match traffic arriving to this machine
>> on this interface.
>> -o <interfacename> simply mean: match traffic that the routing system
>> says will leave this machine via this interface.
>>
>> These are from the perspective of the firewall itself. What inbound
>> and outbound means with respect to your client machines is a different
>> thing.
>>
>> Provided that you have no other interfaces the two rules you've
>> specified actually both match the same traffic: Packets arriving on
>> eth0 and being routed to the subnet on eth1. However, none of those
>> rules will match traffic arriving on eth1 (from your clients), heading
>> for the external network.
>>
>> /Oskar
>>
>>
>> 2009/11/8 paddy joesoap <paddyjoesoap@gmail.com>:
>>     
>>> Dear Experts
>>>
>>> I am curious to know more about what FORWARD chain inbound and
>>> outbound actually mean.
>>>
>>> Example firewall set-up below:
>>>
>>> Internet --- Firewall --- PC
>>>
>>> Firewall has 2 interfaces: eth0 = External and eth1 = Internal
>>>
>>> From what I can gather from the Netfilter website, all I need to do is
>>> create are inbound and outbound rules on the FORWARD chain.
>>>
>>> To allow inbound Internet access, I specify:
>>>
>>> FORWARD -i eth0
>>>
>>> To allow outbound PC access, I specify:
>>>
>>> FORWARD -o eth1
>>>
>>> The question is from whose perspective do you view what is inbound and
>>> what is outbound?
>>>
>>> For example, in the case of the Internet client, traffic flowing
>>> towards the firewall is indeed Inbound so naturally "FORWARD -i eth0"
>>> is required. However, isn't it also Outbound on eth1, given that it
>>> leaves interface eth1 to get to PC?
>>>
>>> Similarly, clients on the internal network think of their traffic as
>>> being outbound only, but when traffic is being "forwarded" from eth1
>>> to eth0 heading for the Internet, isn't that traffic classed as
>>> Inbound on eth0?
>>>
>>> Do I need to create rules for this scenario also or is Netfilter
>>> handling these implied situations?
>>>
>>> Beginner questions so apologies in advance.
>>> Paddy.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>       
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

