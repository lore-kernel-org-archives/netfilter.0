From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not [!] rule is not working
Date: Thu, 16 Aug 2007 10:27:32 -0500
Message-ID: <46C46CE4.70308@riverviewtech.net>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>	<46C1BE08.6070409@riverviewtech.net>	<d41814cf0708152256w2e5e146cs7306e9e40e3b6872@mail.gmail.com>	<46C46195.9070500@riverviewtech.net>
	<46C4683B.3090702@plouf.fr.eu.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C4683B.3090702@plouf.fr.eu.org>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/16/07 10:07, Pascal Hambourg wrote:
> The default behaviour is to reply on any interface for any local
> address. It can be changed on a per-interface basis with the kernel
> parameter /proc/sys/net/ipv4/conf/<interface>/arp_ignore. Definitions
> and values are in Documentation/networking/ip-sysctl.txt :

Ok, so this can be set up, it is just something that has to be turned on
via /proc.

> arp_ignore - INTEGER
>     Define different modes for sending replies in response to
>     received ARP requests that resolve local target IP addresses:
>     0 - (default): reply for any local target IP address, configured
>     on any interface
>     1 - reply only if the target IP address is local address
>     configured on the incoming interface
>     2 - reply only if the target IP address is local address
>     configured on the incoming interface and both with the
>     sender's IP address are part from same subnet on this interface
>     3 - do not reply for local addresses configured with scope host,
>     only resolutions for global and link addresses are replied
>     4-7 - reserved
>     8 - do not reply for all local addresses
> 
>     The max value from conf/{all,interface}/arp_ignore is used
>     when ARP request is received on the {interface}

If I understand the OP and what you have provided here correctly I
believe the OP would simply want to issue the following commands:

echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth1/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth2/arp_ignore

This should configure the interfaces to only respond to ARP requests for
their own IP address(s) (not other interfaces IP address(s)) correct?

Thus the kernel would take care of what the OP is wanting to do and the
there would be no need for ARP / IPTables, correct?

So I can correctly update my references, where did you copy and past
that documentation from?



Grant. . . .

