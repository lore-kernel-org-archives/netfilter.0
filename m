From: archi@archi.szn.pl
Subject: redirection in local private network problem
Date: Wed, 18 Feb 2004 23:38:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077143903.4033e95f5366f@archi.szn.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


Hello,

thanx Antony Stone :)

I think my question was wrong or I don't understand the help in Ho-TO ...

Let me again...

I want to loop information in private network with IPtables. A host in local 
network must get through public IP to another host in the same local network. 
This is required to get WWW portal information from a specified internal host 
in the same way from local and external (public) network.

I know how to do this from public network:

# iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 1025 -j DNAT -
-to-destination 192.168.1.250:80

But I tried many combinations to do this for local network and I couldn't do 
this. The comunication shud be like this:
- a computer in local network e.g. 192.168.1.10 by WWW shoud get through 
1.2.3.4:1025 and shoud be transfered to 192.168.1.250:80

           (router with NAT: eth0:192.168.1.1 , eth1:1.2.3.4)
              > 1.2.3.4:1025
             /              \
            /                \
192.168.1.10                  >192.168.1.250:80
(some host in LAN)             (WWW portal serwer)


In "10. Destination NAT Onto the Same Network" of HOWTO in second way (as I 
understood) it is only the exchange of the source of IP address to a private 
network. But this rule don't transfer comunication to local destination. Am I 
right?

Please help me with this problem ...

Archi

