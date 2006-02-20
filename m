From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: ACCEPT behaviour (from a newbie...)
Date: Mon, 20 Feb 2006 14:39:11 +0100 (CET)
Message-ID: <56744.193.173.147.3.1140442751.squirrel@webmail.sterenborg.info>
References: <MDAEMON470047200602171659.AA5903088@excelente.com.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <MDAEMON470047200602171659.AA5903088@excelente.com.pt>
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

On Fri, February 17, 2006 17:59, informatica@excelente.com.pt wrote:
> Hi to all,
>
> Being a Windows user, I am just starting to grasp the universe of firew=
alling
> with netfilter. As I understood so far, when a packet meets a rule, the
> target instruction is executed. If it happens to be ACCEPT, as in this
> example, then no more rules are inspected and the packet is let through=
.
>
> Assuming this is correct, then on the following example (taken from an =
IPCop
> config file) an ipsec packet would never reach custom chain IPSECRED (l=
ines 9
> and 10) because line 3 is automatically ACCEPTing all ipsec packets ent=
ering
> the INPUT chain.
>
> Is this correct, or need I do some more home work?

Line 3 would indeed accept all traffic coming in on any ipsec device and =
the
following rules in this chain will not be processed anymore.

If there is some forwarding going on (nat table) then line 4 will accept =
that
traffic. Having never used ipsec I can't say if this would be a working
situation however that's what the rule says.

> 01.        # accept all traffic from ipsec interfaces
> 02.        /sbin/ipccept all traffic from ipsec interfaces
> 03.        /sbin/iptables -A INPUT   -i ipsec+ -j ACCEPT
> 04.        /sbin/iptables -A FORWARD -i ipsec+ -j ACCEPT
>
> 05.        # allow DHCP on BLUE to be turned on/off
> 06.        /sbin/iptables -N DHCPBLUEINPUT
> 07.        /sbin/iptables -A INPUT -j DHCPBLUEINPUT
>
> 08.        # IPSec chains
> 09.        /sbin/iptables -N IPSECRED
> 10.        /sbin/iptables -A INPUT -j IPSECRED
> 11.        /sbin/iptables -N IPSECBLUE
> 12.        /sbin/iptables -A INPUT -j IPSECBLUE


Gr,
Rob



