From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: Need Halp in Netfilter
Date: Thu, 16 Jan 2003 18:06:30 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0301161747090.939-100000@abodh.pesit.deeproot.co.in>
References: <20030115104130.6396.qmail@web40710.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030115104130.6396.qmail@web40710.mail.yahoo.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>, Mohammad Shakir <shakirz1@yahoo.com>


Hi,

Following stuff might help:-

    1. Why are you using DHCP script ?
	As you have decided on the ip address of proxy and gateway...
	The issue should not be DHCP..( As per my understanding goes)

    2. Have you configured the proxy as a transparent one?
	If not, you have to configure squid as a transparent one. But
	if you do not want to change the current proxy settigs .. you
	can run another instance of proxy on another port, which you
	can configure as a transparent one.( Please check out the
	performance when you do so.. proxy may take a lot of CPU).

    3. Have you put (iptables)rules which will REDIRECT/NAT the requests?
	There are two ways of doing this. Please check out the following
	link.

	http://en.tldp.org/HOWTO/mini/TransparentProxy-6.html#ss6.3

	And google with keywords "transparent proxy" "squid" "iptables"

Let us know if this helps or if you have any trouble.

Good Luck,
Narendra.

On Wed, 15 Jan 2003, Mohammad Shakir wrote:
>
> I have setup two servers hostname server ip address 192.168.0.1 and hostname proxy ipaddress 192.168.0.2 both servers are connected with dialup sepratly and also configure squid, DHCP, DNS services. I have also 100 PCs of windows 98 as a client with auto ip and set their gateway,dns,dhcpserver and so on from DHCP 192.168.0.1.
>
> Now I want that any request for browsing come from client  automatically forward to my squid which is running on 3128 port on server 192.168.0.2 and all others request go on direct ppp0 of 192.168.0.1. Please help me what script I make for this.
>
> I also visited at netfilter website and found some script, I found "DHCP IP Firewall Script"
>
> http://iptables-tutorial.frozentux.net/scripts/rc.DHCP.firewall.txt
>
> which is on site is little bit match with my requirment but for proxy request what should I do ?
>
>

In the middle of difficulty..... lies Opportunity. (Albert Einstein)
--------------------------------------------------------------------
Narendra Prabhu. B             Free Software at its product-ive best.
DeepRoot Linux                             http://www.deeproot.co.in
                ---- Server Appliances ----
             ---- Linux Support and Services ----
-------------------------------------------------------------------



