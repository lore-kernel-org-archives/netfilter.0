From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: natting issue-URGENT---i need help badly
Date: Tue, 03 Feb 2004 11:46:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075826815.1905.21.camel@jasiiitosh.nexusmgmt.com>
References: <20040203161751.6693.qmail@web20725.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040203161751.6693.qmail@web20725.mail.yahoo.com>
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
To: ip tables <iptables_help@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-02-03 at 11:17, ip tables wrote:
> Dear group,
> 
> I have a machine with 2 NICs one having the IP
> 10.2.240.19(eth2) and one 192.168.128.4(eth1). I use
> redhat 9.0(2.4.20-8) with the built in iptables
> V1.2.7a.
> Yes i have a eth0 also.
> I have the following rules. My idea is to permit only
> http on port 80 and nrpc on port 1352. With this setup
> after making the POSTROUTING default policy to ACCEPT
> i could telnet to both the ports 1352 and 80. But when
> i try to connect to the Domino server via a Lotus
> notes client it fails. I would prefer to have the
> POSTROUTING to DROP by default also. I'm confused.
> Help me. Thanks for your time.
> 
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
> iptables -t nat --policy PREROUTING DROP
> iptables -t nat --policy OUTPUT DROP
> iptables -t nat --policy POSTROUTING ACCEPT
> iptables -t nat -A POSTROUTING -o eth2 -j SNAT
> --to-source 10.2.240.19
> iptables -t nat -A PREROUTING -i eth2 -p tcp --sport
> 1:65535 -d 10.2.240.19 \
> --dport 80 -j DNAT --to-destination 192.168.128.5
> iptables -t nat -A PREROUTING -i eth2 -p tcp --sport
> 1:65535 -d 10.2.240.19 \
> --dport 1352 -j DNAT --to-destination 192.168.128.5
> iptables -t nat -A PREROUTING -i eth2 -p udp --sport
> 1:65535 -d 10.2.240.19 \
> --dport 1352 -j DNAT --to-destination 192.168.128.5
> iptables -A FORWARD -i eth2 -o eth1 -p tcp --sport
> 1:65535 -d 192.168.128.5 \
> --dport 80 -m state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth2 -o eth1 -p tcp --sport
> 1:65535 \
> -d 192.168.128.5 --dport 1352 -m state --state NEW -j
> ACCEPT
> iptables -A FORWARD -i eth2 -o eth1 -p udp --sport
> 1:65535 \
> -d 192.168.128.5 --dport 1352 -m state --state NEW -j
> ACCEPT
> iptables -A FORWARD -i eth2 -o eth1 -p tcp -m state \
> --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth2 -p tcp -m state \
> --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth2 -p udp -m state \
> --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth2 -o eth1 -p udp -m state \
> --state RELATED,ESTABLISHED -j ACCEPT
> 
<snip>
I must confess that I don't have the time to fully digest your rules
but, since this sounds like an emergency, here are a couple of quick
ideas.  I hope they help rather than hurt!

You will generally not want to DROP in your NAT table.  It makes heavy
use of connection tracking and does not see all packets.  Place your
access control in mangle for malicious packets (malformed, probes, etc.)
and in filter for access control on otherwise legitimate packets.

I use a different syntax in my forward chain but I do not know if yours
is an error.  Since --dport is an implicit match for -p tcp or -p udp, I
put it next to that parameter and not after the -d destination
parameter.

Is there a chance that the Notes traffic dynamically switches to some
other port, i.e., it starts on 1352 but then moves to something else
like ftp, Sun and MS RPC do? A packet trace with a tool like ethereal
would help you see that (www.ethereal.com).

Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


