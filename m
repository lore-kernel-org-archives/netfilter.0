From: m_feldmann@t-online.de (Michael Feldmann)
Subject: Redirect in intranet using DNAT?
Date: Sun, 16 Nov 2003 11:43:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311160017.05962.m.feldmann@nikocity.de>
Reply-To: m.feldmann@nikocity.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi all, 


How can I redirect traffic from one internal IP to another? My situation is as 
follows:

I have two webservers in an Intranet, one on 192.168.0.1, port 80, the
other on on 192.168.0.5 port 80. Each machine has only one ethernet
card, attached to the same switch.Now I want to take away the first
webserver In order to do this transparently, I thought of using a
redirect rule.

Thus, on 192.168.0.1 I tried the following commands:

iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 80 -j DNAT
--to 192.168.0.5:80
iptables -t nat -A PREROUTING -p udp -d 192.168.0.1 --dport 80 -j DNAT
--to 192.168.0.5:80


For testing reasons, all the policies on both machines are set to ACCEPT.
iptables -t nat -L -n yields:


Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       udp  --  0.0.0.0/0            192.168.0.1        udp dpt:80
to:192.168.0.5:80
DNAT       tcp  --  0.0.0.0/0            192.168.0.1        tcp dpt:80
to:192.168.0.5:80

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


With these rules, I thought an attempt to reach 192.168.0.1:80 would
lead me to 192.168.0.5:80. But it seems there are no packets arriving at 
192.168.0.5:80 .
Obviously, i seem to overlook something. But what?

Thanks in advance
Michael


P.S. Sorry if this question has been posted twice. I am note sure if 
yesterday's posting has really reched the list.


