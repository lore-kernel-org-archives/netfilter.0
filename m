From: Matthew Schumacher <matt.s@aptalaska.net>
Subject: Re: SegFault on flush + IPSec and Nat on 2.6.10 fails
Date: Thu, 03 Mar 2005 08:26:01 -0900
Message-ID: <422748A9.50105@aptalaska.net>
References: <DB15CAD558452949A35006D66C5C5A99010F7C@nav-post.navcorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <DB15CAD558452949A35006D66C5C5A99010F7C@nav-post.navcorp.com>
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
To: Robert Borger <bborger@navcorp.com>
Cc: netfilter@lists.netfilter.org

Robert Borger wrote:
> Hi,
> I have two, likely related, problems using iptables.
> 
> 1) I sometimes get a segmentation fault from iptables -F.
> For example:
> 
> ~/bin # iptables -A INPUT -s 192.168.3.2/32 -j ACCEPT
> ~/bin # iptables -A INPUT -s 192.168.3.3/32 -j ACCEPT
> ~/bin # iptables -A INPUT -s 192.168.3.4/32 -j ACCEPT
> ~/bin # iptables -A INPUT -s 192.168.3.5/32 -j ACCEPT
> ~/bin # iptables -F OUTPUT
> ~/bin # iptables -F FORWARD
> ~/bin # iptables -F INPUT
> Segmentation fault
> ~/bin #
> 
> If I leave out any one of the INPUT rules, there is no error.
> I saw the same thing with OUTPUT rules, but I think that it
> only required 3 OUTPUT rule statements to segmentation fault.

I don't know how much I can help, but I'll try:

I may be misunderstanding what your doing but I don't see anywhere where 
you are omitting the esp packets from nat.  So you need to do this with 
the public ip addresses of your tunnel gateways, one in each direction:

iptables -t nat -A POSTROUTING -p ESP -s <srcip> -d <destip> -j ACCEPT
iptables -t nat -A POSTROUTING -p ESP -s <srcip> -d <destip> -j ACCEPT

If you haven't already, allow ipsec packets for phase 1 isakmp and esp 
packets.  If you don't you may only be able to build a tunnel in one 
direction.

iptables -A INPUT -s <srcip> -p ESP -j ACCEPT
iptables -A INPUT -s <srcip> -p UDP --dport 500 -j ACCEPT

After these rules are in place, your tunnel should come up and 
everything though the tunnel matches the rules in the FORWARD table.  So 
I use conntrack to control everything that goes though the tunnel.  A 
rule like this would give the appearance of NAT because new sessions 
from one side are rejected, while new sessions from the other are 
allowed.  In this example, port 80 is allowed in one direction, 
everything else is dropped:

iptables -A FORWARD -p tcp -s 0/0 -d <remotenet> --dport 80 -m state 
--state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -s 0/0 -d <localnet> -p all -m state --state 
ESTABLISHED,RELATED -j ACCEPT

Also, make sure you upgrade to kernel 2.6.11, 2.6.10 has a nasty 
ip_conntrack issue that will cause problems with your tables getting 
full and your machine dropping packets.

Hope that helps,

schu

