From: Sven Schuster <schuster.sven@gmx.de>
Subject: Portscan logging?
Date: Mon, 14 Oct 2002 02:03:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DAA09B7.9040305@gmx.de>
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

Hello everybody,

I'm currently using iptables v1.2.5 on a redhat linux 7.3 machine to 
block new incoming requests on my internet router (dial on demand via 
ISDN). TCP requests are answered with a ICMP-Port-Unreachable, and all 
the rest is DROPPED by the default policy.
The thing is, I'd like to log all portscans from the "outer world", just 
to know who's interested in my system :-) I got scanlogd, compiled and 
installed it, and it really works fine, as long as the iptables rules 
are down and the default policy is ACCEPT. But when I put in all my 
rules, the scanlogd doesn't log any portscans from the internet. I think 
that is because the packets are already dropped in the kernel by the 
iptables module, am I right??

And know my question is if there's a chance to log portscans (maybe also 
the different kinds??) via some iptables-rules, an extra iptables-module 
or any other tool?? I hope that somebody knows something about it, 
because I think it's very nice to see how much people try to find holes 
in any system...it's already quite interesting to review the Apache-Logs 
everyday, with peoples thinking there's an IIS running on my system :-)))

Thanks in advance for your tips!!!

Greetings
Sven



