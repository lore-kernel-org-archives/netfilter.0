From: COUSIN Marc <mcousin@sigma.fr>
Subject: mangling, marking
Date: Thu, 14 Nov 2002 12:07:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B5D7C6B6D020D511838A0060082D4CC90299BB92@kheops.sigma.fr>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi,
I'm having trouve using mangling on NATed packets:

Here's what we're trying to do:
We're trying to build a system to test the behaviour of our web applications
with slow links. For that, we decided to use the Linux QoS, and SNAT+DNAT to
redirect the packets from the linux system to the webserver. The idea behind
this is that someone contacting the linux on the 8081 port will be
transparently redirected to the 8080 of the real web server, simulating a
56k modem. on the 8082 port, it could be a 128 link, etc ...

The system is a Redhat 7.3

To create this, I used:
- DNAT and SNAT rules to redirect the packets from my port to the web
server, and SNAT the packet (so that it is returned to me and i can shape it
too) [these are OK]
- a QoS script (simple, using fwmarks) [ok too]
- And I wanted to mangle the packets to put the marks on the NATed pakets
[here comes the trouble]
I'll continue on the above example :

# For the NAT
iptables -t nat -A PREROUTING -p tcp --destination-port 8081:8090 -j DNAT
--to-destination 89.131.0.7:8080
iptables -t nat -A POSTROUTING -p tcp --destination 89.131.0.7 -j SNAT
--to-source 89.131.0.58
# For the marks
iptables -A PREROUTING -t mangle -p tcp --destination-port 8081 -j MARK
--set-mark 10 
iptables -A POSTROUTING -t mangle -p tcp --source-port 8081 -j MARK
--set-mark 11 # Trying to match the return NATed packet


The --set-mark 10 works (no surprise, very simple rule in fact)
the --set-mark 11 doesn't match. It may be normal, as I'm trying to match a
return packet on a NAT connexion. How am I supposed to match the return
packet in such a situation ?

Thanks fof helping

