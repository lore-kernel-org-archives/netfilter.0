From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 17:17:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081717.52555.Antony@Soft-Solutions.co.uk>
References: <Law9-F5F4g09DudNhpK000185fd@hotmail.com> <200401081616.08717.Antony@Soft-Solutions.co.uk> <20040108181009.GB22229@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040108181009.GB22229@cannon.eng.us.uu.net>
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
To: netfilter@lists.netfilter.org

On Thursday 08 January 2004 6:10 pm, Ramin Dousti wrote:

> Dividing the /28 to 2x /29's is a waste.

I agree (and it wasn't what I meant to suggest - sorry if it seemed that I 
had).

I proposed one /29 for the DMZ, which therefore has its own network address 
and broadcast address, but leaving the existing /28 on the external 
interface, so that only one additional network address is used (both 
broadcast addresses will be the same, if the /29 is the upper half of the 
existing /28).

> - Set up the IP on the FW nics:
>         ip addr add 192.168.1.2/28 dev eth0   # external
>         ip addr add 192.168.1.2/28 dev eth1   # DMZ
>         ip addr add a.b.c.d/x      dev eth2   # internal
>
> - Enable proxy-arp on these interfaces:
>         echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
>         echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
>
> - Remove the local route on eth0:
>         ip ro del 192.168.1.0/28 dev eth0
>
> - Add a /32 route for the router:
>         ip ro add 192.168.1.1/32 dev eth0

This solution is better than mine by one IP address (which is well worth 
having if you only have a /28 to begin with), but forces all except the two 
public IPs involved in the point-to-point /32 link between the firewall and 
the external router to be on the DMZ.   If that is what is required, then it 
is a good solution.

Antony.

-- 
Christmas is an opportunity to upgrade to kernel 2.6 while no-one's around to 
notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


