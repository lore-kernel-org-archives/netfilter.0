From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: 1 webserver NATd, 2nd won't work
Date: Wed, 22 Oct 2003 00:24:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c39822$176fd1a0$0201000a@sterenborg.info>
References: <Pine.LNX.4.44.0310211011580.16322-100000@orca.princerupertlibrary.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310211011580.16322-100000@orca.princerupertlibrary.ca>
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
To: joe@princerupertlibrary.ca, netfilter@lists.netfilter.org

> I will be using pseudonyms for the machines and public IP addresses
> The two web servers are:
> NAME		INTERNAL IP ADDRESS	PUBLIC IP ADDRESS
> 
> marge.prl.ca 	192.168.0.244		8.8.8.149
> homer.prl.ca	192.168.0.211		8.8.8.148
...
> I have successfully NAT'd the first web server marge with the 
> following instructions:
> #Open ports on Marge
> #First the regular port 80
> /sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 80
> /sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 
> -j DNAT --to 192.168.0.244:80

If this is your first PREROUTING rule, it will match *all* http traffic
coming in at eth1 since you didn't specify a destination IP (-d <ip>).

> But when I try to NAT homer with the following commands I can 
> NOT find the page outside of 
> our network.  
> #Opening a route to Homer
> /sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 80
> /sbin/iptables -t nat -A PREROUTING -d homer.prl.ca -p tcp 
> --dport 80 -j DNAT --to 192.168.0.211:80

So this PREROUTING rule will never match. The http traffic was already
cought by the previous rule.
Besides, the way you're using it you only need the FORWARD rule once.

In short, I think it would be :
/sbin/iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
/sbin/iptables -t nat -A PREROUTING -i eth1 -d marge.prl.ca \
  -p tcp --dport 80 -j DNAT --to 192.168.0.244:80
/sbin/iptables -t nat -A PREROUTING -i eth1 -d homer.prl.ca \
  -p tcp --dport 80 -j DNAT --to 192.168.0.211:80


Gr,
Rob


