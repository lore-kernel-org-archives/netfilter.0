From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Thu, 08 Jan 2004 17:12:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-F6JcZikaTAbNF00019dce@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

Good morning Mr Stone,

I'm sorry, I guess I dont explain correctly.

I have a IP range about /28 Public IP.  I have 2 NIC in my Linux BOX, one 
for the Internet and the other for my servers Switch.

I only have my server on this Network, nothing else, but I need having a 
firewall to monitor, snort, LOG and analyst all what is appening on my 
network.  I have several OS behing my firewall, not only Linux.  That why I 
need a firewall.

Actualiy, I PREROUTING -DNAT all my traffic from my public IP address to my 
private segment, and if I understant correctly, it's possible to have public 
IP on my server, Filtred by my linux firewall box?

I know that NAT lost performance, but actualy, is the only way I know how to 
do that.

My Topology:

192.168.0.2 (WEB) <---|
192.168.0.3 (DNS) <---|
192.168.0.4 (MAIL)<---|
		      |
		      |
                                      |
		    eth1
		192.168.0.1 (GW)
		   -------
		   | BOX |
		   -------
		      ^
		      |
	eth0   : 20.0.0.1
	eth0:0 : 20.0.0.2  (DNAT 192.168.0.2)
	eth0:1 : 20.0.0.3  (DNAT 192.168.0.3)
	eth0:2 : 20.0.0.4  (DNAT 192.168.0.4)
		      ^
		      |
		      |
		   INTERNET


So I have rules
iptables -t nat -A PREROUTING -p tcp/udp --port X -s 20.0.0.2 \
-j DNAT --to-destination 192.168.0.2:X

And my postrouting

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.2 -j SNAT --to-source 
20.0.0.2

My FORWARD rules are WideOpen

Spliting my DNS is not an option.

Thanks in advance and sorry for the mistake explanation.

Martin


>Thanks for help Mr. Brenton,
>
>But I dont understand something.  You tell me to use my public address for
>each server on my DMZ.  How can I use public IP on my server who are behind
>my firewall?  I want the server to stay behind the Firewall.
>
>I have one IP range /28, and I dont think my ISP will give me another IP
>range.

The suggestion was that if you have a large enough public IP block, you 
subnet
it so that part is used for your DMZ and part is used for everything else.
You can then route the DMZ subnet to machines on the DMZ which genuinely 
have
the public addresses assigned to them without using NAT.

All that is involved is to assign one of the /28 addresses to the DMZ
interface on your firewall, choosing the addresses for the 'external' and 
the
'DMZ' interfaces (as well as the netmasks) so that the DMZ is a clearly
identified subnet of its own, with a sensible routing table entry (which 
gets
set up automatically by Linux as soon as you assign the address and the
netmask to the interface).

All you need to remember is that Linux consults its routing table from most
specific to least specific, therefore a /29 subset of a /28 will take
precedence over the more general /28 entry.

Since you have a /28 subnet (=16 addresses) it's certainly possible to do 
this
in your case, and clearly a /29 subnet for the DMZ would be the simplest
arrangement (although not the only one by any means).

Antony.

--
It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

- Daniel C Dennet

                                                     Please reply to the 
list;
                                                           please don't CC 
me.

_________________________________________________________________
MSN Search, le moteur de recherche qui pense comme vous !  
http://fr.ca.search.msn.com/


