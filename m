From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: comments about lokkit default script
Date: Fri, 12 Sep 2003 12:38:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063391915.5967.15.camel@smoogen1.lanl.gov>
References: <Pine.LNX.4.44.0309120210280.1054-100000@Chrestomanci>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0309120210280.1054-100000@Chrestomanci>
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
To: Faheem Mitha <faheem@email.unc.edu>
Cc: netfilter@lists.netfilter.org


Basically to understand the script a bit better you should look at how
the rules look in the table.

iptables -nxvL

should give you some output. If the default policies are to ACCEPT
things then what is happening is that you are accepting ALL outbound
traffic and very little inbound traffic. The newest
redhat-config-firewall in their rawhide has some changes to this, but I
have been doing custom firewalls for too long now to remember what they
are (I think they put in an ESTABLISHED,RELATED rule in now.)

Are you forwarding traffic through your firewall or just using it as a
client. If you are using it as a client it is pretty ok and secure. If
you are using it as a forwarder you will probably want to make some
changes for interfaces to be semi-trusted.

On Fri, 2003-09-12 at 00:11, Faheem Mitha wrote:
> Dear People,
> 
> I'm pretty new to packet filtering etc. I ran lokkit's simple
> configuration utility, and it seems to work Ok with my computer. I don't
> think I need an elaborate setup. I'm running my machine on Earthlink's
> cable broadband (pretty basic setup) using DHCP, and am currently
> disallowing all connections from outside, though I might open up an
> ssh port at some point. The script is run as
> 
> /sbin/iptables -I INPUT -j RH-Lokkit-0-50-INPUT && /sbin/iptables -I
>   FORWARD -j RH-Lokkit-0-50-INPUT
> 
> in /etc/rc*, where the chain is defined (/in /etc/default/lokkit) by
> 
> #!/bin/sh
> PATH=/sbin:$PATH
> iptables -N RH-Lokkit-0-50-INPUT
> iptables -F RH-Lokkit-0-50-INPUT
> iptables -A RH-Lokkit-0-50-INPUT -i lo -j ACCEPT
> iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.185
> --sport 53 -d 0/0 -j ACCEPT
> iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.186
> --sport 53 -d 0/0 -j ACCEPT
> iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.187
> --sport 53 -d 0/0 -j ACCEPT
> iptables -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
> iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -j REJECT
> 
> At the moment, I just trying to understand what this chain does.
> 
> >From reading documentation, I see that the line
> 
>   /sbin/iptables -I INPUT -j RH-Lokkit-0-50-INPUT && /sbin/iptables -I
>   FORWARD -j RH-Lokkit-0-50-INPUT
> 
> basically disallows new connections, but I got the impression that
> this is not considered the best way to do this, as it is still
> possible to make connections by using "malformed packets". Is this
> still a good first approximation?
> 
> I can't get any information about ports using nmap, presumably because
> it uses orthodox connection methods. Ping is still working, presumably
> because I have not disallowed ICMP packets.
> 
> Are the lines
> 
> iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.18*
> --sport 53 -d 0/0 -j ACCEPT
> 
> allowing through the DHCP connection? The 207.69.188.18* are
> Earthlink servers, they look like nameservers.
> 
> Thanks in advance for any reply.
>                                                     Faheem.
-- 
Stephen John Smoogen		smoogen@lanl.gov
Los Alamos National Labrador  CCN-5 Sched 5/40  PH: 4-0645 (note new #)
Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


