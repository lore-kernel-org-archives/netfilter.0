From: "Matthew Simpson" <matthew@txlink.net>
Subject: Re: using iptables to route between public networks
Date: Tue, 23 Dec 2003 09:32:49 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c3c96a$060086c0$0100a8c0@KARI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Subject: Re: using iptables to route between public networks
From: Chris Brenton <cbrenton@chrisbrenton.org>
To: Matthew Simpson <matthew@txlink.net>
Cc: netfilter@lists.netfilter.org
Date: Tue, 23 Dec 2003 05:53:41 -0500

On Mon, 2003-12-22 at 23:30, Matthew Simpson wrote:
>
> I have two ethernet cards in this box.  One card has a public IP going to
my
> internet provider [255.255.255.252 subnet].  The other card also has a
> public IP that is routed to me by my Internet provider [255.255.255.240
> subnet].

<snip>

>> My first question, however... if I do a traceroute to a box connected
behind
>> the router, the "router" interface IP address does not show up in the
>> traceroute.  It skips directly from my internet provider's gateway
address
>> to the final destination address.  Why?

>If everything is configured correctly it should, although most people
>would consider this a "feature" as they deny inbound trace attempts.

>If it does actually skip from your provider to the internal address,
>there are a couple of possibilities:
>1) The Linux box is in bridging mode
>2) Your subnet address space overlaps

>If in between your provider's IP and the internal system is a line that
>shows three *'s or three characters preceded by a exclamation point, the
>Linux box is filtering this traffic.

There are no *'s.

To be more specific about my configuration [I'm going to munge the IP
Addresses a little here since they are public, but the subnets, etc will be
correct],

I have the ethernet cable from my bandwidth provider with ip address
216.190.34.38 [my side] and 216.190.34.37 [bandwidth provider's side -- 
gateway] with subnet 255.255.255.252 plugged into eth1.

My provider is routing 209.210.10.0/24 to me.  I have eth0 set up with
209.210.10.1 subnet 255.255.255.240 [I'm not using the whole class C as of
now].

I have done no config except for I have the FORWARD chain set to accept
packets.  I have 209.210.10.1 as the gateway on the machines behind the
router.

>Possibilities:
>1) An OUTBOUND iptables filter rule
>2) A sysctl setting has been changed

>> Second question, it's not a good idea to blindly forward all packets is
it?

>Absolutely not. The whole purpose of a firewall is to let through only
>what you understand and expect to receive.

I'm not really trying to firewall, I'm just trying to route.  :-)   I just
want to make sure I'm not enabling someone to use my router box as a jump
point to attack someone else.  I know that was a problem back in the day if
one set up masquerade incorrectly.

>> I tried to set up an append rule to the FORWARD chain to drop all packets
>> that did not have a destination of $myiprange/28, but iptables seems to
>> ignore the rule

>Can we see the exact syntax of the rule that you entered?

I must have been doing something stupid last night, because I retried it
this morning and it works.  Here is what I have for the forward chain:

$IPTABLES -A FORWARD -d 209.210.10.1/28 -j ACCEPT
$IPTABLES -A FORWARD -d ! 209.210.10.1/28 -j DROP
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -F FORWARD

This works.

>> [it doesn't work and it doesn't show up in an iptables -L]
>> Unless forwarding all packets is okay, what should I do to fix this?

>You probably already know this, so maybe its just a language thing, but
>there is a whole lot more you want to block besides packets not headed
>to you internal IP address space. Think about what services you actually
>have a need for letting people access from the Internet (mail server,
>Web server, etc.) and block access to everything else. There is a whole
>lot more you can do, but this will get you started in the right
>direction.

In this case, I need all the machines to be open.  I'm eventually going to
use the router to police and account for bandwidth usage, but I will be
blocking precious little.  All the services running on the machines behind
the router need to be publically accessable.

>HTH,
>C

thanks,
mathew


