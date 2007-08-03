From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT on stateless firewall ?
Date: Fri, 03 Aug 2007 15:51:51 -0500
Message-ID: <46B39567.5080004@riverviewtech.net>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>	<46B37DD2.8020606@andrei.myip.org>	<46B37EB5.3060803@rtij.nl>
	<46B38856.1020003@andrei.myip.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B38856.1020003@andrei.myip.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 08/03/07 14:56, Florin Andrei wrote:
> arp -s XXX.YYY.ZZZ.KKK -i eth0 -D eth0 pub

Remember that ARP (cache) entries are just to tell a host where (what
MAC) an IP address (on the same subnet) is at so that the local host
does not have to ARP for it.

> I tested it, but it doesn't seem to work. I see the ARP requests, but 
> the server does not respond to it.

Just because traffic may be coming to the correct MAC address, there is
no guarantee that any thing will be listening or responding at that MAC
address for the IP address in question.  You would actually have to bind
the IP to the MAC for any thing of value to happen out side of sniffing.



Grant. . . .

