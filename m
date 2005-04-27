From: Mark Wells <markus@wiztech.cc>
Subject: Re: NAT problem when coming from private network
Date: Wed, 27 Apr 2005 14:03:48 -0700
Message-ID: <426FFE34.6060009@wiztech.cc>
References: <49795.72.11.67.10.1114115075.squirrel@72.11.67.10>
	<4268779A.70401@riverviewtech.net> <426FFD39.3020001@gotvoice.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426FFD39.3020001@gotvoice.com>
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
To: Mark Wells <mwells@gotvoice.com>
Cc: netfilter@lists.netfilter.org, Taylor Grant <gtaylor@riverviewtech.net>


Hey Taylor and all,

I just wanted to thank you for your help on this. I haven't had a chance 
to actually try your suggestion yet(I'm the lone admin for a growing 
startup), but I will get to it. For now, I did the dual DNS thing to 
limp by. Slightly lame I know, but being the only admin here I got a ton 
of stuff piled on my plate.

I just wanted to let you guys know that it is greatly appreciated not 
only by me, but a friend of mine who has the same problem.

I'll let you guys know how it worked(or come begging for more help ;)) 
when I get a chance to try it in a few days or whenever I can.

Thanks again!

Mark

>
>
>
> Taylor Grant wrote:
>
>>> Pretty standard stuff.
>>
>>
>>
>> Yes what you are doing could be considered standard and not complex.  
>> Thus there are some gremlins at work in this situation.
>>
>>> The problem comes when we try to hit the mail server (by going to that
>>> outside ip),  from a machine that's already on the private network. 
>>> So for
>>> example if I telnet to port 25 on 72.11.67.10 from my personal machine
>>> which is on 192.168.1.34 I get nothing. According to my reading of the
>>> rule, any packets that come from the outside bound for port 25 on the
>>> 72.11.67.10 should be NATted to 192.168.1.8. Which they are if they 
>>> come
>>> from the outside. Why shouldn't it work if packets try to hit port 
>>> 25 on
>>> 72.11.67.10 from the private network then?
>>
>>
>>
>> I'm not 100% sure, but I think the problem lies in the fact that when 
>> your traffic comes in your $INTERNAL (eth1) LAN interface and FORWARD 
>> and SNAT out to loop back in to your $EXTERNAL (eth0) interface your 
>> traffic never really does go out the $EXTERNAL (eth0) interface b/c 
>> the external ip (72.11.67.10) is directly accessible on the router / 
>> firewall machine it's self and thus is not subject to the inbound 
>> DNATing that you are doing. It's sort of like being able to ping your 
>> own LAN IP even if you have the cable unplugged.  However I could be 
>> completely off base on this.  Any one have any follow up on this?
>>
>>> I tried something like this(and a few variations) to no avail:
>>> /usr/sbin/iptables -t nat -A PREROUTING -i $INTERNAL -d 72.11.67.10 
>>> -p tcp
>>> --destination-port 25 -j DNAT --to-destination 192.168.1.8:25
>>> /usr/sbin/iptables -A FORWARD -p tcp -i $INTERNAL -d 192.168.1.0/24 
>>> -j ACCEPT
>>
>>
>>
>> You will actually want to use this rule to DNAT internal traffic 
>> destined to the external 72.11.67.10 IP address.  However there is 
>> more that needs to be done.  (See below)
>>
>>> I also tried commenting out these lines:
>>> /usr/sbin/iptables -A FORWARD -i $EXTERNAL -s 192.168.0.0/16 -j DROP
>>> /usr/sbin/iptables -A INPUT -i $EXTERNAL -s 192.168.0.0/16 -j DROP
>>
>>
>>
>> I think you can put these rules back in as I don't think the traffic 
>> is ever really going out the $EXTERNAL (eth0) interface and 
>> subsequenly back in and thus subject to said rules.
>>
>>> Which are the standard lines for blocking packets with spoofed private
>>> network addresses that might show up from the net.
>>
>>
>>
>> Yes they are and you do want to have such rules.  In fact the more 
>> that you do have and the more strengent that you can be the better.  
>> See RFC 3330 if you want to be absolutely as tight as possible.
>>
>>> I only did that as a test to see if that was where the packets were
>>> getting hung up(being well aware of the potential security issues
>>> associated with not having these in place). No dice.  I can attach my
>>> complete script if it would help, but it's pretty standard stuff for
>>> masquerading from our private network out, and doing NAT to bring 
>>> traffic
>>> to selected ports from the net to machines on the inside. Like our mail
>>> server.
>>
>>
>>
>> Ok, your logic is sound, keep it up.
>>
>>> Of course I can go directly to the mail server by going  to 192.168.1.8
>>> and that works just fine, but that's beside the point.
>>
>>
>>
>> I would hope so, if not there are other larger problems.  HEY!!! Who 
>> unplugged the power from my server???  ;)
>>
>>> The problem is, we have guys here with laptops, and they need to be 
>>> able
>>> to hit mail.gotvoice.com by name from both outside and inside. We got a
>>> bunch of other services here that people get to by name as well.
>>
>>
>>
>> This make sense to me.  Even if you just said that you wanted to do 
>> it for the sake of doing it and saying that you did, that's enough 
>> reason to at least figure out how to make it work isn't it?
>>
>>> We could just run a seperate DNS server internally to resolve the 
>>> names to
>>> private addresses, but we really don't want to get into running two
>>> seperate DNS setups, when this should be a simple fix on the firewall.
>>
>>
>>
>> You really don't want to go to all that trouble do you?  I did not 
>> think so.  (But if you did, you might want to look at views in Bind.  
>> Ask me questions if you are curious.)
>>
>> Yes this is a fairly simple fix on the firewall.  In fact you are 
>> almost all the way there.  You have two out of the three rules that 
>> you need.  The problem you ran in to when you DNATed the internal 
>> traffic distend to the 72.11.67.10 IP was that the Mail server 
>> responded directly back to the clients.  What's wrong with this setup 
>> is that the client systems are communicating with 72.11.67.10, not 
>> 192.168.1.8, which is who is responding to their traffic and thus 
>> dropping the traffic.
>>
>> I think you need to add a rule to your nat table POSTROUTING chain 
>> that will SNAT any traffic leaving the router / firewall distend to 
>> the mail server on port 25 to appear to the mail server as if the 
>> traffic is coming from the router / firewall it's self.  This will 
>> make the mail server respond back to the router / firewall which will 
>> in turn unSNAT the traffic and subsequently unDNAT the traffic and 
>> send it back to the clients on the local LAN.  However this might 
>> mess up your mail server logs a little bit as it would see ALL 
>> traffic to it (save for the client systems that talk directly to it) 
>> appear as if it is coming from the router / firewall, even the 
>> external internet traffic.  If you do care about these logs / source 
>> IPs on most of your traffic you could set up the SNATing rule to only 
>> SNAT if the traffic is coming in from the internal LAN.  Thus you 
>> would add a rule like this:
>>
>> /usr/sbin/iptables -t nat -A POSTROUTING -o $INTERNAL -s 
>> 192.168.0.0/16 -d 192.168.1.8 -p tcp --dport 25 -j SNAT --to-source 
>> $INTERNAL_IP_of_router
>> /usr/sbin/iptables -t filter -A FORWARD -i $INTERNAL -o $INTERNAL -s 
>> 192.168.0.0/16 -d 192.168.0.0/16 -j ACCEPT
>>
>> This rule will cause any traffic that is from 192.168.0.0/16 and 
>> destined to 192.168.1.8 be SNATed to the source IP of your router / 
>> firewall's internal LAN IP thus forcing the mail server to respond 
>> directly to the router / firewall which will respond back to the client.
>>
>> Well that's how I understand your scenario any way.  I hope that will 
>> help you or at leas shed some light on your predicament.  If you need 
>> any thing else, just reply to the mail list or send me an email 
>> directly.  :)
>>
>>
>>
>> Grant. . . .
>>
>

