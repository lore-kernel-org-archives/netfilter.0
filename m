From: Peter <dslt03@pacbell.net>
Subject: Simple Port Translation...
Date: Mon, 04 Nov 2002 15:10:11 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC6FE53.6070803@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

First some explanation, I'm trying to proxy traffic from a linux box 
behind a very restrictive firewall, the only way to get my traffic 
through it is on port 9000; A friend with a static ip has agreed to 
allow me to proxy my traffic through his box, but he is rightly 
concerned about the security of such a simple proxy.  As you can see, or 
infer, I've set the rules so that only connections comming from my 
firewalled box are translated and only new, established and related 
connections are allowed, but being the noob I am at this I'm not sure if 
I need anything else.  Another translation to recieve and proxy 
connections to my firewalled box?  Are there more restrictive rules I 
can set so my friend doesnt have to worry?  Is there a more ellegant 
solution that I just don't have the time to persue?  Do I need a routing 
command on my Linux box?  I just need some help, since I don't have the 
time at the moment to persue this as fully as I would like to.  Any help 
would be most appreciated.

$IPTABLES -t nat -A PREROUTING -s (my ip address) --dport 9000 -j DNAT 
--to-destination (your IP here):81
$IPTABLES -A FORWARD -i (input interface) --dport 81 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT




