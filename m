From: Tom Diehl <tdiehl@rogueind.com>
Subject: Re: linux firewall/IPTABLES Vs Mediaring VOip
Date: Sun, 3 Aug 2003 23:34:07 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308032330470.10276-100000@tigger.rogueind.com>
References: <00a501c35a2c$beaac7b0$7700000a@lawrencewin2k>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a501c35a2c$beaac7b0$7700000a@lawrencewin2k>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lawrence - D <ingsiong@daltron.com.pg>
Cc: netfilter@lists.netfilter.org

On Mon, 4 Aug 2003, Lawrence - D wrote:

> Hi,
>     I'm new to Linux RedHat O/S. My RedHat 8.0 is connected by  lease line
> to internet service. I'm running Squid for proxy service. I implement the
> medium level firewall with default setting on linux firewall/IPTABLES.
>     Now my LAN user want to use mediaring VOIP service. I check the website
> FAQ and found the following :-
> 
> 10. Can the Prepaid Service work behind a firewall?
> The Prepaid Calls Service currently supports PC-to-Phone calls from behind
> firewalls. If you are connected to the Internet using LAN, you may be behind
> a firewall, which will prevent you from connecting to our Internet gateways.
> To make calls from behind your firewall, you need to set the firewall
> settings by clicking on the link "Settings" on the web page and select "Use
> Firewall" for SOCKS5.
> To use NAT firewall, you will need to open or ask your Network Administrator
> to open the following outgoing ports for UDP and TCP: 51719(UDP), 51720(TCP)
> and 1800-1810(UDP).
> 
>     Can anyone guide me how to open the port on server so that my LAN user
> can use Mediaring ?

I think redhat-config-network will allow you to adjust iptables rules. If not
suggest you look at http://www.fwbuilder.org.

HTH,

-- 
......Tom		Registered Linux User #14522	http://counter.li.org
tdiehl@rogueind.com	My current SpamTrap ------->	mtd123@rogueind.com


