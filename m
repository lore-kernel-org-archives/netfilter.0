From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip forwarding setup help
Date: Sun, 4 Jul 2004 10:38:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407041038.17553.Antony@Soft-Solutions.co.uk>
References: <40323773-CD9B-11D8-A537-0003938146D0@qorvus.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40323773-CD9B-11D8-A537-0003938146D0@qorvus.net>
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

On Sunday 04 July 2004 10:19 am, Adam Sayler wrote:

> Hi,
>
> I'm trying to forward traffic from my linux gateway to my web server
> and having trouble getting it setup properly.
>
> eth0 address:82 ---> 192.168.1.10:81
>
> I've was reading the HOWTO about the port forwarding setup and tried
> using this:
> iptables -A PREROUTING -t nat -p tcp -d "eth0_IP address" --dport 82 -j
> DNAT --to 192.168.1.10:81
> iptables -A PREROUTING -t nat -p udp -d "eth0_IP address" --dport 82 -j
> DNAT --to 192.168.1.10:81

HTTP (for a web server) does not use UDP, so you can scrub the second rule.

> the setup is unclear to me and I'm not quite sure for my specific
> situation if I want MASQUERADING, DNAT or something else.

MASQUERADING is for changing the *source* address of packets *leaving* an 
interface so that the replies come back to that interface - most commonly 
used when you have a dynamic IP connection from your ISP and you want packets 
from internal client machnes on your LAN to be able to reach, and return 
from, the Internet.   Not what you want here.

DNAT is Destination NAT - in other words, packets which were addressed to some 
(usually public) destination address get NATted so that they now have some 
other (usually private) destination address.   Often used for redirecting 
packets sent across the Internet (to a public IP address of yours) so that 
they actually reach a machine on a private address inside your LAN or DMZ.   
This is what you want here, and the TCP rule above is correct.

> All I want to do is forwarding all incoming and outgoing traffic on eth0:82
> to my internal IP address of the server.

The significating word in the above paragraph, which you haven't mentioned 
about your ruleset, is the word "forwarding".   Do you have a rule in your 
FORWARD chain allowing packets from the Internet to 192.168.1.10 TCP port 81?

> do i need to add anything on my gateway like a routing table entry for
> this or does iptables do the routing for me when I use the DNAT
> function?

Netfilter does not change the routing in any way.   The firewall must be able 
to get packets to the machine on 192.168.1.10, otherwise it won't work.   If 
you cannot access 192.168.1.10 from the firewall, then yes, you need to add a 
route.   Netfilter assumes packets can get to where they need to be, and it 
then decides whether to allow them to get there (or, as in what you're trying 
to do here, whether to send them somewhere else).

I think you need to drop the UDP PREROUTING rule, add a FORWARD rule, and it 
should work.

*Please* test it from the Internet, not from your internal network - if you 
don't understand why I say that, search the archives or the netfilter HOWTOs 
for things like "DNAT to the same subnet doesn't work".

If you still have problems please post the full ruleset.

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


