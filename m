From: DI Roman Fiedler <roman.fiedler@telbiomed.at>
Subject: Re: Connection intercept
Date: Wed, 16 Jan 2008 10:37:07 +0100
Message-ID: <478DD043.6040904@telbiomed.at>
References: <478CE2B1.2000806@telbiomed.at> <478DABBD.2000400@usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478DABBD.2000400@usa.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Josh Cepek wrote:
> DI Roman Fiedler wrote:
>> Hi all,
>>
>> I want to create an iptables setup that routes all packets that would 
>> be dropped to a gateway on a separate interface. I try to do it by 
>> marking these packets with a INTERCEPT connmark (and ACCEPT them) and 
>> use a different routing table (std. policy routing) with a default 
>> route to the separate interface.  The problem: I want to use the 
>> filter tables to do the filtering, but the packets are already routed 
>> when they reach the filter tables. So I cannot route the first packet 
>> of a connection to this special interface, hence no real connection 
>> intercept is possible.
>>
>> Setup:
>>
>> Inet  - Firewall - Internal Zone
>>                 |
>>              Intercept host
>
> Rather then fuss with routing, why not DNAT all normally rejected 
> packets to your intercept host?
The idea was that the intercept host(s) can see the original source and 
destination IP for traffic analysis (check if one source host scans all 
destinations or just permanently hits one), but I guess this is not a 
"must have". No matter which of these method is used, both of them split 
the traffic in PREROUTING and before the filter tables, which I want to 
avoid somehow (see below for explanation).

>   I'll assume for a moment that you have a fairly generic setup where 
> you accept return traffic with some rule such as `iptables -A FORWARD 
> -i ${WAN} -o ${LAN} -m state --state ESTABLISHED,RELATED -j ACCEPT` 
> and possibly services you wish to expose (like a web or SSH server.)  
> Normally all other packets sent through the firewall are dropped or 
> rejected as bogus traffic.
That's the problem: Our setup contains 7 networkcards, with vlan tagging 
more than 10 networks plus some vpns. We also need to do policy routing 
since some IPs occur more than once in the complete network setup. Some 
hundred rules are contained in a shorewall config. The problem: 
shorewall adds the filter rules to the filter table, after routing and 
natting, so massive change of setup would be needed to make pre-route 
decisions work.

My goal was to do it with minimal effort, e.g. make an iptables-save 
output patch that will transform the current iptables data to a setup 
that can do the intercepting. I do not think that it would be possible 
to do the thing with shorewall directly and I want to avoid recoding all 
filter rules in the prerouting table (some would be impossible since 
they use output interface for decision, which is not defined at this point).

I thought that perhaps somebody has done experiments with a "strange" 
setups, e.g. use a tricky combination of MIRROR targets or a loop via 
some geek netlink program that can feedback the packet from the ULOG 
target to the interface receive methods so that it can pass PREROUTING 
twice.

> DNAT, as with the CONNMARK target, can only be set prior to the 
> routing decision (and thus any filtering) but you can work around 
> that.  At the end of your PREROUTING chain on the nat table add a 
> reference to a new chain (let's call it "intercept" in this example.)  
> On that chain you want to exclude packets you normally want to let 
> through such as traffic to your public services; to do this you will 
> need to test for each condition and -j RETURN on each one.  The last 
> rule in this intercept chain will DNAT anything you don't normally 
> allow and send it instead to your intercept host.  Be sure you don't 
> include any other DNAT rules after calling the intercept chain since 
> they'll be ignored (and redirected instead to your intercept host.)  
> Here's a sample of this idea:
>
> # add an intercept chain on nat table:
> iptables -t nat -N intercept
> # call this chain for inbound packets to the public IP's of this network:
> iptables -t nat -A DNAT -i ${WAN_IFACE} -d ${YOUR_PUBLIC_NETRANGE} -j 
> intercept
> # example exceptions for web and SSH services:
> iptables -t nat -A intercept -p tcp --dport 80 -j RETURN
> iptables -t nat -A intercept -p tcp --dport 22 -j RETURN
> # send everything else to intercept host:
> iptables -t nat -A intercept -j DNAT --to-destination ${INTERCEPT_HOST}
>
> That ruleset will make exceptions for services you normally accept and 
> sent all other NEW connections to your intercept host.
>
>> The intercept host will answer for all IPs (Honeypot like), so that 
>> connections that would have been refused are openen and can be 
>> analysed. Example: Host xxxx from internal zone tries to reach 
>> nonstandard mail exchange, mail connection is automatically routed to 
>> the intercept host and mail is captured to see if xxxxx is just 
>> malconfigured or if some malware tries to send out some data.
>
> The one remaining issue is how you handle the response to connections 
> on your intercept host.  The above rules will just blindly forward any 
> traffic normally rejected to the intercept host as if it was actually 
> the final destination, but it is still up to the host to establish the 
> connection and send out the proper reply.  This means you'll need to 
> set up applications for any service you want to receive connections 
> from, such as mail, web, SSH, telnet, etc.  You're probably already 
> aware of this point, but I just wanted to re-iterate it for completeness.

The intercept host will have some honey-pot like setup, so it will 
answer quite a few protocols.

lg roman



