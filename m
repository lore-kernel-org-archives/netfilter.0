From: Scott Melnyk <scott@sbc.su.se>
Subject: newbie question
Date: 24 Mar 2003 16:54:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048521242.10333.55.camel@razor>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello, I hope this is not to simple to post. I have not quite got
IPTABLEs use down.

I am looking at setting up local firewalls on  a cluster of machines
(almost 100 linux boxes running RH 7.3 and 8.0).  The login nodes for
the cluster have extensive hardware based firewalling rules.  

On the rest of the cluster I would like to set IPTABLEs to accept
everything within the subnet and drop the anything from and outside
address.

My thought for setting the rules on each machine is by pushing out and
running a bash script.
Is it possible to simply set up a firewall with something as simple as:


#!/bin/bash
#

service iptables stop

iptables -F

iptables -A INPUT -m limit -j LOG
iptables -A OUTPUT -m limit -j LOG


iptables -A INPUT -s 130.xxx.xxx.128/25  ACCEPT
#rule here to drop all non 130.xxx.xxx.128/25

iptables -P FORWARD DROP
iptables -P INPUT DROP

service iptables save


We have a subnet of 130.xxx.xxx.128/255.255.255.128  
How can I define a mandatory drop of everything not in
130.xxx.xxx.128/255.255.255.128? 

Finally what risks am I taking by doing this?  Other than if someone
hacks into one of the login nodes, I realize this would then give them
access to the rest of the cluster.

All thoughts, advice and suggestions very welcome.  Thank you in
advance.

Sincerely,
Scott Melnyk


