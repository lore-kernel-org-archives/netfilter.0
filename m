From: jason <jason@jasonandjessi.com>
Subject: Re: masquerade mac address
Date: Mon, 3 Oct 2005 12:50:58 -0500 (CDT)
Message-ID: <Pine.LNX.4.63.0510031249590.16941@mail>
References: <fa66ff1a0510031027l3964f8cbg3cf24896e33c9@mail.gmail.com>
	<Pine.LNX.4.61.0510032000470.31068@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510032000470.31068@filer.marasystems.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Henrik Nordstrom <hno@marasystems.com>
Cc: HouCheng Lee <houchen1@umbc.edu>, Netfilter Users <netfilter@lists.netfilter.org>

You could change the mac address of the card that is your outbound
interface. Or just swap the two cards in your config.  To change the MAC
using iproute2, use the following

ip link set dev ethX address 11:22:33:44.etc

-- 
Jason
The place where you made your stand never mattered,
only that you were there... and still on your feet

On Mon, 3 Oct 2005, Henrik Nordstrom wrote:

> On Mon, 3 Oct 2005, HouCheng Lee wrote:
>
>> My problem is that my NAT is behind a firewall (controlled by the SA), and 
>> the firewall will check the MAC address of outgoing packet. The eth0 of the 
>> NAT is the only legal card that allows to go outside.
>
> Any packets going via a Linux router is automatically given the source MAC of 
> the interface the packet leaves the Linux router on. This happens even if you 
> do not NAT the traffic.
>
>> Because the NAT only change the source ip address of packets,
>> the machines behind NAT are not allowed to go outside
>> because of the lack of legal mac address.
>
> The MAC is changed. Most likely the ISP is looking into something else as 
> well such as the TTL of the packet (some is known to do this to prevent the 
> use of "broadband routers" to connect multiple computers).
>
> If all you need is to provide web access then the easiest solution is 
> probably to run a proxy such as Squid.
>
> Regards
> Henrik
>
>

