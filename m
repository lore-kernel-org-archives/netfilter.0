From: Ted Gervais <ve1drg@av.eastlink.ca>
Subject: Port 25
Date: Sun, 06 Feb 2005 14:51:52 -0400 (AST)
Message-ID: <Pine.LNX.4.58.0502061446150.1174@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.netfilter.org


I have a problem getting mail packets to go out with my present firewall
setup.

What I have is a firewall that blocks/drops everything at the start and
then it goes on to allow access through specific ports. For Port 25 or
smtp to work, I have the following line which I was hoping to have mail
coming and going with this statement. However, outgoing mail can go, but
incoming has a problem:

/usr/sbin/iptables -A INPUT -p tcp --destination-port 25 -j ACCEPT

I also tried the following two lines to see if things would work but to no
avail..:

iptables -A OUTPUT -o $INTERNET -p tcp -s $IPADDR --sport $UNPRIVPORTS \
--dport 25 -j ACCEPT
iptables -A INPUT -i $INTERNET -p tcp ! --syn --sport 25 -d $IPADDR \
--dport $UNPRIVPORTS -j ACCEPT

So, if I take the firewall down, mail comes and goes just great..
What am I not seeing here??


---
The big cities of America are becoming Third World countries.
                -- Nora Ephron


Ted Gervais
Coldbrook Nova Scotia
Canada B4R1A7

