From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 13:10:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040108181009.GB22229@cannon.eng.us.uu.net>
References: <Law9-F5F4g09DudNhpK000185fd@hotmail.com> <200401081616.08717.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401081616.08717.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Jan 08, 2004 at 04:16:08PM +0000, Antony Stone wrote:

> The suggestion was that if you have a large enough public IP block, you subnet 
> it so that part is used for your DMZ and part is used for everything else.   
> You can then route the DMZ subnet to machines on the DMZ which genuinely have 
> the public addresses assigned to them without using NAT.
> 
> All that is involved is to assign one of the /28 addresses to the DMZ 
> interface on your firewall, choosing the addresses for the 'external' and the 
> 'DMZ' interfaces (as well as the netmasks) so that the DMZ is a clearly 
> identified subnet of its own, with a sensible routing table entry (which gets 
> set up automatically by Linux as soon as you assign the address and the 
> netmask to the interface).
> 
> All you need to remember is that Linux consults its routing table from most 
> specific to least specific, therefore a /29 subset of a /28 will take 
> precedence over the more general /28 entry.

Dividing the /28 to 2x /29's is a waste. You can have the /28 on both the
external interface and the DMZ interface with some adjustments to the
routing table.


Let's say you have been given 192.168.1.0/28:


                            External       DMZ
ROUTER                        [eth0] FW [eth1]             SERVERS
192.168.1.1/28         192.168.1.2/28  192.168.1.2/28    192.168.1.3-14/28
                                   [eth2]
                             Internal a.b.c.d/x


Steps to take:

- Set up the IP on the FW nics:
        ip addr add 192.168.1.2/28 dev eth0   # external
        ip addr add 192.168.1.2/28 dev eth1   # DMZ
        ip addr add a.b.c.d/x      dev eth2   # internal

- Enable proxy-arp on these interfaces:
        echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
        echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp

- Remove the local route on eth0:
        ip ro del 192.168.1.0/28 dev eth0

- Add a /32 route for the router:
        ip ro add 192.168.1.1/32 dev eth0


This should work.

Ramin



> 
> Since you have a /28 subnet (=16 addresses) it's certainly possible to do this 
> in your case, and clearly a /29 subnet for the DMZ would be the simplest 
> arrangement (although not the only one by any means).
> 
> Antony.
> 
> -- 
> It is also possible that putting the birds in a laboratory setting 
> inadvertently renders them relatively incompetent.
> 
>  - Daniel C Dennet
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 

