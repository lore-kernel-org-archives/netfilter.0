From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Re: Bad Filter Set?
Date: Tue, 12 Nov 2002 16:31:40 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211121629140.19945-100000@shortcircuit.dyndns.org>
References: <3DCFB217.4030501@fugmann.dhs.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DCFB217.4030501@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: netfilter@lists.netfilter.org

On Mon, 11 Nov 2002, Anders Fugmann wrote:

> Dan Egli wrote:
> > 
> > 1) Block all ports EXCEPT:
> > FTP, SSH, TELNET (yes there is a reason for telnet!), SMTP, DNS, NNTP, NTP,
> > ROUTED (520), PRINTER (515), POP3, IMAP, HTTP, HTTPS, and ports 4000 & 5000
> > (special programs run on those ports and they need to be open).
> You do realize that many of these protocols are very insecure, and 
> should not be opend to the public. Also do you really want to allow 
> everyone (on the intra- and inter-net ) to use your printers?

Ok. This is true, so let me clarify. the INTERNAL net should have access 
to all those. The EXTERNAL side needs:
SMTP, FTP, TELNET, SSH, 4000 & 5000
> 
> > 
> > 2) Forward Inbound traffic from port 5000 to IP 192.168.0.5. Should be a
> > Transparent NAT (If I hit 192.168.0.1 port 5000, then the firewall forwards
> > it to 192.168.0.5 5000,  and any packets sent from 192.168.0.5:5000 [which
> > would only be in reply to an inbound packet] should appear as coming from
> > 192.168.0.1:5000). Here's a basic setup of the machine so you have that to
> > go on:
> This is impossible. A machine with IP 192.168.0.6 cannot be redirected 
> to 192.168.0.5 through 192.168.0.1. But in the example below, all 
> connections to 64.122.31.38:5000 (through eth1) will be redirected to 
> 192.168.0.5.
That is what I wanted. On the internal side all machines will have access 
to the 192.168.0.5 machine directly, no need for nat. It was only for 
external that this was needed. 

> > 
> > EXTERNAL IP:  64.122.31.38 on eth1
> > internal IP: 192.168.0.1 on eth0
> > 
> > 3) Perform basic IP Masquerading for unlisted machines on the 192.168.0.x
> > net. So if a machine addressed as 192.168.0.26 requests www.yahoo.com, it
> > goes in from eth0, then goes out eth1 as from eth1's address, and the return
> > comes in eth1 and goes back out eth0 to the correct machine.
> > 
> > 4) Log any blocked traffic in the syslog.
> > 
> > Your help is greatly appreciated!
> > 
> Here is your rules. I have not tested them, so minor changes may be 
> nessesary.
> --------------------------------
> 
> # Set default policies.
> iptables -P INPUT DROP
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD DROP
> 
> # Flush all tables.
> iptables -F INPUT
> iptables -F OUTPUT
> iptables -F FORWARD
> iptables -t NAT -F PREROUTING
> iptables -t NAT -F POSTROUTING
> iptables -t NAT -F OUTPUT
> 
> iptables -A INPUT -p tcp -m multiport --dports \
>    SMTP,DNS,NNTP,NTP,ROUTED,520,PRINTER,POP3,IMAP,HTTP,\
>    HTTPS,4000,5000 -j ACCEPT
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A INPUT -j LOG
> 
> iptables -A FORWARD -i eth0 -j ACCEPT
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -j LOG
> 
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 5000 \
>    -j DNAT --to-destination 192.168.0.5:5000
> 
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 64.122.31.38
> 
> echo 1 > /proc/sys/net/ipv4/ip_forward
> -------------------------
> 
> Regards
> Anders Fugmann
> 
> 
> 


