From: "Dimitri Yioulos" <dyioulos@firstbhph.com>
Subject: Allowing PPTP to DMZ
Date: Tue, 15 Mar 2005 08:30:28 -0500
Message-ID: <200503151330.j2FDUQpq008073@mail1.firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello to all.

 

I have added Poptop (pptp server) to my firewall box, and am haapy to say
that it works great.  One piece, though, that I haven't been able to figure
out is how to access servers sitting in the DMZ.  Specifically, once the
pptp connection is made, I can ssh into, or access Web-based management
tools on, the servers on the LAN.  However, I can't do those things for the
servers in the DMZ.  Here are the rules for pptp as they currently stand:

 

IPTABLES -A INPUT -i $INET_IFACE -p TCP --dport 1723 -j ACCEPT

IPTABLES -A OUTPUT -o $INET_IFACE -p TCP --sport 1723 -j ACCEPT

IPTABLES -A INPUT -i $INET_IFACE -p 47 -j ACCEPT

IPTABLES -A OUTPUT -o $INET_IFACE -p 47 -j ACCEPT

IPTABLES -A FORWARD -s 192.168.100.0/22 -d 192.168.100.0/22 -j ACCEPT

 

I'm actually not sure if these are 100% correct, but they do work.

 

I'd really like to get the DMZ part down so that I can remotely manage these
machines.

 

As always, many thanks.

 

Dimitri

