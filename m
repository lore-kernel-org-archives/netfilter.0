From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: iptables
Date: Mon, 31 Jan 2005 08:18:00 -0500
Message-ID: <41FE3008.4010008@opensourcedevel.com>
References: <5.2.0.9.0.20050131123100.02a937a0@pazim.home.pl>
	<5.2.0.9.0.20050131123100.02a937a0@pazim.home.pl>
	<5.2.0.9.0.20050131135158.02a9dec0@poczta.interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20050131135158.02a9dec0@poczta.interia.pl>
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
To: Alabama <alabama@interia.pl>, netfilter@lists.netfilter.org

Which interfaces are used for you public and DMZ networks? Are you using 
DNAT for your DMZ servers? If so, have you remembered to bind the 
addresses for those servers using iproute2? If you are unfamiliar with 
doing this, there are some slide shows in the training section of 
http://iscs.sourceforge.net that deal with iptables and iproute2 - John

Alabama wrote:
> Hello
> I am afraid it does not work. Output works perfectly but I can not to 
> use none of input services e.g. ftp, www etc.
> Under public addresse a I have my clients and do not want to block them 
> any ports and services
> Best regards
> Andy
> At 06:48 05-01-31 -0500, you wrote:
> 
>> Alabama wrote:
>>
>>> Dear All,
>>> I have linux router with 3 NIC cards.
>>> One is an internet interface. Second is my LAN network and third is 
>>> public addresses network.
>>> I am using iptables. My LAN network works perfectly filtering 
>>> packets. I have problems with my public addresses network- I would 
>>> like this network to work without any filtering and just can't do it.
>>> Could give me advice how to pass by iptables or how to set up 
>>> iptables to route traffic to public addresses without any filtering?
>>> Best regards
>>> Andy
>>> ----------------------------------------------------------------------
>>> Najlepsze auto, najlepsze moto... >>> http://link.interia.pl/f1841
>>>
>> I do not know the details of your installation so there may be a good 
>> reason for you to do this but I would normally never recommend no 
>> filtering even, perhaps especially, to a DMZ.
>>
>> In any event, you can probably regulate the traffic using the 
>> interfaces, e.g.,
>>
>> iptables -I FORWARD 1 -i eth0 -o eth2 -j ACCEPT
>> iptables -I FORWARD 1 -i eth2 -o eth0 -j ACCEPT
>>
>> That's what comes to mind off the top of my head.  Good luck and, 
>> unless you have a really good reason, I would not recommend doing 
>> this.  If the problem is just the complexity of managing changing 
>> security on the DMZ, consider a GUI front end like fwbuilder 
>> (http://www.fwbuilder.org) or, for large and highly complex 
>> environments ISCS (http://iscs.sourceforge.net) when it is ready - John
>>
>> -- 
>> John A. Sullivan III
>> Open Source Development Corporation
>> +1 207-985-7880
>> jsullivan@opensourcedevel.com
>>
>> Financially sustainable open source development
>> http://www.opensourcedevel.com
> 
> 
> 
> ----------------------------------------------------------------------
> Najlepsze auto, najlepsze moto... >>> http://link.interia.pl/f1841
> 
> 


-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com

