From: "lawrence Of Arabia" <zo2000@hotmail.com>
Subject: Bridges, Firewalls and Gateways
Date: Tue, 11 Feb 2003 07:32:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F24CiOXZg5h5DWfRDXj000203a9@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hey everybody,

Im in an ackward situation. i just need to know something (to save 
future/present keyboard head bashing)

I have DSL (pppoe)

i have (would, actually) a box with 3 NICs, acting as a gateway for a subnet 
and a bridge for the other.

(power outage ... the joys of a laptop)

meaning that 1 NIC (to the dsl modem) ... would be used as the NIC for ppp0 
and a part of the bridge to the DMZ subnet.
(psst, the dmz subnet would connect with pppoe, as though i had a hub 
onfront of the dsl modem)

is this possible?

if you dont understand, keep reading ... the rest is just some thought 
through a keyboard ...
_________________________________________________________________________________________________________________

(powers back)

i am no networking expert. a bridge is just a way of plugging to male cat5 
connectors together until you implement filtering, so it just takes every 
thing from a to b, nothing more, so this would mean that the pppoe 
connection replies would simply be forwarded to the other end of the bridge. 
so it woudnt work. but i assume there would be some hack to have iptables or 
ebtables to determine if a packet is destined for

ppp0 (or ppp0's ip) ---> if so, NAT and forward to private subnet NIC

if not for ppp0, then just pass through the bridge (and eventually filter)

this setup, for me is the most logical. ive been told many times "stick with 
smoothwall/ipcop" ...
but, i do feel that this setup would be the best mix between security and 
flexibility. having "real" IP addresses so i can easily add entries at 
zoneedit, yet keep a powerful firewall script at one place, run 
snort/guardian. having all the connections go through a central point (imho) 
is the best way of securing things, you only have to check out one log, add 
rules at one place. nonetheless, its invisible to the outside world (unless 
you know that its also a gateway for a second subnet) ...

anyway, ill stick to this

i would really appreciate having a clear awnser on this. i've read about 
nat, about bridging, about bridging adsl connections (to firewall from a 
central point), but i havent found something incorporating the 2.

cheers, lawrence.

_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*.  
http://join.msn.com/?page=features/featuredemail


