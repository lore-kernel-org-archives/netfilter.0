From: Marcus Andersson <iptables@wimlet.se>
Subject: Remove established connections!
Date: Thu, 25 Nov 2004 10:26:50 +0100
Message-ID: <1101374811.1347.49.camel@oracle>
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

Hi 

I have a beowulfcluster on an internal masqueraded net (NAT) which I use
for Counterstrike servers. 
When I launch a server i keep track of which computer on the internal
net that it runs on and makes a dnat forwarding with iptables for the
specified port from the master server (external adress) to the computer
on the internal net. If I restart the server it will most likely be
launched on an onother computer on the internal net and I create a new
forward for the port to the internal computer. So far so good :)

The problem arouses if a person has been connected to a server and that
server is then relocated. His connections are still being routed to the
former computer wich now don't have a server listening on that port. All
new connections on the other hand is forwarded to the correct computer. 

Is there any way I can remove these remembered connections so that when
the rule is rewritten it will actually send all traffic that comes in on
a specified port to the correct adress? 


-- 
/Marcus Andersson
Wimlet Consulting
mail: marcus@wimlet.se
phone: 0707-141716
web: www.wimlet.se


