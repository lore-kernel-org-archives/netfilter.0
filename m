From: John Hawley <jhawley@bgea.org>
Subject: TCPMSS workaround on OUTPUT?
Date: 26 Sep 2002 11:06:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033056377.562.49.camel@maximus>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter List <netfilter@lists.netfilter.org>

Hello.

I've been trying to figure out the solution to the old "unable to browse
to certain web site" problem for the past several days.  Am on kernel
2.4.19, iptables version 1.2.6a, on a Debian machine.

I have ipt_TCPMSS and ipt_tcpmss loaded as modules, with all the other
netfilter related stuff compiled into the kernel.

I inserted this line into my iptables.rules:

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
-j TCPMSS --clamp-mss-to-pmtu

Now, this does seem to have fixed it for clients behind this firewall.

The question is, how do I fix this for the firewall machine itself? 
Iptables does seem to accept the above rule for the OUTPUT chain, but
seems to have no effect.

The reason it'd be nice for this to work is that this is for a small
remote office in which we have Squid running on the firewall machine.  I
had to turn Squid off since the FORWARD chain fix obviously wouldn't
apply here.

Any suggestions?

-- 
John Hawley
BGEA / Info Tech Svcs
612.335.1334
jhawley@bgea.org


