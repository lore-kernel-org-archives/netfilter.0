From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: problem with (incorrectly?) INVALID packets
Date: Wed, 13 Dec 2006 17:27:46 -0600
Message-ID: <45808C72.7060404@riverviewtech.net>
References: <200612121942.19276.mike@v6.gaima.co.uk>	<457F6F58.3010005@riverviewtech.net>
	<200612131239.35043.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612131239.35043.mike@v6.gaima.co.uk>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Mike Williams wrote:
> Oh, sorry.

No problem.  We are all human.

> # ip rule add from 90.1...1.65/27 table temp90
> # ip route add default via 81.1...7.49 dev br2 table temp90

Ok, what you are typing makes sense as commands, but does not make sense 
to me logically.  If I read what you have typed correctly, you are 
adding a rule that effectively says that if traffic is from 90.1 use 
81.1 as the default gateway.  Presuming that this is indeed correct and 
what you are trying to say, I ask you this:

How can a system on the 90.1 network use a default gateway on the 81.1 
network?  IMHO the two can not communicate with out some intermediary 
gateway.

> br2 is the bridge on "bridge" in the diagram, and has a 90... and 81... IP.
> br0 is the bridge on LFW, it has several 90... IPs.

Ok...

So, br2 on bridge has multiple IPs assigned to it, 81.1 and 90.1?

Likewise, br0 on LFW has multiple 90.1 IPs assigned to it?

>>> When I ping things from LFW I get an ICMP redirect to 81.1...7.49, but I
>>> don't see anyway I can reach it directly from 90.1...1.67. This is
>>> however a minor annoyance.
>> 
>> What "things" per say are you trying to ping?  Where are you trying to
>> ping them from?  What IP address is used during your pinging?
> 
> Anything on the internet. LFW. Any of the 90... IPs assigned to it.

Knowing more about your set up, your previous comment about "... don't 
see any I can reach it directly ..." sticks out more as the routing 
problem that I mentioned above.  This would also account for routing 
issues when you try to ping things on the internet.

>> This leads me to believe that you don't have your routing set up quite
>> right.
> 
> I'd love some suggestions on how to make it right :)

Think basic routing.  Put a route to your 90.1 network via the 81.1.7.59 
router on your 81.1.7.49 router.  This will allow simple packets pass 
back and forth presuming that there is no firewalling in the way.

If you don't want to put a route, you will need to NAT your 90.1 network 
to appear to be from an 81.1 IP address.

>>> 0.0/24 can do all the things they are supposed to be able to do to
>>> 136.0/24. 136.0/24 can do all they things they are supposed to be able to
>>> do against the internet.
>>> 136.0/24 however can't do anything to 0.0/24, as the packets coming back
>>> from 0.0/24 get blocked by rules designed to stop non-authorised traffic
>>> being initiated from 0.0/24 to 136.0/24.
>> I'll presume that you are talking IPTables rules here.  It sounds like
>> there is a slight problem in your rules.
> 
> Yes, rules here are iptables.

*nod*

> The rule set is basically the same as the rule set we currently use in 
> production. It's modified to change interface names, public side IP address, 
> add an additional internal zone, and add some more limits on what zones can 
> do to each other.

Ok.

> On all the other firewalls I run using fwbuilder you allow packets from here 
> to there, and the ACCEPT on ESTABLISHED or RELATED automatically allows the 
> returning packets.

Ok...  Is the "... from here to there ..." that you are speaking about 
based on interface, or IP address, or both interface and IP address?

> Openswan on 2.6 native IPsec, so no ipsec devices.
> On the other firewalls I run firewalling is done on IP addresses.

Ok.  That is a pertinent piece of information.  You will have to 
firewall more on IP address than device.  You could firewall based on 
device and IP address combinations, but it will get VERY complex VERY 
quickly.

> At the moment, yes 3, later to be 5. Our other office across the Pennines, my 
> house. All openswan, all linux 2.6, all native ipsec. All VPNs terminate at 
> 90.1...1.67. 192.168.0.0/24, 192.168.22.0/24, 192.168.30.0/24.

Good.  This will make things easier to firewall once things are working.

> Yep, I will provide as much information as I can.
> 
> Here's an example of what is blocked, incorrectly
> 
> 192.168.136.203 ~ # wget -S -O /dev/null 192.168.0.210
> ....
> Connecting to 192.168.0.210:80...
> 
> LFW ~ # tail -f /var/log/blah
> .... RULE 35 -- REJECT IN=br0 OUT=bond2 
> MAC=00:04:23:d7:f3:33:00:02:a5:60:0f:52:08:00 SRC=192.168.0.210 
> DST=192.168.136.203 LEN=60 TOS=00 PREC=0x00 TTL=62 ID=0 DF PROTO=TCP SPT=80 
> DPT=50067 SEQ=1894035948 ACK=1130147629 WINDOW=5792 ACK SYN URGP=0
> 
> (br0 is bond0 and bond4, bond0 connects to the internet, bond4 has nothing on 
> it yet. bond2 is the 136.0/24 network)
> 
> 192 168.0.210 does run a webserver. 192.168.136.0/24 has no restriction, at 
> either end, to 192.168.0.0/24. Rule 35 boils down to:
> {INPUT,FORWARD} -s 192.168.0.0/16 -d 192.168.136.0/24 -j REJECT
> However, the very first rules added are:
> $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> And inbetween there are rules to allow packets in to 136.0/24 from some /24s 
> in 0.0/16, like I can ssh from 0.228 to 136.203.
> 
> Obviously I could remove that REJECT rule, but the packets reach the end of 
> the rule set and get DENY'd by the catch all at the end, as the packets 
> coming back are INVALID, not RELATED to an existing connection like they 
> should be.

This makes me think that something else is going on that is being over 
looked.  With out knowing what the full IPTables rule sets are I don't 
have enough information to see where the problem might be.

> Hmm, which suggests they aren't being tracked properly... And after some 
> investigation traffic going to any of the VPN networks from 136.0/24 aren't 
> being conntrack'd, whereas on the other firewalls I run they are (i.e. the 
> VPN between 0.0/24 and 30.0/24). Is there any peculiar about conntrack'ing 
> packets over/out a bridge?

Not per say if you are using the bridge virtual interface as a network 
interface.  If you are using the bridge as a bridge and passing the 
packets through it, you may have something in place that will block it. 
  See my post with a subject of "A word about bridging to the wise...".




Grant. . . .

