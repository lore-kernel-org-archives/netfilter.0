From: Anthony DiSante <theant@nodivisions.com>
Subject: forwarded ports become "filtered" instead of "open"
Date: Tue, 09 Aug 2005 15:30:55 -0400
Message-ID: <42F9046F.9090004@nodivisions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I have two ~identical Debian systems running iptables, and I've been having 
trouble getting them to communicate with each other fully.  Both machines 
are running SSH and Rsync servers, and one of them is running as a Condor 
master, so it has a process listening on port 9618.

Both systems have the same /etc/hosts looking like this:

	127.0.0.1 localhost localhost.localdomain
	10.0.0.12 box1.fqdn.com box1
	10.0.0.13 box2.fqdn.com box2

Having the FQDNs resolving to the private IPs seems a little screwy to me, 
but the network is set up (by someone else) so that box1.fqdn.com actually 
does properly map to that system's public IP.

Now, any system on the internet outside our LAN can access the servers on 
these systems with no problems.  From any such outside system, an nmap scan 
will show ports 22,873,9618 as "open."

The problem is that for some reason, these two systems can't talk to each 
other over these ports, and neither one can even access those ports on 
itself.  nmapping box1 from box1, or from box2, shows all three ports as 
"filtered" and indeed the servers are inaccessible.

Now here's where it gets weird, and I'm thinking the firewall rules must be 
messed up.  SSHing from either system to the other will always fail with a 
timeout, but if I do this:

	ssh from box1 to box2 [which fails]

And then this:

	ssh from box2 to box1 [which also fails]

...THEN when I SSH from box1 to box2 again, it suddenly works fine -- for a 
few minutes, after which the same situation occurs.  I know the firewall has 
some concept of a "session" or a "state" and I'm assuming that the 
back-and-forth is somehow enabling SSH to work temporarily as explained above.

I've edited /etc/narc/narc.conf like this:

	ALLOW_TCP_EXT="ssh,rsync,http,9618"
	ALLOW_TCP_LAN"ssh,rsync,http,9618"

...and when I restart the firewall it says this:

	Allow external connections on eth0 TCP ports: ssh,rsync,http,9618
	Allow LAN connections on eth0 TCP ports: ssh,http,rsync,9618

...yet this problem persists.

And when I disable the firewall, the problems goes away.

Can anyone offer some pointers here?  I imagine more of my narc.conf and/or 
iptables' output would be helpful, but rather than me attaching the whole 
thing right now, just ask if you want me to post any of that.

Thanks,
Anthony DiSante
http://encodable.com/
http://nodivisions.com/

