From: TCP Help <tcphelp@streamlined-dev.com>
Subject: ip_conntrack help?
Date: Tue, 29 Mar 2005 14:36:16 -0500
Message-ID: <1112124359.9179.146.camel@gigster.bigred.org>
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

Perhaps I am misunderstanding something here - but I was seeking to use
the timeout from connection tracking for the close_wait state:
   net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait

I've set this value at 300, and it seems to have little effect.
(it was 60, but I've read it is also supposed to be as high as 12 hours)

I have an application that is leaving many sockets in the CLOSE_WAIT
state for extended periods of time.   I know the solution is to work
with the application vendor and get him to correct this problem in his
application.   I am trying to do this - but it is slow going - and the
vendor points out that this is not a problem with FreeBSD, possibly
because they've tuned some of the network parameters with ndd.  

Is this the correct setting to use for timing out sockets in the
CLOSE_WAIT state?
Do I need to enable connection tracking somehow for this particular
port (iptables -A INPUT -p tcp -m state --state ESTABLISHED --dport
$PORTNUM -j ACCEPT)?  
Or is this not even the type of thing this timeout is supposed to be
able to do?    
Is there another option besides tcp-window-tracking that I should look
at?

Any help / pointers are greatly appreciated.

Thanks.


