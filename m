From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: IpTables, -m string, and domain names
Date: Fri, 20 Jun 2003 08:58:07 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306200852001.11642-100000@shortcircuit.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
ReSent-To: netfilter@lists.netfilter.org
ReSent-Message-ID: <Pine.LNX.4.44.0306201106210.15118@shortcircuit.dyndns.org>
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
To: netfliter@lists.netfilter.org

I need some help here.

I have a single IP from my internet provider. Any additional IPs are at 
$5/mo for each address. So to save money I'm trying to use Iptables' 
string match module from the patch-o-matic to match against domain names 
in the packet. However, it doesn't seem to be working. Here's an example. 
in the PREROUTIG chain:

iptables -A PREROUTING -m string --string 'mydomain1.org' -m tcp -p tcp --dport 23 -j DNAT --to-destination 192.168.0.10:8023


so if I try and telnet (port 23) to mydomain1.com, it should be redirected 
to 192.168.0.10, port 8023, right? No go. I get dropped into the local 
machine's telnet daemon. The rule didn't match. Why? Here's how the entry 
is listed in my /etc/hosts:

12.210.176.53		mydomain1 mydomain1.org
12.210.176.53 		mydomain2 mydomain2.org

Is something wrong here? Is there a better way to forward traffic based on 
the domain name in the packet?


Thanks!

--- Dan




