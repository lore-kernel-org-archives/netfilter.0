From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Protecting multiple webservers
Date: Wed, 12 Jan 2005 14:57:43 -0500
Message-ID: <1105559863.5299.12.camel@jasiiitosh.nexusmgmt.com>
References: <15069645.1105491740310.JavaMail.rct@kale>
	<200501120401.01332.bob@zooid.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501120401.01332.bob@zooid.com>
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
To: Bob Tellefson <bob@zooid.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2005-01-12 at 04:01 +0000, Bob Tellefson wrote:
> On Wednesday 12 January 2005 01:01, gui wrote:
> > Hello,
> >
> > I work as a computer programmer for a small university and I was asked
> > to set up a firewall to protect three Apache web servers.  Each server
> > runs on its own machine, each server has its own name, public IP
> > address and they all listen on port 80.
> >
> > After reading a few howto's, I came up with the following iptables
> > rules (I won't list all of them):
> >
> > #www.server1.edu
> > -A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 80 -j DNAT --to
> > 192.168.0.2:80
> >
> > #www.server2.edu
> > -A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 8080 -j DNAT --to
> > 192.168.0.3:80
> >
> > Those rules work fine in the little network I created in my office.
> 
> Since your web servers have valid public IP addresses DNAT will not be needed. 
> 
> Just be sure that your FORWARD rules allow the required traffic through.  If 
> your default FORWARD policy is DROP, add a line such as:
> 
> iptables -A FORWARD -p TCP -m multiport --dport 80,8080 -j ACCEPT
> 
> or you may wish to filter for each host like:
> 
> iptables -A FORWARD -p TCP -d x.x.x.103 --dport 80 -j ACCEPT
> iptables -A FORWARD -p TCP -d x.x.x.104 --dport 8080 -J ACCEPT
> 
> Using the first example, you can have any number of hosts listening on ports 
> 80 and/or 8080 without firewall changes.  The second approach would, of 
> course, require individual lines for each server you wish to open up.
> 
> 
> 
I may misunderstand but I'm not sure that it is so straightforward.  If
the public addresses are on the same network as the firewall public
interface, the traffic will not pass through the firewall.

There are a few options.  I have never tried to do this but one could
possible preserve the addresses and still move the devices to the
protected side of the firewall and use true proxy ARP.  I have no idea
how that interacts with iptables.  Perhaps, since it is bridging,
ebtables might help but I have never used ebtables.

I would typically move the public web servers to private addresses on a
DMZ behind the firewall.  One can do one-to-many NAT as you asked in
your original e-mail but, unless all the servers are providing the same
content and you are doing it as a load balancing mechanism, I do not
think it applies here.  You will have no way of ensuring that the
correct packet goes to the correct server.  Instead, I would do one-to-
one mappings between the web server's public address and its private
address while using iproute2 (the "ip" command) to bind the web server
public addresses to the public interface of the firewall.

This latter solution does create name resolution issues.  I typically
use a split DNS but it sounds like touching DNS is a problem for you.
Split DNS involves placing the private address in the DNS used by
internal users and the public address in the public DNS.  I believe
there is a non-split DNS solution outlined in Oskar Andreasson's
iptables tutorial(http://iptables-tutorial.frozentux.net/iptables-
tutorial.html).  Failing that, you could try the proxy ARP solution.
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


