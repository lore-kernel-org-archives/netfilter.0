From: Jason Opperisano <opie@817west.com>
Subject: Re: DMZ Question
Date: Wed, 06 Oct 2004 08:35:27 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097066126.1720.19.camel@wolfpack.ljm.dom>
References: <7C9884991ADAE0479C14F10C858BCDF591E381@alderaan.smgtec.com>
	<005e01c4ab56$d7201e40$02c8a8c0@floydian>
	<001c01c4ab9c$63ede740$936ffea9@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001c01c4ab9c$63ede740$936ffea9@alpha>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-10-06 at 08:02, John Black wrote:
>  > In order to 'bind' any number of DNAT addresses to the firewall, you
>   >have two choices.
> 
>   >1. Actually bind the IP address to the physical interface, such as:
>   >ip addr add w.x.y.z/24 dev eth1
> would w.x.y.z be the private address or public address?
> 
>   >This will then get the DNAT from iptables.
>   >iptables -t nat -A PREROUTING --destination w.x.y.z -j DNAT --to
>   >${My_NEW_ADDR}
> would w.x.y.z be the private address or public address?

public.

-j

-- 
Jason Opperisano <opie@817west.com>


