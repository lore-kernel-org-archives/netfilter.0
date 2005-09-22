From: Sven Geggus <sven@gegg.us>
Subject: Strange behaviour of REDIRECT/ipt_recent
Date: Thu, 22 Sep 2005 23:18:16 +0200
Message-ID: <20050922211815.GA3701@diesel.geggus.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

the following rule works fine so far
(redirect any connection to a given IP to Port 22):

iptables -t nat -A PREROUTING  -p tcp ! --dport 22 -d $SSHIP -j REDIRECT \
--to-port 22

But now I need to restrict Connections to 3 accesses per minute to prevent
DOS-Attacken by means of Portscans:

iptables -A INPUT -i eth0 -p tcp -d $SSHIP -m state --state NEW -m recent \
--set --name SSH
iptables -A INPUT -i eth0 -p tcp -d $SSHIP -m state --state NEW -m recent \
--update --seconds 60 --hitcount 4 --rttl --name SSH -j REJECT \
--reject-with tcp-reset

Unfortunately this does not work as expected :(

It just works on port 22 but not on any other port.

I suspect that the redirect rule may change the destination IP to the
default IP of eth0, but I would consider this to be a bug.

Can you confirm this? workarounds?

Sven

P.S.: Please CC me in the reply, because I am not subscribed to the list.

-- 
wenn ping auf localhost nicht funktioniert, solltest Du zuerst TCP/IP
de- und neuinstallieren.
                            (Mario Arndt in de.comm.protocols.tcp-ip)
/me is giggls@ircnet, http://sven.gegg.us/ on the Web

