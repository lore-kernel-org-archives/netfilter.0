From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: connection dropouts
Date: Fri, 27 Feb 2004 17:28:18 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Awlmc-000PCy-Uz@alf1.lmb.internal>
References: <403EF579.80907@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403EF579.80907@snapgear.com> from Philip Craig at "Feb 27, 2004
 05:44:57 pm"
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

>T. Horsnell (tsh) wrote:
>> tcp      6 431253 ESTABLISHED src=10.2.0.4 dst=131.111.85.78 sport=49278 dport=143 [UNREPLIED] src=131.111.85.78 dst=10.2.0.4 sport=143 dport=49278 use=1
>> 
>> 'ESTABLISHED' 'UNREPLIED' seems an odd combination to me.
>
>This is happening when the firewall only sees packets travelling in
>one direction.  That is, 10.2.0.4 uses the firewall as its gateway
>to talk to 131.111.85.78, but since 131.11.85.78 knows about the
>10.x.x.x network, it replies directly to 10.2.0.4, so the firewall
>is missing half of the conversation.  It doesn't look to me like this
>particular connection has hanged.
>
>Do you have any DNAT rules on the firewall?  This kind of assymetrical
>routing does cause problems with DNAT, since the firewall doesn't get
>a chance to reverse the DNAT in the reply packets, and the symptom is
>that the connection hangs.

Yes, I do have a few DNATs. We have a bunch of servers which have
10. addresses, but which also have to be visible from the world, and
so have 131.111 addresses in the DNS. Incoming packets to these are
DNAT'd from the global addresses to their corresponding 10. addresses.
I also SNAT the outgoing packets from these servers, from their 10.
addresses to their corresponding global ip addresses, but I guess this
is probably unnecessary.

Evidence so far is that the network hangups are more like timeouts.
In many cases, the connection succeeds if the user is prepared to
wait. I dont know whether 30 secs is the hangup time (this might
correspond to the some of the timeouts for conntrack entries)
but there is a possiblilty that the hangs may correspond to a big splat
of UDP connections which I've noticed taking place periodically.
Even tho' these are between machines on the same LAN, they are currently
between hosts on different logical networks and so generate conntrack
entries (see my red-face blurb below).


>
>> I dont yet know why traffic between our 10. hosts and our
>> 131.111 hosts should generate a conntrack entry at all...
>
>If the packets go via the firewall, then a conntrack entry will
>always be created.

Sorry, I'm being a total idiot here. As well as filtering and NAT, the box
is configured as a router to route between our 10. hosts and the 131.111 ones
which havent migrated yet. So as well as static routes set in rc.local

# routes to our own UCam subnets:
route add -net 131.111.26.0/24 dev eth0
route add -net 131.111.84.0/24 dev eth0
route add -net 131.111.85.0/24 dev eth0
route add -net 131.111.89.0/24 dev eth0
route add -net 131.111.184.0/24 dev eth0
route add -net 131.111.185.0/24 dev eth0
# a route to 10. untilw we are completely 10.
route add -net 10.0.0.0/9 dev eth0

I have FORWARD rules:
#allow the firewall to route between our private net (10.0.0.0/9)
#and and our UCam subnets
iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.26.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.26.0/24 -d 10.0.0.0/9 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.84.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.84.0/24 -d 10.0.0.0/9 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.85.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.85.0/24 -d 10.0.0.0/9 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.89.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.89.0/24 -d 10.0.0.0/9 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.184.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.184.0/24 -d 10.0.0.0/9 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.185.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.185.0/24 -d 10.0.0.0/9 -j ACCEPT




>
>-- 
>Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com
>
>
>


