From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: A replacement for rp_filter with iptables (config help needed)
Date: Fri, 01 Jul 2005 17:55:20 -0400
Message-ID: <1120254920.3544.2.camel@localhost>
References: <42C37413.3010504@networker.co.nz>
	<ab5428f705063022474352682b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ab5428f705063022474352682b@mail.gmail.com>
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
To: netfilter@lists.netfilter.org, Simon <dev@networker.co.nz>

In our default configuration for the ISCS network security management
project (http://iscs.sourceforge.net), we generate rules to protect
against spoofing from both the outside and the inside (to ensure we are
good Internet citizens!).  Although the rules are automatically
generated, they tend to look something like this:

iptables -t mangle -A PREROUTING -i ! eth1 -s
2xx.xx.xxx.224/255.255.255.240 -j DROP
iptables -t mangle -A PREROUTING -i eth1 -m ttl --ttl 1 -j DROP
iptables -t mangle -A PREROUTING -i eth0 -j ProtectionMangleSpoof
iptables -t mangle -A ProtectionMangleSpoof -i eth0 -j DROP
iptables -t mangle -A PREROUTING -i ! eth0 -s 10.6.0.0/255.255.0.0 -j
DROP
iptables -t mangle -A PREROUTING -i ! eth0 -s 10.7.0.0/255.255.0.0 -j
DROP
iptables -t mangle -I ProtectionMangleSpoof 1 -i eth0 -s
10.6.0.0/255.255.0.0 -j RETURN
iptables -t mangle -I ProtectionMangleSpoof 1 -i eth0 -s
10.7.0.0/255.255.0.0 -j RETURN

Where eth0 is the private interface and eth1 is the Internet interface.
Hope that helps - John

On Fri, 2005-07-01 at 11:47 +0600, tahmeed wrote: 
> hi,
> 
> i am not an expert in iptables - actually am studying it - 
> 
> one thing - what rules did u set for the new chain MYSQL & SPOOF -
> unless & untill u set up rules for any NEW chains u create - its not
> going to work.
> 
> 
> 
> On 6/30/05, Simon <dev@networker.co.nz> wrote:
> > Hi There,
> > 
> > We are debian sarge with two ethernet cards.. To get eth1 (on a seperate 
> > subnet) working correctly, ive had to change 
> > /proc/sys/net/ipv4/conf/eth1/rp_filter to 0. Now i need a simple 
> > solution to protect against spoofing attacks on this interface... I have 
> > an example setup, but i want to make sure i have it correct.. can 
> > someone confirm for me?...
> > 
> > Note, this was a small script to block the mysql port on the server, but 
> > then enable for certain time/ip dynamically by adding/removing chains.
> > 
> > iptables -F
> > iptables -A INPUT -i lo -j ACCEPT
> > iptables -N MYSQL
> > iptables -N SPOOF
> > iptables -A INPUT -p tcp --dport 3306 -j MYSQL
> > iptables -A SPOOF -i eth1 -j SPOOF
> > iptables -A INPUT -p tcp --dport 3306 -j REJECT --reject-with tcp-reset
> > 
> > Is this correct - or have i got it ALL wrong.
> > 
> > Thanks
> > 
> > Simon
> > 
> > 
> 
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


