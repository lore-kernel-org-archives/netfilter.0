From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Packets being natted instead of redirected
Date: Sun, 11 Jan 2004 10:01:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073833305.10191.9.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

I have a quad interface box setup, the other day after adding a forward
rule, packets that were going to eth3 sourced from the same ip
subnet(A.B.C.D/24) that should of gotten redirects started to become
natted.
The work around was to add 
iptables -t nat -I POSTROUTING -s A.B.C.D/24 -o eth3 -j ACCEPT
and the packet were no longer being natted.

This is a RH9 box with iptables-1.2.7a-2 running either
kernel-2.4.20-24.9 or kernel-2.4.20-20.9. INPUT and FORWARD are default
DROP with a masqeuaring on all 4 interfaces with exclusion
rules on three of them.


I have filed a bug report with Redhat already, so this is an FYI
for any other souls in the same boat like me.


Ted


