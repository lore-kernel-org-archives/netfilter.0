From: Chris Nuernberger <christopher.nuernberger@colorado.edu>
Subject: starcraft problems
Date: Mon, 27 May 2002 00:36:27 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020527172710.MAAY2751.rwcrmhc52.attbi.com@there>
Reply-To: christopher.nuernberger@colorado.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hey, this is a general question about getting a bunch of windows boxes behind 
a masqueraded connection to play starcraft on battle net.  

Battle net uses a few tcp connections along with udp port 6112 for each 
machine.  For some reason I am getting incredible lag behind my nat/firewall 
(slightly insecure at this point).  

Here are my rules:
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

iptables -N block
iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A block -m state --state NEW -j ACCEPT
iptables -A block -j DROP
iptables -A INPUT -j block
iptables -A FORWARD -i ! eth0 -j block

iptables -t nat -I POSTROUTING -s 10.0.0.13 -p udp --dport 6112\
 -j SNAT --to-source 12.253.91.68:9001

iptables -t nat -I POSTROUTING -s 10.0.0.13 -p udp --sport 6112\
 -j SNAT --to-source 12.253.91.68:9001

iptables -t nat -I PREROUTING -p udp -d 12.253.91.68 --dport 9001\
 -j DNAT --to-destination 10.0.0.13:6112

iptables -t nat -I PREROUTING -p udp -d 12.253.91.68 --sport 6112\
 -j DNAT --to-destination 10.0.0.13:6112


I am trying to get the stuff to work to one computer (10.0.0.13) and then I 
will generalize.  

I don't think the upd stuff is getting routed correctly, I don't exactly know 
why.  If you do offhand, that would be the best information.

If not, then:
Does the masquerade rule mess up the snat and dnat stuff?
What tools can I use to see what the router is sending out (I am not sure the 
udp packets are getting changed according to the rules)?

Thanks, Chris

