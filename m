From: gummi7@simnet.is
Subject: Re: Measuring traffic that goes thrugh a specific IP
Date: Thu, 6 Feb 2003 12:33:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <isapiwc.433ab781.55d.3e425613.69620.b1@postur.simnet.is>
References: <isapiwc.433ab781.5d1d.3e3d9787.496f4.ad@postur.simnet.is>
 <200302060039.58779.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302060039.58779.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

"If you mean that the specific IP is simply a router somewhere that the traffic 'might happen' to pass through in its travels"
That's exactly what I want to do :(
I can always find out if a packet passes trough that specifec IP(the one I want to measure, therefore being internatoinal) by using a tool like DOS's "tracert", doesn't that help?
Do you know of a program for linux that does what I am trying to do?

> On Sunday 02 February 2003 05:11 pm, gummi7@simnet.is wrote:
>> Hello
>>
>> I'm a linux/iptables/netfilter newbie, but I want to ask you a simple
>> question. It's a long story and unrellevant to tell you why I want to
>> do it so i'll just get straigt to the point.
>>
>> I want to be able to measure(with my linux router) all the traffic
>> from the computers on my network that go thrugh a specifc IP number
>> wich is located in another place in my country. That is, if a computer
>> on my network accesses a website and goes trough a specifed IP number
>> to get that website, I want to be able to measure the amount of data
>> that goes trough that specified IP number, but only the data on my
>> behalf. Note that I do not have phisical(nor telnet or ssh) access to
>> the router with the specifed IP number that I want to measure.
>>
>> Can I do that with iptables and/or ipfilter? A yes is all I have to
>> hear if that is possible but an example or a little help wouldn't hurt
> 
> If you mean that the specific IP is the destination of a packet, IE 
> machines explicitly connect to that IP and it is listed in the header, 
> there is no problem.  If you mean that the specific IP is simply a 
> router somewhere that the traffic 'might happen' to pass through in its 
> travels, I think you're out of luck.
> 
> You can tally all traffic to a specific destination IP with:
> 
> /sbin/iptables -d w.x.y.z
> 
> at the top of your FORWARD chain, and then "iptables -L -v -n" will list 
> your rules, and this 'do-nothing' rule will list packet counts and byte 
> totals that matched it without actually having DONE anything.  Adding 
> '-j LOG --log-prefix "HIT:"' to the end of the above rule would log 
> information on ALL packets with that IP as destination, but if this is a 
> large amount of traffic then your /var/log/messages (default) logfile 
> would chew up hard drive space at an apalling rate.
> 
> j
> 

