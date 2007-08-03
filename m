From: Martijn Lievaart <m@rtij.nl>
Subject: Re: NAT on stateless firewall ?
Date: Fri, 03 Aug 2007 22:37:34 +0200
Message-ID: <46B3920E.7080306@rtij.nl>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>	<46B37DD2.8020606@andrei.myip.org>	<46B37EB5.3060803@rtij.nl>
	<46B38856.1020003@andrei.myip.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Florin Andrei wrote:
> Martijn Lievaart wrote:
>>
>> I think you could even get away with just creating a static arp entry.
>
> Like this?
>
> arp -s XXX.YYY.ZZZ.KKK -i eth0 -D eth0 pub
>
> I tested it, but it doesn't seem to work. I see the ARP requests, but 
> the server does not respond to it.
>

Bugger. I don't see why, but you have another solution so it's not 
important.

M4


