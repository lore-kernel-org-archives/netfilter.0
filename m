From: "Tony" <tony@games-master.co.uk>
Subject: Allow traffic through a server using iptables.
Date: Fri, 21 Apr 2006 13:31:35 +0100
Message-ID: <200604211228.k3LCSXBP006402@main.games-master.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I need some advice on allowing traffic to just pass through a server.
The traffic is all web traffic from users connected to our network.

What we have is a Cisco 7204 terminating DSL connections and we force all
web traffic to our squid proxy server.
The proxy server has the following iptables entries to forward port 80 to
the squid port 3128.

/sbin/iptables --table nat --append POSTROUTING --out-interface eth0 -j
MASQUERADE
/sbin/iptables -A PREROUTING -t nat -p tcp -s 192.168.1.0/20 --dport 80 -j
DNAT --to <IP ETH0:1>:3128


Requests from the Cisco come in on eth0 and we have another IP address on
eth1 that Squid listens on.
This all works fine and users can browse web.
However because of a couple of problems with some web sites, some that user
NTLM authentication that squid can't handle so the site fails and some
gaming sites, some users need to bypass the proxy.
Now I could do this via the Cisco by adding an entry for each IP address
that needs to be forwarded to squid and not add one for those that don't.
However that would be a lot of config to put on the router and will create a
lot of load as each packet will have to be inspected to see if it matches an
IP address in the access-list. Where at the moment it doesn't care what the
source IP address is and just forwards all web traffic to the squid server.

The best way to do this is on the squid server using iptables, but my
knowledge of iptables is limited and I can't find out how to do this.
How do I tell iptables that IP address should just be passed through the
server and not sent to squid?
Currently if I take an IP address out of the ip rule for forwarding to squid
the web requests from that IP address just fail since the server doesn't run
web and doesn't know that it should just forwarded out into the Internet.

Thanks
Tony



-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


