From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: IPtables FORWARD syntax question/error
Date: Fri, 09 Jul 2004 12:12:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EEC3F6.7050306@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've just started messing with iptables so I can start walling off 
certain parts of my network from the rest of it.  Right now, I have a 
test bed set up with a slackware 10 install, packet forwarding on, and 
masquerading working, so I'm moving data fine, since the box that I use 
for daily work is behind this beta box.

I have installed Squid on the box so I can log all web requests done by 
my users on the back side of the firewall.  This too works, as I can 
tail -f the log and watch myself browse.

The problem is coming from the following item that I want to implement:
I have a webcache/external proxy on the network that I want to route all 
web traffic from Squid to.  I assumed the following to work:

iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination 
xx.xx.xx.xx:8080

the thing is that it gives me the error "invalid argument".  Here's what 
else I've tried, with errors:

root@firewall:/etc# iptables -t nat -A POSTROUTING -p tcp --dport 80 -j 
DNAT --to-destination xx.xx.xx.xx:8080
iptables: Invalid argument 

root@firewall:/etc# iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT 
--to-destination xx.xx.xx.xx:8080
iptables: Invalid argument 

root@firewall:/etc# iptables -A OUTPUT -p tcp --dport 80 -j DNAT 
--to-destination xx.xx.xx.xx:8080
iptables: Invalid argument 

root@firewall:/etc# iptables -A OUTPUT -p tcp --dport 80 -j DNAT 
--to-destination xx.xx.xx.xx
iptables: Invalid argument 


All the above assumes that I should be treating Squid as a source on the 
box, which is why I'm using the OUTPUT chain.  If I'm wrong here, let me 
know.

The troubling thing that I'm having here is that I don't know what about 
the rule that I'm requesting to set up is borked, and I can't really 
find any material on it in the past few days that I've been looking.  It 
*appears* to be a valid rule, according to what I've read at 
http://iptables-tutorial.frozentux.net/ and other various 
documentation/HOW-TOs/newb help references.  I think I'm missing 
something *really* obvious, but I don't have the depth to find it.


/me sighs.  Thanks for your help in advance.

