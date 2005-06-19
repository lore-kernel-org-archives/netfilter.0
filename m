From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: ip aliasing (nfcan: addressed to exclusive sender for this
	address)
Date: Sat, 18 Jun 2005 20:40:45 -0400
Message-ID: <20050619004045.GA14632@salty>
References: <003c01c57463$157942e0$3822a141@alpha>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003c01c57463$157942e0$3822a141@alpha> (from
	+nfcan+jimlaur+a07aaae93b.black#arbbs.net@spamgourmet.com on
	Sat, Jun 18, 2005 at 20:08:54 -0400)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.06.18 20:08, John Black - black@arbbs.net wrote:
> i'm trying to setup my firewall to do ip aliasing.  i have two private ip  
> address that i would like aliased.

I am not sure I understand what you mean by 'ip aliasing'.
DNAT can translate incoming destination addresses to new
destination addresses. This is usually done to allow
outside access to individual ports on hosts on your
private network.

If you wish to allow two hosts on the private network
to share one public ip address, then you probably want to use
masquerade (if the public ip address is assigned dynamically)
or SNAT (if the public ip address is static).

Source NAT can convert the source address of outgoing
packets from the private addresses of a group of hosts
on the private network into your shared, public ip address.
SNAT will also take care of the reverse translation
of destination addresses in reply packets from the outside.

> 
> if i run the command:
> ifconfig eth0:0 10.10.10.11 (public address) netmask 255.255.255.0
> 
> then in my firewall script i have:
>    iptables -t nat -A PREROUTING -d 192.168.180.181 -i eth0 \
>                -j DNAT --to-destination 10.10.10.11
> 
> is this right?  since eth0 is the address connecting the firewall to the  
> internet?

I think you have the two ip address fields backwards.

try -d 10.10.10.11
- This is the destination address as it arrives at the firewall.

try -j DNAT --to-destination 192.168.180.181
- This is the private destination address
  that the incoming public address should be translated to.

Also, you may need other rules to forward the packet
after the destination address has been translated.

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

