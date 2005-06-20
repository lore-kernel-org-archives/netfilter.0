From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: using NetFilter to share the SAME SINGLE IP between a Linux
	router AND a computer simultaneously
Date: Mon, 20 Jun 2005 11:05:14 -0500
Message-ID: <200506201105.14757.rob0@gmx.co.uk>
References: <00c301c5759c$6771b3e0$02c8a8c0@computer1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c301c5759c$6771b3e0$02c8a8c0@computer1>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 20 June 2005 08:31, John Wigley wrote:
> What I am looking to do is to be able to configure a Linux based
> router to be able to share a single Public IP address between the
> linux router and a single computer on the lan acting as the DMZ host.

You cannot "share" the IP address. Any given packet can only go to a 
single destination (load balancing arrangements notwithstanding.) But 
what you're describing is probably very simple. For example, assuming 
shell variables properly set as should be self-evident:

iptables -vt nat -A PREROUTING -i $WAN_IF -d $WAN_IP -m state \
  --state NEW -j DNAT --to $DMZ_IP

[NB: untested! I am at present not in a position to test this.]

Insofar as sharing, you would place any exception rules before this 
rule, to allow such packets to be received by the firewall machine 
itself:

iptables -vt nat -I PREROUTING -i $WAN_IF -d $WAN_IP \
  [match extensions as needed] -j ACCEPT

For example to give 22/tcp to the firewall machine's sshd:

iptables -vt nat -I PREROUTING -i $WAN_IF -d $WAN_IP \
  -p tcp --dport 22 -j ACCEPT

Similarly you could use preceding DNAT rules to route chosen traffic 
somewhere other than the DMZ host. Order of rules is important! An 
ACCEPT rule in nat/PREROUTING means that matching packets are not to be 
mangled by subsequent rules.

Remember, when these DNAT'ed DMZ packets hit the filter table they have 
the new destination IP, and they will hit the FORWARD chain, not INPUT.

Read the NAT HOWTO and Packet Filtering HOWTO to begin to understand 
this.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

