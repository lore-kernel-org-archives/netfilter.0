From: Edmund <kdtc@netfront.net>
Subject: icmp echo requests
Date: Mon, 29 Sep 2003 12:32:06 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F77B5C6.1090007@netfront.net>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Hi,

I've been monitoring the NAT router with pktstat and am a little
perturbed to see quite a lot of icmp echo requests.  Now I've
setup my Linux firewall to reject icmp echo requests.

Is this the right(?)/correct/valid/appropriate thing to do?

Furthermore (just for clarification) using tcpdump, I get incoming
icmp echo requests, but no response from my firewall(good thing
right?.  This means the firewall is dropping/rejecting the
echo requests?


Here is the line from the firewall script:


iptables -A INPUT -i eth0 -p icmp --icmp-type 8 \
        -j REJECT --reject-with icmp-host-unreachable



Btw, I'm quite bothered about the pings.  It doesn't
look right.

-- 





