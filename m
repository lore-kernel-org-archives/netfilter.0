From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: delayed masquerading problems after openswan ipsec
Date: Sat, 24 Jul 2004 18:14:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241814.56642.Antony@Soft-Solutions.co.uk>
References: <41021A71.5030603@gmx.at>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41021A71.5030603@gmx.at>
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

On Saturday 24 July 2004 9:14 am, Felix Joussein wrote:

> Hello List,
>
> I'm not new to iptables, but this problem is very strange:
>
> I have a Linux 2.4.26 + openswan ipsec + iptables 2.11 box with a cable
> modem to connect to the internet - so far:
> I have one single rule in the postrouting chain:
>
> iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
>
> This works fine - also my IPSec tunnel is working nice.
> But after a while - can't say how long, the connection from the lan
> thrue the linux box get lost.
> dmesg's Output is:
>
> MASQUERADE: Route sent us somewhere else.
> klips_error:ipsec_xmit_send: ip_send() failed, err=1
>
> This message repeats as long, as  I remove the MASQ rule, and re-set it.
>
> Has anyone an idea about this issue?

Does your cable modem service provider change IP addresses on you on some 
frequent basis?

Try checking ifconfig next time this happens (before and after the problem).   
I expect you'll find that when things are working, both eth0 and ipsec0 have 
the same IP address (acquired from the ISP by DHCP), but after the problem 
has occurred, you'll probably see a different address on eth0, with the same 
old one on ipsec0.

The solution is probably to take the IPsec tunnel down and bring it back up 
again when the IP address on eth0 changes - I think you can do this from a 
script called by the DHCP client daemon.

If it turns out you're not getting given a different IP address, perhaps you 
can post the output from some diagnostics such as "route -n" or "ipsec look".

Regards,

Antony.

-- 
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the list;
                                                           please don't CC me.


