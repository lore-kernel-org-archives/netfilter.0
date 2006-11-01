From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: RE: INPUT and PORTS
Date: Wed, 1 Nov 2006 12:40:30 -0500
Message-ID: <20061101174030.GC25768@animx.eu.org>
References: <20061101145719.564.qmail@webmail91.rediffmail.com>
	<1162394816.17873.41.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1162394816.17873.41.camel@localhost>
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
Content-Transfer-Encoding: 7bit
To: "plugthebox.net /dev/null" <devnull@plugthebox.net>
Cc: netfilter@lists.netfilter.org

plugthebox.net /dev/null wrote:
> I want to thank you all for contributing. 
> 
> I'm currently setting up a firewall and a web interface for it. My
> strategy is to have:
> 
> /sbin/iptables -P INPUT -j DROP
> /sbin/iptables -P FORWARD -j DROP
> /sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
> /sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
> /sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
> /sbin/iptables -A FORWARD -d 10.2.2.116 -j ACCEPT
> /sbin/iptables -A FORWARD -s 10.2.2.116 -j ACCEPT
> /sbin/iptables -A INPUT -s 10.2.2.116 -j ACCEPT
> /sbin/iptables -A FORWARD -d 10.2.2.117 -j ACCEPT
> /sbin/iptables -A FORWARD -s 10.2.2.117 -j ACCEPT
> /sbin/iptables -A INPUT -s 10.2.2.117 -j ACCEPT
> etc...
> /sbin/iptables -A INPUT -j DROP
> /sbin/iptables -A FORWARD -j DROP
> 
> Meaning, i want to accept the connections from these 3 IPs, and drop all
> the rest. Now i want to let those allowed IPs to only use 3 ports for
> the INPUT and more than 30 ports for FORWARDs (p2p and misc ports).
> 
> I can't use -m multiport for each FORWARD, there are too many ports that
> 1 FORWARD line can run. 
> 
> I thought by allowing the ports BEFORE the IPs, that it would accept
> allow only the ports ACCEPTed to the IPs ACCEPTed, is that correct?

If I understand what you are wanting correctly, something I'm currently
doing may be what you want.

If you want to only allow specific IPs to connect to specific ports, you
might want to try this:

create 2 chains:  ip and port (or whatever you want to name them.

iptables -A INPUT -j ip
iptables -A FORWARD -j ip

in ip:
iptables -A ip -j port -s 10.2.2.115
iptables -A ip -j port -d 10.2.2.115
...

in port:
iptables -A port -j ACCEPT -p tcp --dport 80
iptables -A port -j ACCEPT -p tcp --dport 22
...

Since you have the policy already to drop, there's probably no reason to add
DROP rules to INPUT and FORWARD.

If you want to allow any IPs, just ad them to the ip chain.  If you want to
allow the current list of ips to access different ports, just ad that port
to the port chain.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

