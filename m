From: "Carlos Cruells" <carlos.cruells@betybyte.com>
Subject: Re: Outgoing NAT problem.
Date: Tue, 5 Jul 2005 17:16:31 +0200
Message-ID: <19f501c58174$9d4177b0$1e0c0a0a@betybyte.local>
References: <19b901c58170$e51cd740$1e0c0a0a@betybyte.local>
	<200507051000.47435.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

Yes, sorry, the source IP where i do my tests is "10.10.12.30" of course.

You wrote...
> If a packet has a source IP of 10.10.12.30 and is routed out the eth1
> interface, rewrite the source IP to 62.93.44.116.

...but it doesn't works and i don't know why.   :(

It is correct, isn't it?--> iptables -t nat -A POSTROUTING -s 10.10.12.30 -o 
eth1 -j SNAT --to 62.93.44.116

Regards.





----- Original Message ----- 
From: "/dev/rob0" <rob0@gmx.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, July 05, 2005 5:00 PM
Subject: Re: Outgoing NAT problem.


> On Tuesday 05 July 2005 09:50, Carlos Cruells wrote:
>> iptables -t nat -A POSTROUTING -s 10.10.12.30 -o eth1 -j SNAT --to
>> 62.93.44.116
>
> If a packet has a source IP of 10.10.12.30 and is routed out the eth1
> interface, rewrite the source IP to 62.93.44.116.
>
>> When i do a simple ping test from LAN --> Internet, it fails, but if
>
> Don't do it from anywhere on the LAN. Only do it from 10.10.12.30. It
> won't work from any other IP. Perhaps you wanted to use a different
> source specification, like "-s 10.10.12.0/24" or "-s 10.0.0.0/8"?
>
>> i repeat the same test from firewall, it does ok.
>>
>> IP_LAN -------(ping)--------> IP www.cisco.com = Not OK
>> Firewall -------(ping)--------> IP www.cisco.com = OK
>
> DNS might also be a factor. Only the firewall machine and 10.10.12.30
> would be able to get out to any external resolvers with that rule.
> -- 
>    mail to this address is discarded unless "/dev/rob0"
>    or "not-spam" is in Subject: header
>
> 


