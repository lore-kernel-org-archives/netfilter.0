From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT on stateless firewall ?
Date: Fri, 03 Aug 2007 21:53:01 +0200
Message-ID: <46B3879D.2010005@plouf.fr.eu.org>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>
	<46B37DD2.8020606@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B37DD2.8020606@andrei.myip.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Florin Andrei a =E9crit :
>> Grant Taylor wrote:
>>>
>>> Dare I ask why you are wanting to use Proxy ARP?
>>
>> Well, it's required by DNAT, isn't it?

No it's not. Proxy ARP may be useful as a workaround for broken routing=20
setups, when the source host thinks the destination host is on the same=20
link but actually it is behind a router.

[...]
> To make proxy ARP work with DNAT, an IP alias must be created on the=20
> external interface, with the public IP address of the machine behind th=
e=20
> firewall.

If you do that you do not need proxy ARP.

> It's not even necessary to play with proxy_arp in /proc. Just the IP=20
> alias and DNAT.

Right. I guess another way would have been to add a route to the virtual=20
public IP addresses pool and enable proxy ARP (not tested though).

