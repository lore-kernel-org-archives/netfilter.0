From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Ramdom NAT drop
Date: Wed, 21 Oct 2009 09:55:34 +0200
Message-ID: <4ADEBE76.20700@chello.at>
References: <034DEBCAE934A74991E6E76B8DA72D14182B54DFB0@HSSBS.holdstead.local> <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Gary Smith wrote:
> Anyone?
>
>   
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
>> owner@vger.kernel.org] On Behalf Of Gary Smith
>> Sent: Tuesday, October 13, 2009 5:13 PM
>> To: 'netfilter@vger.kernel.org'
>> Subject: Ramdom NAT drop
>>
>> Hello,
>>
>> I have a scenario where we are NAT'ing multiple ports and in some cases
>> entire IP addresses to our internal private range.  Some time ago we
>> noticed that web pages from one of the web servers would randomly fail.
>> Investigating it we found that conntrack was full and that packets were
>> being dropped.
>>
>> So, since the server has ram, we upped the max bucket and conntrack to
>> 1048576 and 4194304, respectably.  The problem appears to go away as we
>> watched the counter go above 40k connections.  It has since then been
>> hovering around 40k (currently 35k).
>>
>> About two weeks later, I noticed that I started getting the failures
>> again.  Checking the firewall, connections looked good (once again, 40k
>> or so).  Checked the web server logs, request never hit.  What I found
>> is that after about 20 minutes or so I will see this failure randomly.
>> I think it's in conjunction with some type of keep alive in IE/Firefox.
>> So, when the problem happens in IE, and the pages continually fail, if
>> I open up Firefox the page comes up fine.  This issue comes up when
>> hitting the page from internally on the network through NAT
>>
>> To me is looks like NAT is dropping the connection that has been
>> established and doesn't want to reconnect.  A tcpdump on the external
>> interface shows the request stopping at the iptables firewall and not
>> going beyond that.  But then everything will clear up for a few days.
>>
>> Here are the relevant rules:
>>
>> -A PREROUTING -d 208.209.210.211 -j DNAT --to-destination 192.168.0.10
>> -A INPUT -d 208.209.210.211 -i eth1 -p tcp -m tcp --sport 20 --dport
>> 1024:65535 -j ACCEPT
>> -A INPUT -d 208.209.210.211 -i eth1 -p tcp -m tcp -m multiport --dports
>> 80,443,21,20 -j ACCEPT
>> -A OUTPUT -d 208.209.210.211 -j DNAT --to-destination 192.168.0.10
>>
>> The final rule is a log and drop for anything coming in on this
>> particular IP address (which I know works as we see a lot of attempts
>> for 445).
>>
>> I'm just trying to find any logic reason on why the connections are
>> getting dropped.  I'm thinking it's NAT, but that's just a WAG at this
>> point.
>>
>> OS is CentOS 5, 2.6.18-128.el5, iptables v1.3.5, minimal install,
>> firewall only.  Machine has 512mb ram.
>>
>>              total       used       free     shared    buffers
>> cached
>> Mem:        515444     483240      32204          0     141504
>> 296208
>> -/+ buffers/cache:      45528     469916
>> Swap:      1052248          0    1052248
>>
>> Any advice?
>>     

Hello,

I'm just guessing, but what I know from my FW logs, is that IE tends to 
send packets in INVALID state.
That would explain, why there's no problem with Firefox.

Regards

Mart
