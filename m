From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Requesting help.
Date: Thu, 19 Feb 2004 13:52:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077216764.2139.55.camel@ca.gts.nexusmgmt.com>
References: <GHEILNONPACCGBGKBEKKGEMECBAA.mani@manikandan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKGEMECBAA.mani@manikandan.org>
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
To: mani@manikandan.org
Cc: netfilter@lists.netfilter.org

On Thu, 2004-02-19 at 06:19, Manikandan wrote:
> Hello all,
> 
>         I have got a Redhat linux 9.0 box running as gateway and
> serving my LAN of 80 odd windows/unix work stations. It has got 2
> NICs, one is hooked to LAN switch and the other one is connected to my
> DSL Router. I have got a pool of /29 public IP addresses . 
> 
> One IP address is already assigned to my Router and the other one to
> my linux gateway. Now I am left with few more public IP's. 
> 
> I would like to forward one of my public IP to my local LAN system. So
> that all requests coming to that particular IP address will be
> answered by my system in LAN.
> 
> How can I achieve that? . Do I need to create IP alias in my gateway?
> I read through so many documents which only left me wondering where I
> am now. Could someone help me?
> 
> 
> Regards,
> 
> Manikandan

If I understand you correctly, you are really doing a very
straightforward NAT of an internal device to the external world.

First, I would strongly suggest that you add a third NIC to the gateway
and create a separate protected DMZ.  If someone happens to crack the
public exposed device through some application layer exploit and the
device resides on your local LAN, you could open up your entire internal
network to the cracker.

The rules are pretty simple.  If all you have is one device always
mapping to one network, create a SNAT rule for it in -t nat POSTROUTING
so that it always sends traffic to the Internet using the public address
and a DNAT rule for it in -t nat PREROUTING so that all packets
addressed to the public address are changed to the devices private
address.  I suppose that, in theory, you may even be able to dispense
with the SNAT rule.

You can find a slide show on how to do this in the training section on
http://iscs.sourceforge.net or you could look at Oskar Andreasson's
excellent tutorial on
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


