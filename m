From: Adam Mercer <r.a.mercer@blueyonder.co.uk>
Subject: Re: Problems with NAT
Date: Sun, 28 Sep 2003 08:36:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030928073635.GA4295@skymoo.dyndns.org>
References: <20030927164414.GA16146@skymoo.dyndns.org> <LFEHKEBEBHAFGJBMNKAOCEOCCBAA.markee@bandwidthco.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <LFEHKEBEBHAFGJBMNKAOCEOCCBAA.markee@bandwidthco.com>
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
Content-Transfer-Encoding: 7bit
To: "Mark E. Donaldson" <markee@bandwidthco.com>
Cc: netfilter@lists.netfilter.org

On Sat, Sep 27, 2003 at 08:30:17PM -0700, Mark E. Donaldson wrote:
> Adam - You have a mixture of "stateless" and "stateful" rules.  SSH is
> passing in both directions because you have an explicit ACCEPT for it.  DNS
> is blocked so you are unable to resolve.  Although you need to do more than
> this for long term function and security, here is a quick fix so your system
> should work.  Add:
> 
> ${IPTABLES} -A INPUT -m state --state NEW -j ACCEPT
> ${IPTABLES} -A FORWARD -m state --state NEW -j ACCEPT

Mark

Thanks for the response, I've added those rules and still nothing. I
tried flushing all the rules, adding the example from the NAT howto and
still nothing. eth1 receives the packets yet doesn't transmit them.

Could this be due to something missing in my kernel config, I know that
I had a problem setting up the DHCP server as the kernel was missing
somthing? What options to I need enabled in the kernel?

Cheers

Adam

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Adam Mercer
> Sent: Saturday, September 27, 2003 9:44 AM
> To: netfilter@lists.netfilter.org
> Subject: Problems with NAT
> 
> 
> Hi
> 
> I'm trying to set up my firwall so that I can plug my laptop into eth1
> of my desktop and use NAT to access the outside world on the laptop
> 
> I've followed the NAT Howto and my firewall contains the following rules
> 
>     # allow local-only connections
>     ${IPTABLES} -A INPUT -i lo -j ACCEPT
> 
>     # free output on any interface to any ip for any service
>     ${IPTABLES} -A OUTPUT -j ACCEPT
> 
>     # permit answers on already established connections
>     # and permit new connections related to established ones
>     ${IPTABLES} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>     ${IPTABLES} -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
>     # allow incomg ssh connections
>     ${IPTABLES} -A INPUT -p tcp  --dport ssh -j ACCEPT
> 
>     # NAT
>     ${IPTABLES} -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>     ${IPTABLES} -A FORWARD -s 10.0.0.0/24 -j ACCEPT
> 
>     # everything not accepted > /dev/null
>     ${IPTABLES} -P INPUT DROP
>     ${IPTABLES} -P FORWARD DROP
>     ${IPTABLES} -P OUTPUT DROP
> 
>     # be verbose on dynamic ip-addresses
>     echo 2 > /proc/sys/net/ipv4/ip_dynaddr
> 
>     # disable ExplicitCongestionNotification
>     echo 0 > /proc/sys/net/ipv4/tcp_ecn
> 
>     # turn on IP forwarding
>     echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> The laptop (PowerBook G4) is assigned an ip address in the range
> 10.0.0.2-.10
> by a DHCP server. eth1 has an ip address 10.0.0.1, and eth0 is the
> connection
> to the outside world. After running ethereal it appears that no packets from
> the local network are making it to eth0. However I can ssh into the server
> if I
> use ip address, but not hostname.
> 
> Can anyone help me out with this?
> 
> Thanks in advance
> 
> Adam
> 

