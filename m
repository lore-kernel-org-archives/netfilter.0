From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT in a special case
Date: Sat, 10 Apr 2004 00:10:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404100010.00795.Antony@Soft-Solutions.co.uk>
References: <40768F74.2050005@fammed.med.uoc.gr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40768F74.2050005@fammed.med.uoc.gr>
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

On Friday 09 April 2004 12:56 pm, Dimitris Kounalakis wrote:

> Hello,
>
> I need a special case and I am not sure it can exist with NAT (SNAT or
> DNAT)
>
> I have two lan networks with IP range : 10.10.1.1/24 and 10.10.2.1/24.
> The connection between then is done with a linux machine with two
> ethernet cards.

So far, so good.   (Except you should specify the network ranges without a 
host address part - they should be 10.10.1.0/24 and 10.10.2.0/24).

> The first network has a mix of computer and VoIp devices and and the
> second only computers.

Okay.

> In the second network a pptp vpn server providing internet access (the
> first nat) is in action and selected computers from both networks are
> connected and take a 192.168.0.1/24 address in a virtual interface and
> have Internet access.

"selected computers from *both* networks are connected..."

I understand.

> I want to give access to the internet to some VoIP and other hardware
> that can not use the pptp vpn server in the first network (10.10.1.1/24).

VoIP over PPTP using NAT....   eek :)

> I have the idea to configure the linux machine to connect to the pptp
> vpn server

Might be possible (I don't know, I've never used PPTP, I prefer IPsec)

> and then have it acting as a NAT machine for the machines in
> the first network (10.10.1.1/24) using the same IP address range.

Why do you need it to do NAT?

You said above that machines from both networks currently connect to the PPTP 
server, therefore it must be happy with both 10.10.1.0/24 and 10.10.2.0/24 
client addresses?

Also, if the linux machine connects to the PPTP server, it will connect using 
its 10.10.2.1 address (I think this is the one connected to the network with 
the PPTP server in it, yes?), and it then simply depends on how the PPTP 
server regards this connection - whether it will accept packets from any 
address other than 10.10.2.1 through the link, or whether it has to be that 
source address because that's the machine which connected?

> In other words, the linux machine has to simply route ip traffic to the
> ethernet interface with destination the subnet 10.10.2.1/24 and acting
> as NAT if the destination is the internet.

Well, if you're just saying that you want it to route traffic, and NAT only 
some of it, then that's easy enough, sure.

> Is that possible? Do you know where I can find an examlple close to that
> to start with ?

How about this?

iptables -A POSTROUTING -t nat -s 10.10.1.0/24 -d ! 10.10.2.0/24 -j SNAT --to 
10.10.2.1

That will not affect packets from 1010.1.0/24 to 10.10.2.0/24, but packets 
from 10.10.1.0/24 to anywhere else will get source NATted to 10.10.2.1

I think that's what you asked for?

Let me know if I've misundestood - I'm not quite sure what PPTP will be 
expecting, so I may not have answered your question.

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


