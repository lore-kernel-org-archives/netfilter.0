From: Bob Tellefson <bob@zooid.com>
Subject: Re: Protecting multiple webservers
Date: Wed, 12 Jan 2005 04:01:01 +0000
Message-ID: <200501120401.01332.bob@zooid.com>
References: <15069645.1105491740310.JavaMail.rct@kale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <15069645.1105491740310.JavaMail.rct@kale>
Content-Disposition: inline
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

On Wednesday 12 January 2005 01:01, gui wrote:
> Hello,
>
> I work as a computer programmer for a small university and I was asked
> to set up a firewall to protect three Apache web servers.  Each server
> runs on its own machine, each server has its own name, public IP
> address and they all listen on port 80.
>
> After reading a few howto's, I came up with the following iptables
> rules (I won't list all of them):
>
> #www.server1.edu
> -A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 80 -j DNAT --to
> 192.168.0.2:80
>
> #www.server2.edu
> -A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 8080 -j DNAT --to
> 192.168.0.3:80
>
> Those rules work fine in the little network I created in my office.

Since your web servers have valid public IP addresses DNAT will not be needed. 

Just be sure that your FORWARD rules allow the required traffic through.  If 
your default FORWARD policy is DROP, add a line such as:

iptables -A FORWARD -p TCP -m multiport --dport 80,8080 -j ACCEPT

or you may wish to filter for each host like:

iptables -A FORWARD -p TCP -d x.x.x.103 --dport 80 -j ACCEPT
iptables -A FORWARD -p TCP -d x.x.x.104 --dport 8080 -J ACCEPT

Using the first example, you can have any number of hosts listening on ports 
80 and/or 8080 without firewall changes.  The second approach would, of 
course, require individual lines for each server you wish to open up.



-- 

Bob Tellefson
Java network application development & hosting

