From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: tracking usage by mac address
Date: Mon, 30 Aug 2004 06:17:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093861031.1660.30.camel@grendel>
References: <41329413.3080407@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41329413.3080407@shaw.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Sun, 2004-08-29 at 22:42, Henry Baxter wrote:
>
> Ultimately I am hoping to track the bandwidth usage of about 50 client 
> computers through my router based on their MAC address. I understand 
> that by simply writing a rule that does nothing to the packet, such as 
> 'iptables -A FORWARD -m <mac address>' I can parse the netfilter log and 
> find out what I need.

How about:
iptables -A FORWARD -m mac --mac-source <mac address 1> -j LOG "
CLIENT_1 "
iptables -A FORWARD -m mac --mac-source <mac address 2> -j LOG "
CLIENT_2 "

Then when you need a report, just run:
iptables -L -nvx

Now the caveat is this will only show you outbound traffic, not inbound.
In other words, there is no "--mac-destination" option so you can't log
reply packets based on MAC address. Kind of a bummer in your case
because if these clients are mostly downloading data, that's the
direction that's going to see the most bandwidth usage.

Two options:
1) Log by IP instead of MAC (maybe hand the clients fixed IP's via DHCP)
2) Use ebtables instead of iptables (90% certain it will work but have
not tried it)

HTH,
C



