From: "Peter Marshall" <peter.marshall@caris.com>
Subject: how to automate ip_forward
Date: Thu, 8 Jul 2004 09:00:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16ac01c464e3$1af42c20$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

Hey guys, I know this sounds stupid, but I can not seem to get the value of
/proc/sys/net/ipv4/ip_forward to be 1 after boot.  I tried putting the echo
1 > /pro...../ip_forward in my iptables script .... (BTW, I have a bash
script with my rules in it and a startup script in rc2.d that calls it)

I also tried making a separate starup script just for the ip_forward and set
it to run in as the last thing in rc2,d .....

If anyone has any suggestions, I would greatly appreciate it.

Thanks.
Peter


