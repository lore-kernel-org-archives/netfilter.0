From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
Subject: Re: Firewall help
Date: 11 Dec 2002 21:01:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039636895.24853.12.camel@nxitmirms1>
References: <000301c2a14e$7733f510$0114a8c0@CyberDawn.Net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000301c2a14e$7733f510$0114a8c0@CyberDawn.Net>
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

Hi,
make sure you have enabled ip forwarding into
/proc/sys/net/ipv4/ip_forward, if this file contains 0 do an:
echo "1" > /proc/sys/net/ipv4/ip_forward. This should solve the problem
between internal network and dmz. For the external network you probably
need nat or masq. This is because each machine on dmz and internal
network should have default gateway set to firewall interfaces suppose
for dmz the gateway could be: 192.168.1.1 and for internal network could
be: 192.168.2.1. Each of this addresses should be configured on firewall
interfaces as (for example) eth0 and eth1. To be able to talk with
public services you must use nat or set on all public servers something
like: route add -net 192.168.1.0 netmask 255.255.255.0 gw
xxx.xxx.xxx.xxx
and
route add -net 192.168.2.0 netmask 255.255.255.0 gw xxx.xxx.xxx.xxx
where xxx.xxx.xxx.xxx is your firewall external interface ip address (in
my example eth2 interface address).
This of course could lead to many security risks, so i can't suggest
this to you, really. Better could be to set a masq on packets coming
from your dmz and internal network going to external networks. This
could be done on the firewall using something like:
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
where eth2 is your external firewall interface.
Hope to have solved your problem,

			Marcello


Il mer, 2002-12-11 alle 20:49, DeWet van Rooyen ha scritto:
> I installed a machine with Redhat 8 and are trying to set up a iptables
> firewall with 2 internal segments (DMZ and internal network).
> My machine have 3 Network cards.
>  
>  Is this possible ?
>  
>  I can seem to get all the segments to see each other. Can you give me an
>  idea on how to do this. Is it just a question of routes / Nat and Arp
>  entries ?
>  
> DMZ - 192.168.1.0 / 255.255.255.0
> Internal Network / 192.168.2.0 / 255.255.255.0
> For the external interface, I have 64 ip addresses - 255.255.255.192
-- 
Marcello Scacchetti <marcello.scacchetti@nextrem.it>

