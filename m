From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: ROUTE  woes ?
Date: Tue, 23 Aug 2005 22:14:25 +0200
Message-ID: <430B83A1.1000908@eccotours.dyndns.org>
References: <E1E7eMx-00076v-2D@mail.eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1E7eMx-00076v-2D@mail.eccotours.co.za>
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
To: Ruben Cardenal <ruben@ruben.cn>
Cc: 'iptables' <netfilter@lists.netfilter.org>

Ruben Cardenal wrote:
> Hi,
> 
>>gate:/usr/src# iptables -t mangle -A FORWARD -p tcp --dport 80 -j ROUTE --
>>oif eth2
> 
>   It must be used on the POSTROUTING chain of the mangle table.

Hi Ruben

Thanks for replying

You 100% correct, thanks for setting me straight, but i still struggling, since I dont have the target ROUTE in my kernel

gate:~# iptables -t mangle -A POSTROUTING -p tcp --dport 80 -j ROUTE --oif eth2
iptables: No chain/target/match by that name
gate:~#

Ive been looking at the various path o matics, and I cant find the patch my kernel.

Thanks anyway

Kind Regards
Brent Clark


