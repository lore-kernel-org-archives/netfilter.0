From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: again problem with alias / virtual interface
Date: Tue, 20 Jul 2004 20:09:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407202009.33758.Antony@Soft-Solutions.co.uk>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108> <40FC2286.3070005@pbl.ca> <007d01c46dae$0a45f330$eb53623e@x>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007d01c46dae$0a45f330$eb53623e@x>
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

On Monday 19 July 2004 5:30 pm, Marco Strullato wrote:

> I've tried with just eth1 but the rule is not applied, or it seems not to
> be applied

Do you mean "it does not show up when I list the rules afterwards", or do you 
mean "the rule gets entered in the list, but it does not do what I want"?

> I've seen that using virtual interfaes is deprecated so I tryed to set
> multilple ip with iproute.
> If I set network interfaces only with iproute and not with ifconfig,
> network configuration seems to be absent.

What makes you say this?   If you try adding the extra addresses with "ip addr 
add a.b.c.d dev eth0" etc, what do you get afterwards when you try "ip addr 
show"?

> If I set network with ifconfig and not with iproute, network configuration
> seems ok

We are not saying there is anything wrong as such, or won't work, with using 
ifconfig - you just aren't allowed to use the ":" in the interface name in 
the netfilter rules.

> So I can't to use iproute (to set interfaces) and iptables becacuse network
> configuration is absent.

How are you checking this?

Also, did you try the following?

On Monday 19 July 2004 8:14 pm, Antony Stone wrote:

> I suggest you test these additional addresses with something like this:
>
> iptables -A INPUT -p icmp -i eth1 -d 82.186.92.90 -j ACCEPT
> iptables -A INPUT -p icmp -i eth1 -d 82.186.92.93 -j ACCEPT
> iptables -A INPUT -p icmp -i eth1 -j ACCEPT
>
> Then ping 82.186.92.90 from a machine connected to eth1; then ping
> 82.186.92.93 from a machine connected to eth1; then use "iptables -L INPUT
> -nvx" to check the packet / byte counts for the above three rules.
>
> You should get non-zero packet counts for the first two rules; hopefully
> zero packets for the third rule.
>
> Also check from a machine directly connected on eth1 that you get the same
> MAC address for both the above addresses in response to an "arp -an".

Regards,

Antony.

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


