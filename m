From: paddy@cobalt0.panici.net
Subject: '-t nat -A OUTPUT -j REDIRECT' changes source address ?
Date: Mon, 6 Oct 2003 19:37:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310061837.h96IbjZ02035@cobalt0.panici.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I was trying

iptables -t nat -A POSTROUTING -p udp --dport 9998 -j SNAT --to 10.0.0.3
iptables -t nat -A OUTPUT -p udp --dport 9998 -j REDIRECT --to-port 514

as part of an increasingly hair-brained scheme to tunnel syslogs to a
master server.

I should mention that the source of this connection is local - the end
of a pipeline of ssh and netcats, I'm trying to restore a usefull
source ip address based on the information in the destination port no.
while redirecting to 514/syslog.

Is this the expected behaviour ?

Any suggestions on sensible ways to do this ?

Many thanks,

Paddy

