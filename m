From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MAC Block for the DHCP via iptables
Date: Mon, 17 Nov 2003 17:02:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171702.hAHH2pj22305@agate.rockstone.co.uk>
References: <008801c3ad28$da9e4b50$0d1ea8c0@win2000adv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008801c3ad28$da9e4b50$0d1ea8c0@win2000adv>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Monday 17 November 2003 4:35 pm, Chandana Bandara wrote:

> Hi     Mr.Antony & ALL ,
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP.........only with those policies ,
> should block the all incomming , outgoing from the machine ?????

Assuming you have flushed the rules as well, with:

iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT

then no IP traffic will be allowed into, out of, or through, the machine.

> This firewall running in my DHCP machne , but when a test with my DHCP
> clients ..........those machone has taken ips. but this can't happen
> .....isit ? if i correct where can be tbe problem ? pls ..............guide
> me

It is important to bear in mind that DHCP is a protocol used for giving IP 
addresses to clients which don't currently have them, therefore the traffic 
involved in client requests and server responses will not have normal IP 
addresses as you might expect, simply because the (client) machines in 
question don't have IP addresses until the protocol is complete.

A quick inspection with a protocol analyser such as ethereal will easily show 
you what I mean here.

However, once the clients do have IP addresses, the above rules will 
certainly prevent them from communicating with, or through, the netfilter box.

If you want to block the ethernet traffic involved in communicating the DHCP 
packets in the first place you might like to investigate ebtables at
http://ebtables.sf.net instead of iptables, as this is more appropriate to 
this purpose.


Regards,

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

