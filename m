From: Bas Verhoeven <netfilter@bserved.nl>
Subject: iptables NAT routing issues
Date: Tue, 08 May 2007 23:16:03 +0200
Message-ID: <4640E893.1010206@bserved.nl>
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

We're having some problems with iptables, have been playing ~3 hours 
with this and I need some advice.

We want to 'forward' port 80 from one ip to another ip (other server) - 
mainly to protect the webserver. One could say that you could use basic 
portforwarding for this, but as far as i know this also breaks the 
source ip for apache logs, etc. So we decided that we needed NAT'ing.

On the 'outbound' server we're doing DNAT to the webserver, which seems 
to work fine (can see the packets in tcpdump on web), and on the 
webserver we do SNAT back to the 'original' (outboundserver) ip the user 
connected to.

The last part does not work tho, the webserver still uses its own 
outgoing ip, and not the IP we specified. If I telnet to some host 
however, using the webserver source ip - it DOES rewrite the source 
address (and fails to connect, of course).

Tried various iptables commands on the servers:

OUTBOUND SERVER:

iptables -t nat -A PREROUTING -p tcp --dport 80 -d <ext_web_ip> -j DNAT 
--to-destination <webserver_ip>:80

Note: We didn't touch this as it seems to works fine.

WEBSERVER:
 
Tried various, from the detailed:
    iptables -t nat -A POSTROUTING -s <webserver_ip>-p tcp --sport 80 -j 
SNAT --to-source <ext_web_ip>:80 -o eth0

To the 'should-be-catching-it-all':
    iptables -t nat -A POSTROUTING -s <webserver_ip> -j SNAT --to-source 
<ext_web_ip>

None of those seem to do the thing we want to do tho.

Some advice would be very welcome.

Cheers,
Bas Verhoeven

