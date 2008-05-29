From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forwarding packets received on bridged interfaces -regarding
Date: Thu, 29 May 2008 00:17:31 -0500
Message-ID: <483E3C6B.1030208@riverviewtech.net>
References: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>	 <483E1DF2.3080304@riverviewtech.net> <69fec4520805282155k441b60edo30a98bb26135df62@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <69fec4520805282155k441b60edo30a98bb26135df62@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/28/08 23:55, Knight Tiger wrote:
> I thank you for your quick response. I wish I could draw ascii art 
> like that. I dont know how to do that on an email compose window.

You are welcome.  As far as the ASCII art, a fixed width font and lots 
of practice go a long way.  ;)

> The bridge is between eth0 and eth1. AP0 is connected via a crossover 
> cable. eth1 connects to "Net 1" and eth0 connects to AP0. eth0 does 
> not have an IP address (I can assign it one, but I dont see any 
> reason for it) The clients have IP address allocated from the same 
> subnet as eth1, The clients are no different from eth1 from the 
> perspective of the DHCP server.

*nod*

With that clarification, I'd suggest that you simply bridge eth0 and 
eth1 and not have any rules in either EBTables or IPTables.  This should 
allow your clients to communicate with each other like you are wanting.

About the only thing that I might do differently than what you have done 
(aside from any filtering) is to move the ""management IP to the bridge 
interface rather than eth1.  I'd do this so that you can still get to 
the management IP from one network if the other network's interface gets 
shut down.  Consider what would happen if you were on a client on "Net 
0" connected to the management IP (bound to eth1) when eth1 was taken 
down.  This is just a personal preference though and should have no 
baring on functionality.

> The bridge system (comprising of interfaces eth0 and eth1) is a 
> laptop running Linux that aims to extend the range of a wireless 
> network (the one which the wireless interface eth1 connects to). It 
> may appear to be easier to add more APs and connect them to the back 
> bone network but we are evaluating this approach because we want to 
> switch the wireless network to a 3G data connection and still offer 
> Wi-Fi services to our clients. As a start we wanted to evaluate WiFi 
> extension. with just WiFi. We want the Linux laptop to be totally 
> transparent and the clients connect to the Wi-Fi network just as they 
> would from any other AP. The Linux laptop merely acts as a firewall+ 
> bridge for the clients. The clients would get IP addresses in the 
> same subnet as eth1 in the figure. Remote monitoring of the linux 
> machine is possible through the DHCP assigned IP address. All traffic 
> from/to the clients should flow through the bridge. I plan to add 
> filtering after I get traffic flowing in both directions.

*nod*

I don't see any problems with what you are proposing while using WiFi. 
However I do wonder if you will still be using bridging when 3G is in 
place, as I don't know how many IPs you will be able to get with your 3G 
service.  Other than that, things should be fine.

> The problem:
> 
> The DHCP requests from the clients get blocked at the eth1 interface. 
> I want all traffic from the clients to go out via eth1. I would like 
> to know to configure this setup,

I re-looked at your EBTables rules and did not see any thing that should 
prevent things from working as long as you are not using the MAC address 
of eth1 (i.e. talking to or from eth1).  If you are using the MAC of 
eth1 then you are forcing the bridge to route the packet when the IP 
stack will not have any thing to route.

The only other thing that comes to mind is that seeing as how (I think) 
eth1 is a wireless NIC, you may be dealing with problems with a wireless 
card that is not playing quite right.  You might consider testing your 
bridging (and filtering when it is time) via a regular computer with two 
wired ethernet interfaces.

> I thank you again for your patience. Looking forward to your replies.

*nod*

You are welcome.



Grant. . . .
