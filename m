From: Mark <mark@shadowpuppets.net>
Subject: how do I port forward through loopback?
Date: Tue, 18 May 2004 15:59:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AA16A7.1010706@shadowpuppets.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,
I need to port forward all traffic locally going to port 80 to port 
8040.  For the external interface eth0 this works, I thought it would 
work for the internal/loopback as well. Nothing else is turned on
, all other settings are open.

/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT 
--to-port 8040

this doesn't work for the internal network, 127.0.0.1 lo, not sure why
System info: Redhat7.3, 2.4.20 kernel, iptables-1.2.8-8.72.3
Thanks


