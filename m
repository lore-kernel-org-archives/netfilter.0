From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Tips for script
Date: Thu, 5 Aug 2004 13:11:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408051311.55107.Antony@Soft-Solutions.co.uk>
References: <4111799E.5060607@list.idg.dk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4111799E.5060607@list.idg.dk>
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

On Thursday 05 August 2004 1:04 am, Jacob Friis Larsen wrote:

> Would this script work like this:
> - Allow all outgoing.
> - Allow all to port 80, 21, 22, 25, 143

Yes.

> What else does it do?

It enables packet forwarding for no apparent reason, as the machine has only 
one interface and the FORWARD chain has a default DROP policy with no rules.

It also loads the ip_nat_ftp module for no purpose, since the machine does not 
do nat.

> Any tips?

Personally I'd put the ESTABLISHED,RELATED rule first, for efficiency.

You might want to allow loopback packets as well, depending on what 
applications you're running on the machine.

iptables -A INPUT -i lo -j ACCEPT

Regards,

Antony.

> #!/bin/sh
>
> # iptables script generator: V0.1-2002
> # Comes with no warranty!
> # e-mail: michael@1go.dk
>
> # Diable forwarding
> echo 0 > /proc/sys/net/ipv4/ip_forward
>
> WAN_IP='x.x.x.x'
> WAN_NIC='eth0'
>
> # load some modules (if needed)
> modprobe ip_nat_ftp
> modprobe ip_conntrack_ftp
>
> # Flush
> iptables -t nat -F POSTROUTING
> iptables -t nat -F PREROUTING
> iptables -t nat -F OUTPUT
> iptables -F
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
>
> # Open ports on router for server/services
> iptables -A INPUT -j ACCEPT -p tcp --dport 80
> iptables -A INPUT -j ACCEPT -p tcp --dport 21
> iptables -A INPUT -j ACCEPT -p tcp --dport 22
> iptables -A INPUT -j ACCEPT -p tcp --dport 25
> iptables -A INPUT -j ACCEPT -p tcp --dport 143
>
> # STATE RELATED for router
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # Enable forwarding
> echo 1 > /proc/sys/net/ipv4/ip_forward

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


