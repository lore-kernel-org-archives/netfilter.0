From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: How to direct packets to my server. DOES THIS LOOK RIGHT?
Date: Sun, 15 Dec 2002 07:51:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKCEJALLAA.rsterenborg@xs4all.nl>
References: <F22R4BnmJZBRZ2ZBHQB0001f322@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22R4BnmJZBRZ2ZBHQB0001f322@hotmail.com>
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
To: Joel Linuxdude <linuxlists@hotmail.com>, netfilter@lists.netfilter.org

> My Netfilter firewall (unfortunately) is running also
> my Apache web server, FTP server and Telnet daemon.
> I honestly think this is ok but its confusing me with
> the whole firewall aspect.

One could argue about security, but it's not uncommon.

> I wanted to allow new packets to go to my Linux box
> such as port 21 and 80 but only about 4 new connections
> per second.

> /sbin/iptables -A PREROUTING -i eth0 -p tcp -d x.x.x.x
> --dport 21 -m state
> --state NEW -m limit --limit 4/second -j DNAT --to x.x.x.x
>
> Whereas x.x.x.x is my IP that my ISP assigns me. Or would I use
> the following;
>
> /sbin/iptables -A PREROUTING -i eth0 -p tcp -d x.x.x.x
> --dport 21 -m state
> --state NEW -m limit --limit 4/second -j DNAT --to 192.168.0.1

If you're running servers on the firewall itself, packets sent to the
server are going to the INPUT chain ; you don't have to redirect the
traffic if your servers are accessible on your external IP.
The INPUT chain is in the filter table. If you don't specify a table
(-t <tablename>) on the iptables line, the filter table is assumed
when creating the rule.
Besides, the filter table has no PREROUTING chain so both rules above
would not work anyway.

I guess this rule would do the trick for http :
(/sbin/iptables -P INPUT DROP)
(/sbin/iptables -A INPUT -m state --state RELATED,ESTABLISHED -j
ACCEPT)
/sbin/iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state
NEW -m limit --limit 4/second -j ACCEPT

As for telnet : you might want to switch to ssh if possible.
Telnet!=secure because everything is sent in plaintext.


Rob


