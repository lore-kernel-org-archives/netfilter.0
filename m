From: Casey Scott <casey@phantombsd.org>
Subject: iptables throttle via tc
Date: Thu, 20 Apr 2006 08:13:15 -0700 (PDT)
Message-ID: <4435274.01145545995631.JavaMail.root@tomcat.phantombsd.org>
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

Is it possible for iptables to use a TC tbf bucket to throttle a connection?

I have a machine with 2 NICs being used as a gateway for an internal network.
I'd like to throttle the rate the internal interface will send packets into 
the local network that originated off network (Internet). I don't want to use
iptables to drop the packets because bandwidth is still consumed by the dropped
packets.

Regards,
Casey

