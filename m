From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: how to forward traffic to MS Exchange?
Date: Mon, 07 Jun 2004 08:03:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086609799.21184.8.camel@localhost>
References: <200406071311.55915.haimat@lame.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406071311.55915.haimat@lame.at>
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
To: "Matthias F. Brandstetter" <haimat@lame.at>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Mon, 2004-06-07 at 07:11, Matthias F. Brandstetter wrote:
> Hi all,
> 
> I am using netfilter based firewalls sind several years now w/o any 
> problems, same goes for netfilter based NAT.
> 
> Now I want to forward all incoming traffic on smtp port 25 on a gateway to 
> an intern MS Exchange mailserver, so I tried to use this rule, as allways:
> 
> $IPTABLES -t nat -A PREROUTING -i $E_NIC -p tcp --dport 25 -j DNAT 
> --to-destination 192.168.120.10:25
> 
> (where $IPTABLES is the iptables binary, and $E_NIC is extern NIC "ppp0")
> 
> I never had any problems with this rule, and I use the same with http port 
> 80 for MS Exchange webserver on the same net, w/o any problems.
> 
> But: After activating this rule and connectiong via telnet to port 25 on 
> external address, I can connect to Exchange server, but connection 
> immedeately is dropped afterwards (I get the "Connected to ..." and 
> "Escape character is '^]'." lines, but after that a "Connection lost").
> 
> When I disable this rule and use rinetd [1] to forward smtp traffic 
> instead, I get no errors and can connect to the Exchange server via 
> telnet.
> 
> So my question: Is this an iptables or an Exchange issue? Do I have to 
> provide another rule or change my existing rule to be able to connect to a 
> MS Exchange server? I don't think it's an Exchange problem, since 
> everything is ok when I use rinetd, as said.
> 
> Hopefully someone can help me, I have no ideas left :(
> Greetings and TIA, Matthias
> 
> footnote:
> [1] http://www.boutell.com/rinetd/

I assume you have an access control rule somewhere that allows the
traffic to be forwarded to the Exchange server and that you are using
connection tracking or have another rule to allow the reply packets.

Given that, I would suggest tracing the packets to and from the Exchange
server with something like Ethereal (http://www.ethereal.com) and, if
the packets are getting lost within your firewall, tracing the packet
flow within your firewall with various strategically placed logging
rules to find out where it is breaking.  Good luck - John
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


