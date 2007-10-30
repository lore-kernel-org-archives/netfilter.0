From: Philip Craig <philipc@snapgear.com>
Subject: Re: Setting Source IP for outgoing traffic?
Date: Tue, 30 Oct 2007 17:53:41 +1000
Message-ID: <4726E305.3050008@snapgear.com>
References: <6.2.5.6.2.20071024220938.034412a8@gsfc.nasa.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6.2.5.6.2.20071024220938.034412a8@gsfc.nasa.gov>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Timothy Meader <Timothy.Meader@gsfc.nasa.gov>
Cc: netfilter@vger.kernel.org

Timothy Meader wrote:
> Basically, I need the responses to any traffic coming in on UDP port 
> 1514 (or, alternatively, to the destination IP x.29) to go back out 
> with a src address of x.29 instead of x.17 or x.18. Is there a method 
> using iptables that can handle this problem? Or barring that, can 
> anyone think of any other means to accomplish this task if iptables 
> can't handle this on its own? Below, I've included the current 
> iptables data rules that the two cluster nodes are presently sharing.

You could try a source NAT rule, eg

iptables -t nat -A POSTROUTING -p udp --sport 1514 -j SNAT --to-source xxx.xxx.xxx.29

but I'm not sure that this will work, since the tuple will clash with
the connection that was created for the incoming packet.

You can't use iptables to do policy routing based on port, since that
happens after address selection.

The proper fix is to change OSSEC to use the correct source address
for its replies.  I can think of two ways for this.

First, OSSEC could bind() to a specific address instead of INADDR_ANY.
I don't know if it already has a config option to do this.

Second, OSSEC could use the IP_PKTINFO socket option to determine the
address it received a packet on, and send its reply using this as the
source address.  For an example of an application that does this, see
openswan (the code is in lib/libopenswan/udpfromto.c).

