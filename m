From: Robert Borger <bborger@navcorp.com>
Subject: SegFault on flush + IPSec and Nat on 2.6.10 fails
Date: Thu, 3 Mar 2005 15:15:32 -0600
Message-ID: <DB15CAD558452949A35006D66C5C5A99010F7E@nav-post.navcorp.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Matthew Schumacher wrote:
> I may be misunderstanding what your doing but I don't see anywhere where 
> you are omitting the esp packets from nat.  So you need to do this with 
> the public ip addresses of your tunnel gateways, one in each direction:
> 
> iptables -t nat -A POSTROUTING -p ESP -s <srcip> -d <destip> -j ACCEPT
> iptables -t nat -A POSTROUTING -p ESP -s <srcip> -d <destip> -j ACCEPT

I'm sorry about the confusing post.  I described two distinct problems.
It appears that you quoted the first problem, but where addressing the
second problem.

I have corrected the first problem, which was a SegFault from "iptables -F".
The iptables rules that you quoted was an example of the segmentation fault.

This morning I found that ipsec-tools-0.5rc1 had not been compiled since
upgrading to the 2.6.10 kernel.  After re-compiling ipsec-tools, I don't
get the segmentation fault error after an "iptables -F" command. Off hand I
don't see why compiling ipsec-tools would correct a problem with an iptables
command, but I'm happy to be able to clear the tables without a reboot.

I still have a problem with nat.  The rules I am using for the NAT test are:
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -A FORWARD -s 192.168.3.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o ath0 -j MASQUERADE

I think that these rules allow most all traffic.  I don't want any rule
to block traffic while I'm looking for the reason nating is failing.

The system has a subnet behind each of the ipsec gateway machines.
The local subnet is nated to the address of the local ipsec gateway.
The remote end does not nat. The tunnel is set up between the local
gateway (a single address) and the remote subnet. The tunnel does not
connect between the two subnets directly. Packets from local subnet
to the remote subnet are expected to travel via the tunnel because
of the local nating.

I have esp traffic in the tunnel. I can ping from the local ipsec gateway
to the remote subnet behind the remote ipsec gateway. I see this esp
traffic in the tunnel and the ping receives the proper response.

The problem is when I ping from inside the local subnet to the remote
subnet.
I expect the ping request to be nated before being encrypted and sent
through
the tunnel. With the ipsec-nat patch installed, this does happen.  The
machine on the remote subnet responds. The remote gateway encrypts the
response and sends it back through the tunnel. I see these esp packets in
the tunnel. Using some LOG rules, I can see the response packet decrypted.
At this point, the destination address is the local ipsec gateway, as
expected,
since the original request packet was nated with that address.  What I don't
see is the packet being re-addressed to the IP address of the machine on
the local subnet and forwarded to the originating machine.

I had this scenario working a few years ago with a 2.2.x kernel and
FreeSWAN,
but it seems to be an all new ballgame today.  In fact, the remote end of
the
tunnel is still using that configuration.

I hope this makes more sense. 

Do you still think that some rules are missing?

Thanks for time,
Bob Borger

-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.6.0 - Release Date: 3/2/05
 

