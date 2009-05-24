From: Jesse Molina <jesse@opendreams.net>
Subject: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 03:37:19 -0700
Message-ID: <4A19235F.4070306@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hello

I've googled all over and I don't really see an obvious answer to the 
question that I have.

Here is my situation:  I have a GNU/Linux host performing very typical 
firewall duties;  two interfaces, one with an Internet public IP and 
another interface on an RFC1918 net.  Hosts on the RFC1918 net have 
iptables SNATs to public IPs and then I filter to allow some services in 
and others not, with stateful inspection in forwarding.

Normally, in order to get the multiple public IPs for these SNAT'ed 
hosts to respond to arp requests from the firewall, I simply add them as 
secondary IPs on the public interface of the firewall (eth0:1, eth0:2,...).

The problem with this is that the firewall itself runs some services and 
they have the potential to use these secondary IPs as their ephemeral 
source addresses when they reach out to something on the Internet! 
That's bad, as those IPs should be exclusively used by only the hosts 
for which they were designed for.  Assume I have no control over the 
applications which bind to a local interface to use for their outbound 
session traffic.

It seems like using these secondary addresses is not the right thing to do.

Is there a better way to make the firewall arp for these public IPs that 
are SNAT mapped to the internal RFC1918 IPs?  This is a little like 
proxy arp, but that involves the same layer 3 IP network physically 
split by interfaces (think dialup NAS), and since these are different 
networks, I don't imagine this is applicable.

What else is there?  Loop interfaces with proxy arping?  I've been 
reading about some functionality for NAT in the ip tool (ip route add 
nat ...) but it looks depreciated.  There also seems to be something 
like "ip rule add nat ..." but I've not figured that out yet.  I had 
read somewhere that "ip route add nat ..." specifically would arp for 
the translated address, but again, the man pages says that's depreciated 
in the 2.6 kernel.

How do others handle this?



-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/


