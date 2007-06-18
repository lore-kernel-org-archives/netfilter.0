From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridge, DNAT, New Tables and ip rules
Date: Mon, 18 Jun 2007 00:17:49 -0500
Message-ID: <4676157D.1060808@riverviewtech.net>
References: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>	<466DE959.8020609@riverviewtech.net>	<e53321d30706121212r3dabccb2na62e2c07c2b3902b@mail.gmail.com>	<4670BA44.9010802@riverviewtech.net>	<e53321d30706151152h1d395529iabb310024017096@mail.gmail.com>
	<e53321d30706151204x295b6282we82287bf0f685bdd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30706151204x295b6282we82287bf0f685bdd@mail.gmail.com>
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

On 6/15/2007 2:04 PM, semi linux wrote:
> Hrmm, that _might_ be it but I'm not convinced.  There are three 
> conditions which need to be satisfied: 
> - bridge traffic is bridged w/o interruption
> - all traffic from localhost uses eth0
> - traffic from one port on the localhost uses br0 instead of eth0

Having a list of criteria makes it a lot easier to understand what you 
are wanting to do, or at least how to come up with something to fulfill 
your goal(s).

Just based on your above description, here is what I would try to do.
  - Enslave eth50 & eth51 to br0
  - Bind an IP to br0
  - Bind an IP to eth0
  - Bind IPs as necessary to any other interfaces.
  - Use dev eth0 and eth0s source IP to talk to the local network.
  - Use dev br0 and br0s source IP for the exception above.

I *THINK* this can be accomplished with ip rules.

Use the NATing or Redirection on the bridged traffic to bring the 
traffic you want to effect in to Jose.  Have Jose do what you want as 
far as communicating with Dan.  Have all traffic that Jose send out go 
out via eth0 based on your ip table entries.  Use an ip rule to match 
the specific traffic you want to send out br0 to use a different routing 
table that is set to use dev br0 with br0s source IP for the specific 
traffic.

> Ugg, I hate ASCII art, but here go my Picasso skills...
>  ______             ______             _____
> |      |-->--1-->--|      |-->--2-->--|     |
> | Jack |           | Jose |           | Dan |
> |______|           |______|--<--3--<--|_____|
>                      |  |
>                      |  |
>                      5  4
>                      |  |
>                      V  V
> 
> This makes you appreciate white boards on a whole new level.

(Not bad.)

> I'm not sure what this means...  Since I want all traffic to go to 
> eth0, except for the traffic with a given source port, how are the 
> routing tables going to help me?

Do some reading on how the LARTC guide(s) suggest you deal with multiple 
internet connections.  In short, you are wanting by default all traffic 
to use eth0 with only the exception traffic to use br0.  I think you 
will see the custom routing tables and how to write ip rules to tell the 
system to use them.

> I did notice one interesting thing last night...  My Cisco RV042 
> that's used as a router in the middle is sending a lot of Gratuitous 
> ARP packets for an interface which itself owns... I'm guessing this 
> is a firmware bug of some kind and probably wouldn't affect my setup 
> anyway so I'm going to ignore it.

Are your bridged ethernet ports, eth50 and eth51, both facing the RVO42? 
  If they are this could be a sign that the RVO42 is getting confused by 
seeing its own traffic coming back in to its self.  If the RVO42 is 
confused it may be GARPing to try to avoid ARP poisoning by preemptively 
using ARP poisoning to keep things running.



Grant. . . .

